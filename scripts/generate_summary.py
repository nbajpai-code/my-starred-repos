#!/usr/bin/env python3
"""
Generate Daily Summary Report
Creates markdown summary of arXiv papers
"""

import json
from datetime import datetime
from pathlib import Path
from typing import List, Dict, Any


class SummaryGenerator:
    def __init__(self):
        self.papers_dir = Path("arxiv-papers")
        self.summaries_dir = Path("daily-summaries")
        self.summaries_dir.mkdir(exist_ok=True)

    def load_latest_papers(self) -> List[Dict[str, Any]]:
        """Load latest papers from JSON"""
        latest_file = self.papers_dir / "papers-latest.json"

        if not latest_file.exists():
            print("No papers found")
            return []

        with open(latest_file, 'r') as f:
            return json.load(f)

    def generate_markdown(self, papers: List[Dict[str, Any]]) -> str:
        """Generate markdown summary"""
        date_str = datetime.now().strftime('%Y-%m-%d')

        md = f"""# 📚 arXiv Daily Digest - {date_str}

> Found **{len(papers)}** relevant papers today

---

## 📊 Summary Statistics

- **Total Papers:** {len(papers)}
- **Categories:** {len(set(p['primary_category'] for p in papers))}
- **Top Category:** {self.get_top_category(papers)}
- **Average Relevance:** {self.get_avg_relevance(papers):.2f}

---

## 🔥 Top Papers

"""

        # Top 10 papers by relevance
        top_papers = sorted(papers, key=lambda x: x.get('relevance_score', 0), reverse=True)[:10]

        for i, paper in enumerate(top_papers, 1):
            md += f"\n### {i}. {paper['title']}\n\n"
            md += f"**Authors:** {', '.join(paper['authors'][:3])}"
            if len(paper['authors']) > 3:
                md += f" et al. ({len(paper['authors'])} total)"
            md += "\n\n"

            md += f"**Published:** {paper['published'][:10]} | "
            md += f"**Category:** {paper['primary_category']} | "
            md += f"**Relevance:** {paper.get('relevance_score', 0):.2f}\n\n"

            md += f"**Links:** [arXiv]({paper['arxiv_url']}) | [PDF]({paper['pdf_url']})\n\n"

            # AI Summary if available
            if 'ai_summary' in paper:
                md += f"**Summary:** {paper['ai_summary']}\n\n"
            else:
                # Truncated abstract
                abstract = paper['abstract'][:300].replace('\n', ' ')
                md += f"**Abstract:** {abstract}...\n\n"

            md += "---\n"

        # Papers by category
        md += "\n## 📂 Papers by Category\n\n"

        by_category = {}
        for paper in papers:
            cat = paper['primary_category']
            if cat not in by_category:
                by_category[cat] = []
            by_category[cat].append(paper)

        for category, cat_papers in sorted(by_category.items()):
            md += f"\n### {category} ({len(cat_papers)} papers)\n\n"

            for paper in cat_papers[:5]:  # Top 5 per category
                md += f"- [{paper['title']}]({paper['arxiv_url']}) "
                md += f"(Score: {paper.get('relevance_score', 0):.2f})\n"

        md += f"\n---\n\n*Generated on {datetime.now().strftime('%Y-%m-%d %H:%M:%S UTC')}*\n"

        return md

    def get_top_category(self, papers: List[Dict[str, Any]]) -> str:
        """Get most common category"""
        if not papers:
            return "N/A"

        categories = [p['primary_category'] for p in papers]
        return max(set(categories), key=categories.count)

    def get_avg_relevance(self, papers: List[Dict[str, Any]]) -> float:
        """Calculate average relevance score"""
        if not papers:
            return 0.0

        scores = [p.get('relevance_score', 0) for p in papers]
        return sum(scores) / len(scores)

    def save_summary(self, content: str, date_str: str):
        """Save summary to file"""
        # Date-specific file
        summary_file = self.summaries_dir / f"summary-{date_str}.md"
        with open(summary_file, 'w') as f:
            f.write(content)

        # Latest file (for easy access)
        latest_file = self.summaries_dir / "summary-latest.md"
        with open(latest_file, 'w') as f:
            f.write(content)

        print(f"✓ Summary saved to {summary_file}")

    def update_main_readme(self, papers: List[Dict[str, Any]]):
        """Update main README with latest stats"""
        date_str = datetime.now().strftime('%Y-%m-%d')

        readme_content = f"""# 📚 arXiv Daily Papers

**Last Updated:** {date_str}

## 🎯 Latest Digest

Found **{len(papers)}** relevant papers today!

### 📊 Quick Stats

- **Total Papers Today:** {len(papers)}
- **Top Category:** {self.get_top_category(papers)}
- **Average Relevance:** {self.get_avg_relevance(papers):.2f}

### 🔥 Top 5 Papers

"""

        top_5 = sorted(papers, key=lambda x: x.get('relevance_score', 0), reverse=True)[:5]

        for i, paper in enumerate(top_5, 1):
            readme_content += f"{i}. **{paper['title']}** - [arXiv]({paper['arxiv_url']})\n"
            readme_content += f"   - {', '.join(paper['authors'][:2])}\n"
            readme_content += f"   - Relevance: {paper.get('relevance_score', 0):.2f}\n\n"

        readme_content += f"\n[📖 View Full Daily Digest](daily-summaries/summary-latest.md)\n\n"
        readme_content += f"---\n\n"
        readme_content += f"*Automatically updated by GitHub Actions*\n"

        with open("README_ARXIV_DAILY.md", 'w') as f:
            f.write(readme_content)

        print("✓ Updated README_ARXIV_DAILY.md")

    def run(self):
        """Main execution"""
        print("=" * 80)
        print("📝 Generating Daily Summary")
        print("=" * 80)

        papers = self.load_latest_papers()

        if not papers:
            print("No papers to summarize")
            return

        print(f"\n📊 Processing {len(papers)} papers...")

        # Generate markdown summary
        date_str = datetime.now().strftime('%Y-%m-%d')
        summary_md = self.generate_markdown(papers)
        self.save_summary(summary_md, date_str)

        # Update main README
        self.update_main_readme(papers)

        print("\n✅ Summary generation complete!")
        print("=" * 80)


if __name__ == "__main__":
    generator = SummaryGenerator()
    generator.run()
