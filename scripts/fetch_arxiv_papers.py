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

        if self.config['summarization']['enabled']:
            provider = self.config['summarization']['provider']

            if provider == 'openai' and OPENAI_AVAILABLE:
                api_key = os.getenv('OPENAI_API_KEY')
                if api_key:
                    self.openai_client = openai.OpenAI(api_key=api_key)
                    print("✓ OpenAI client initialized")

            elif provider == 'anthropic' and ANTHROPIC_AVAILABLE:
                api_key = os.getenv('ANTHROPIC_API_KEY')
                if api_key:
                    self.anthropic_client = anthropic.Anthropic(api_key=api_key)
                    print("✓ Anthropic client initialized")

    def build_search_queries(self) -> List[str]:
        """Build search queries from research interests"""
        queries = []

        for category, keywords in self.config['research_interests'].items():
            for keyword in keywords:
                # Build query for specific arXiv categories
                cat_query = ' OR '.join([f'cat:{cat}' for cat in self.config['arxiv_categories']])
                query = f'({cat_query}) AND all:"{keyword}"'
                queries.append(query)

        return queries

    def fetch_papers(self, query: str, max_results: int = 100) -> List[Dict[str, Any]]:
        """Fetch papers from arXiv"""
        print(f"Fetching papers for query: {query[:50]}...")

        # Calculate date range
        days_back = self.config['filters']['days_to_look_back']
        start_date = datetime.now() - timedelta(days=days_back)

        client = arxiv.Client()
        search = arxiv.Search(
            query=query,
            max_results=max_results,
            sort_by=arxiv.SortCriterion.SubmittedDate,
            sort_order=arxiv.SortOrder.Descending
        )

        papers = []
        for result in client.results(search):
            # Filter by date
            if result.published.replace(tzinfo=None) < start_date:
                continue

            paper = {
                'id': result.entry_id.split('/')[-1],
                'title': result.title,
                'authors': [author.name for author in result.authors],
                'abstract': result.abstract,
                'published': result.published.isoformat(),
                'updated': result.updated.isoformat(),
                'categories': result.categories,
                'pdf_url': result.pdf_url,
                'arxiv_url': result.entry_id,
                'comment': result.comment,
                'journal_ref': result.journal_ref,
                'primary_category': result.primary_category,
            }
            papers.append(paper)

        print(f"  Found {len(papers)} papers")
        return papers

    def generate_ai_summary(self, paper: Dict[str, Any]) -> str:
        """Generate AI-powered summary of the paper"""
        if not self.config['summarization']['enabled']:
            return paper['abstract'][:200] + "..."

        provider = self.config['summarization']['provider']
        model = self.config['summarization']['model']
        max_length = self.config['summarization']['max_summary_length']

        prompt = f"""Summarize this research paper in {max_length} words or less.
Focus on the key contribution, methodology, and results.

Title: {paper['title']}

Abstract: {paper['abstract']}

Summary (max {max_length} words):"""

        try:
            if provider == 'openai' and self.openai_client:
                response = self.openai_client.chat.completions.create(
                    model=model,
                    messages=[
                        {"role": "system", "content": "You are a research paper summarizer. Be concise and technical."},
                        {"role": "user", "content": prompt}
                    ],
                    max_tokens=max_length * 2,
                    temperature=0.3
                )
                return response.choices[0].message.content.strip()

            elif provider == 'anthropic' and self.anthropic_client:
                response = self.anthropic_client.messages.create(
                    model=model,
                    max_tokens=max_length * 2,
                    messages=[
                        {"role": "user", "content": prompt}
                    ],
                    temperature=0.3
                )
                return response.content[0].text.strip()

        except Exception as e:
            print(f"  Warning: AI summarization failed: {e}")

        # Fallback to truncated abstract
        return paper['abstract'][:max_length * 5] + "..."

    def calculate_relevance_score(self, paper: Dict[str, Any]) -> float:
        """Calculate relevance score based on keywords"""
        score = 0.0
        count = 0

        text = (paper['title'] + ' ' + paper['abstract']).lower()

        for category, keywords in self.config['research_interests'].items():
            for keyword in keywords:
                if keyword.lower() in text:
                    score += 1.0
                    count += 1

        # Normalize score
        if count > 0:
            score = min(score / 10.0, 1.0)  # Cap at 1.0

        return score

    def filter_papers(self, papers: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """Filter papers based on relevance and exclusions"""
        filtered = []
        exclude_keywords = self.config['filters'].get('exclude_keywords', [])
        min_score = self.config['filters']['min_relevance_score']

        for paper in papers:
            # Calculate relevance
            paper['relevance_score'] = self.calculate_relevance_score(paper)

            # Check exclusions
            text = (paper['title'] + ' ' + paper['abstract']).lower()
            if any(keyword.lower() in text for keyword in exclude_keywords):
                continue

            # Check minimum relevance
            if paper['relevance_score'] >= min_score:
                filtered.append(paper)

        return sorted(filtered, key=lambda x: x['relevance_score'], reverse=True)

    def save_papers(self, papers: List[Dict[str, Any]], date_str: str):
        """Save papers to JSON file"""
        output_file = self.papers_dir / f"papers-{date_str}.json"

        with open(output_file, 'w') as f:
            json.dump(papers, f, indent=2)

        print(f"✓ Saved {len(papers)} papers to {output_file}")

    def run(self):
        """Main execution flow"""
        print("=" * 80)
        print("🚀 arXiv Daily Paper Crawler")
        print("=" * 80)

        date_str = datetime.now().strftime('%Y-%m-%d')

        # Build queries
        queries = self.build_search_queries()
        print(f"\n📊 Built {len(queries)} search queries")

        # Fetch papers
        all_papers = []
        seen_ids = set()

        max_per_cat = self.config['filters']['max_papers_per_category']

        for query in queries[:10]:  # Limit to first 10 queries to avoid rate limits
            papers = self.fetch_papers(query, max_results=max_per_cat)

            # Deduplicate
            for paper in papers:
                if paper['id'] not in seen_ids:
                    seen_ids.add(paper['id'])
                    all_papers.append(paper)

        print(f"\n📚 Total unique papers found: {len(all_papers)}")

        # Filter papers
        filtered_papers = self.filter_papers(all_papers)
        print(f"✓ After filtering: {len(filtered_papers)} papers")

        # Generate AI summaries
        if self.config['summarization']['enabled']:
            print("\n🤖 Generating AI summaries...")
            for i, paper in enumerate(filtered_papers[:20], 1):  # Limit to top 20
                print(f"  [{i}/20] {paper['title'][:50]}...")
                paper['ai_summary'] = self.generate_ai_summary(paper)

        # Save papers
        self.save_papers(filtered_papers, date_str)

        # Save latest for easy access
        latest_file = self.papers_dir / "papers-latest.json"
        with open(latest_file, 'w') as f:
            json.dump(filtered_papers, f, indent=2)

        print(f"\n✅ Crawling complete! Found {len(filtered_papers)} relevant papers.")
        print("=" * 80)


if __name__ == "__main__":
    crawler = ArxivCrawler()
    crawler.run()
