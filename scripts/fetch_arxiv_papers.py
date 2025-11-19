#!/usr/bin/env python3
"""
arXiv Daily Paper Crawler
Fetches papers from arXiv based on configured interests and generates summaries
"""

import os
import sys
import json
import yaml
import arxiv
import requests
from datetime import datetime, timedelta
from pathlib import Path
from typing import List, Dict, Any
import hashlib

# Optional AI providers
try:
    import openai
    OPENAI_AVAILABLE = True
except ImportError:
    OPENAI_AVAILABLE = False

try:
    import anthropic
    ANTHROPIC_AVAILABLE = True
except ImportError:
    ANTHROPIC_AVAILABLE = False


class ArxivCrawler:
    def __init__(self, config_path: str = "arxiv-config.yml"):
        """Initialize the arXiv crawler with configuration"""
        self.config = self.load_config(config_path)
        self.papers_dir = Path("arxiv-papers")
        self.summaries_dir = Path("daily-summaries")
        self.papers_dir.mkdir(exist_ok=True)
        self.summaries_dir.mkdir(exist_ok=True)

        # Initialize AI clients if available
        self.setup_ai_clients()

    def load_config(self, config_path: str) -> Dict[str, Any]:
        """Load configuration from YAML file"""
        with open(config_path, 'r') as f:
            return yaml.safe_load(f)

    def setup_ai_clients(self):
        """Set up AI clients for summarization"""
        self.openai_client = None
        self.anthropic_client = None

        if not self.config['summarization']['enabled']:
            return

        provider = self.config['summarization']['provider']
        api_key = None

        try:
            if provider == 'openai' and OPENAI_AVAILABLE:
                api_key = os.getenv('OPENAI_API_KEY')
                if not api_key:
                    print("  Warning: OPENAI_API_KEY not found. Summarization will be skipped.")
                else:
                    self.openai_client = openai.OpenAI(api_key=api_key)
                    print("✓ OpenAI client initialized")

            elif provider == 'anthropic' and ANTHROPIC_AVAILABLE:
                api_key = os.getenv('ANTHROPIC_API_KEY')
                if not api_key:
                    print("  Warning: ANTHROPIC_API_KEY not found. Summarization will be skipped.")
                else:
                    self.anthropic_client = anthropic.Anthropic(api_key=api_key)
                    print("✓ Anthropic client initialized")
        except Exception as e:
            print(f"  Warning: Failed to initialize AI client for {provider}: {e}")
            if provider == 'openai':
                self.openai_client = None
            elif provider == 'anthropic':
                self.anthropic_client = None

    def build_search_queries(self) -> List[str]:
        """Build search queries from research interests"""
        queries = []

        # Combine all keywords for a broader initial search
        all_keywords = []
        for category, keywords in self.config['research_interests'].items():
            all_keywords.extend([f'all:"{kw}"' for kw in keywords])

        if not all_keywords:
            return []

        # Create a single large query for all keywords
        keyword_query = " OR ".join(all_keywords)
        cat_query = ' OR '.join([f'cat:{cat}' for cat in self.config['arxiv_categories']])
        
        # Final query combines categories and keywords
        final_query = f"({cat_query}) AND ({keyword_query})"
        queries.append(final_query)

        return queries

    def fetch_papers(self, query: str, max_results: int = 100) -> List[Dict[str, Any]]:
        """Fetch papers from arXiv"""
        print(f"Fetching papers for query: {query[:80]}...")

        # Calculate date range
        days_back = self.config['filters']['days_to_look_back']
        start_date = datetime.now() - timedelta(days=days_back)
        
        # Ensure the client is only initialized once if needed elsewhere
        if not hasattr(self, 'arxiv_client'):
            self.arxiv_client = arxiv.Client(
                page_size=max_results,
                delay_seconds=self.config['advanced']['rate_limit_delay'],
                num_retries=self.config['advanced']['retry_attempts']
            )

        search = arxiv.Search(
            query=query,
            max_results=max_results,
            sort_by=arxiv.SortCriterion.SubmittedDate,
            sort_order=arxiv.SortOrder.Descending
        )

        papers = []
        try:
            for result in self.arxiv_client.results(search):
                # Filter by submission date
                if result.published.replace(tzinfo=None) < start_date.replace(tzinfo=None):
                    continue

                paper = {
                    'id': result.get_short_id(),
                    'title': result.title,
                    'authors': [author.name for author in result.authors],
                    'abstract': result.summary,
                    'published': result.published.isoformat(),
                    'updated': result.updated.isoformat(),
                    'categories': result.categories,
                    'pdf_url': result.pdf_url,
                    'arxiv_url': result.entry_id,
                    'comment': result.comment,
                }
                papers.append(paper)
        except Exception as e:
            print(f"  Error fetching from arXiv: {e}")

        print(f"  Found {len(papers)} papers")
        return papers

    def generate_ai_summary(self, paper: Dict[str, Any]) -> str:
        """Generate AI-powered summary of the paper"""
        provider = self.config['summarization'].get('provider', 'none')
        
        # Return abstract if summarization is disabled or misconfigured
        if not self.config['summarization']['enabled'] or provider == 'none':
            return paper['abstract'][:300] + "..."

        # Check if the correct client is available
        client = None
        if provider == 'openai':
            client = self.openai_client
        elif provider == 'anthropic':
            client = self.anthropic_client
        
        if not client:
            # print(f"  Warning: {provider.capitalize()} client not available. Skipping summary.")
            return paper['abstract'][:300] + "..."

        model = self.config['summarization']['model']
        max_length = self.config['summarization']['max_summary_length']

        prompt = f"""Summarize this research paper's abstract in {max_length} words or less.
Focus on the core contribution, methodology, and key results. Be concise and technical.

Title: {paper['title']}
Abstract: {paper['abstract']}

Concise Summary (max {max_length} words):"""

        try:
            if provider == 'openai':
                response = client.chat.completions.create(
                    model=model,
                    messages=[
                        {"role": "system", "content": "You are a research paper summarizer. Your goal is to provide a concise, technical summary."},
                        {"role": "user", "content": prompt}
                    ],
                    max_tokens=max_length + 50,  # Allow for some buffer
                    temperature=0.2,
                    top_p=0.8
                )
                return response.choices[0].message.content.strip()

            elif provider == 'anthropic':
                response = client.messages.create(
                    model=model,
                    max_tokens=max_length + 50,
                    messages=[{"role": "user", "content": prompt}],
                    temperature=0.2,
                    top_p=0.8
                )
                return response.content[0].text.strip()

        except openai.APIError as e:
            print(f"  Warning: OpenAI API error: {e}. Falling back to abstract.")
        except anthropic.APIError as e:
            print(f"  Warning: Anthropic API error: {e}. Falling back to abstract.")
        except Exception as e:
            print(f"  Warning: An unexpected error occurred during summarization: {e}")

        # Fallback to truncated abstract
        return paper['abstract'][:max_length * 4] + "..."

    def calculate_relevance_score(self, paper: Dict[str, Any]) -> float:
        """Calculate relevance score based on keyword matches in title and abstract"""
        score = 0.0
        text = (paper['title'] + ' ' + paper['abstract']).lower()
        
        all_keywords = {kw.lower() for cat_kws in self.config['research_interests'].values() for kw in cat_kws}
        
        for keyword in all_keywords:
            if keyword in text:
                score += 1.0
        
        # Simple normalization
        return min(score / 5.0, 1.0) # Normalize based on ~5 keyword matches

    def filter_papers(self, papers: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Filter and sort papers based on relevance and other criteria"""
        filtered = []
        seen_ids = set()
        exclude_keywords = [kw.lower() for kw in self.config['filters'].get('exclude_keywords', [])]
        min_score = self.config['filters']['min_relevance_score']

        for paper in papers:
            if paper['id'] in seen_ids:
                continue
            
            # Calculate relevance score
            paper['relevance_score'] = self.calculate_relevance_score(paper)

            # Check exclusion criteria
            text = (paper['title'] + ' ' + paper['abstract']).lower()
            if any(ex_kw in text for ex_kw in exclude_keywords):
                continue
            
            # Check minimum score
            if paper['relevance_score'] >= min_score:
                filtered.append(paper)
                seen_ids.add(paper['id'])
        
        # Sort by relevance and then by publication date
        return sorted(filtered, key=lambda p: (p['relevance_score'], p['published']), reverse=True)

    def save_papers(self, papers: List[Dict[str, Any]], date_str: str):
        """Save papers to JSON file"""
        output_file = self.papers_dir / f"papers-{date_str}.json"

        with open(output_file, 'w') as f:
            json.dump(papers, f, indent=2, ensure_ascii=False)

        print(f"✓ Saved {len(papers)} papers to {output_file}")

    def run(self):
        """Main execution flow"""
        print("=" * 80)
        print(f"🚀 arXiv Daily Paper Crawler - {datetime.now().strftime('%Y-%m-%d')}")
        print("=" * 80)

        date_str = datetime.now().strftime('%Y-%m-%d')

        # Build search query
        queries = self.build_search_queries()
        if not queries:
            print("No search queries defined. Exiting.")
            return

        query = queries[0] # Using a single combined query
        
        # Fetch, filter, and summarize papers
        max_papers = self.config['filters']['max_papers_per_category']
        all_papers = self.fetch_papers(query, max_results=max_papers * 2) # Fetch more to have enough for filtering
        
        print(f"\n📚 Found {len(all_papers)} initial papers. Filtering and sorting...")
        filtered_papers = self.filter_papers(all_papers)
        print(f"✓ Filtered down to {len(filtered_papers)} relevant papers.")

        # Limit papers after filtering
        filtered_papers = filtered_papers[:max_papers]

        if self.config['summarization']['enabled']:
            print("\n🤖 Generating AI summaries for top papers...")
            # Limit summarization to avoid high costs/rate limits
            limit_summaries = self.config['summarization'].get('limit', 20)
            
            for i, paper in enumerate(filtered_papers[:limit_summaries], 1):
                print(f"  [{i}/{limit_summaries}] Summarizing: {paper['title'][:60]}...")
                paper['ai_summary'] = self.generate_ai_summary(paper)
        
        # Save final list of papers
        self.save_papers(filtered_papers, date_str)

        # Update the 'latest' file
        latest_file = self.papers_dir / "papers-latest.json"
        with open(latest_file, 'w') as f:
            json.dump(filtered_papers, f, indent=2, ensure_ascii=False)

        print(f"\n✅ Crawling complete! Processed {len(filtered_papers)} papers.")
        print("=" * 80)


if __name__ == "__main__":
    try:
        crawler = ArxivCrawler()
        crawler.run()
    except Exception as e:
        print(f"An unexpected error occurred: {e}", file=sys.stderr)
        sys.exit(1)
