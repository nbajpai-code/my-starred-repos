# 🚀 arXiv Daily Crawler Setup Guide

Complete guide to setting up automated daily arXiv paper tracking with GitHub Actions.

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [Configuration](#configuration)
3. [GitHub Actions Setup](#github-actions-setup)
4. [API Keys Setup](#api-keys-setup)
5. [Testing Locally](#testing-locally)
6. [Customization](#customization)
7. [Troubleshooting](#troubleshooting)

---

## 🎯 Quick Start

### Step 1: Enable GitHub Actions

1. Go to your repository: `https://github.com/YOUR_USERNAME/my-starred-repos`
2. Click on **Actions** tab
3. Enable GitHub Actions if not already enabled
4. Find the workflow: **"arXiv Daily Paper Crawler"**
5. Click **"Run workflow"** to test manually

### Step 2: Configure Your Research Interests

Edit `arxiv-config.yml`:

```yaml
research_interests:
  ai_ml:
    - "large language model"
    - "GPT"
    - "transformer"
  # Add more keywords for your specific interests
```

### Step 3: Set Up API Keys (Optional but Recommended)

For AI-powered summaries, add API keys as GitHub Secrets:

1. Go to **Settings → Secrets and variables → Actions**
2. Click **"New repository secret"**
3. Add one of these:
   - `OPENAI_API_KEY` - for OpenAI (GPT-4, GPT-3.5)
   - `ANTHROPIC_API_KEY` - for Anthropic (Claude)

---

## ⚙️ Configuration

### Basic Configuration (`arxiv-config.yml`)

```yaml
# Research Areas - Customize these!
research_interests:
  ai_ml:
    - "large language model"
    - "LLM"
    - "GPT"
    - "transformer"

  reinforcement_learning:
    - "reinforcement learning"
    - "RLHF"
    - "policy gradient"

  mlops:
    - "MLOps"
    - "model serving"
    - "model deployment"

# arXiv categories to monitor
arxiv_categories:
  - "cs.AI"   # Artificial Intelligence
  - "cs.CL"   # Computation and Language
  - "cs.CV"   # Computer Vision
  - "cs.LG"   # Machine Learning

# Filtering
filters:
  max_papers_per_category: 100
  min_relevance_score: 0.5
  days_to_look_back: 1

# AI Summarization
summarization:
  enabled: true
  provider: "openai"  # or "anthropic"
  model: "gpt-4o-mini"
  max_summary_length: 200
```

### Advanced Settings

```yaml
# Notifications
notifications:
  github_issue:
    enabled: true
    create_daily_issue: true

  email:
    enabled: false
    recipients:
      - "your-email@example.com"

# Output formats
output:
  generate_markdown: true
  generate_json: true
  group_by: "category"  # or "date", "relevance"
```

---

## 🔧 GitHub Actions Setup

### Workflow Schedule

The workflow runs automatically:
- **Daily at 9 AM UTC (4 AM EST)**
- Can also be triggered manually

To change schedule, edit `.github/workflows/arxiv-daily-crawler.yml`:

```yaml
on:
  schedule:
    - cron: '0 9 * * *'  # Change this
  workflow_dispatch:
```

### Workflow Permissions

The workflow needs these permissions (already configured):
- ✅ `contents: write` - to commit new papers
- ✅ `issues: write` - to create daily digest issues
- ✅ `pages: write` - for GitHub Pages (optional)

---

## 🔑 API Keys Setup

### Option 1: OpenAI (Recommended)

**Cost:** ~$0.01-0.10 per day (using GPT-4o-mini)

1. Get API key: https://platform.openai.com/api-keys
2. Add to GitHub Secrets as `OPENAI_API_KEY`
3. Configure in `arxiv-config.yml`:
```yaml
summarization:
  enabled: true
  provider: "openai"
  model: "gpt-4o-mini"  # Cheap and fast
```

### Option 2: Anthropic Claude

**Cost:** ~$0.01-0.05 per day (using Claude Haiku)

1. Get API key: https://console.anthropic.com/
2. Add to GitHub Secrets as `ANTHROPIC_API_KEY`
3. Configure in `arxiv-config.yml`:
```yaml
summarization:
  enabled: true
  provider: "anthropic"
  model: "claude-3-haiku-20240307"
```

### Option 3: No AI (Free)

Disable AI summaries and use paper abstracts:

```yaml
summarization:
  enabled: false
```

---

## 🧪 Testing Locally

### Install Dependencies

```bash
cd my-starred-repos

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements-arxiv.txt
```

### Set API Keys (if using AI)

```bash
# Export API key
export OPENAI_API_KEY="your-key-here"
# or
export ANTHROPIC_API_KEY="your-key-here"
```

### Run Crawler

```bash
# Fetch papers
python scripts/fetch_arxiv_papers.py

# Generate summary
python scripts/generate_summary.py

# Check results
ls arxiv-papers/
ls daily-summaries/
cat README_ARXIV_DAILY.md
```

### Test Output

You should see:
```
arxiv-papers/
├── papers-2025-01-17.json
└── papers-latest.json

daily-summaries/
├── summary-2025-01-17.md
└── summary-latest.md

README_ARXIV_DAILY.md
```

---

## 🎨 Customization

### 1. Change Research Topics

Edit `arxiv-config.yml`:

```yaml
research_interests:
  my_custom_topic:
    - "keyword 1"
    - "keyword 2"
    - "keyword 3"
```

### 2. Add More arXiv Categories

Full list: https://arxiv.org/category_taxonomy

```yaml
arxiv_categories:
  - "cs.AI"   # Artificial Intelligence
  - "cs.DB"   # Databases
  - "cs.DC"   # Distributed Computing
  - "cs.SE"   # Software Engineering
  - "math.OC" # Optimization
```

### 3. Filter by Exclude Keywords

```yaml
filters:
  exclude_keywords:
    - "medical imaging"
    - "drug discovery"
    - "protein folding"
```

### 4. Adjust Relevance Threshold

```yaml
filters:
  min_relevance_score: 0.7  # Higher = more selective
```

### 5. Change Paper Limit

```yaml
filters:
  max_papers_per_category: 50  # Reduce for fewer papers
  days_to_look_back: 2  # Look back 2 days
```

---

## 📧 Enable Email Notifications

### Using GitHub Actions Email

Add to `.github/workflows/arxiv-daily-crawler.yml`:

```yaml
- name: Send Email
  uses: dawidd6/action-send-mail@v3
  with:
    server_address: smtp.gmail.com
    server_port: 465
    username: ${{ secrets.EMAIL_USERNAME }}
    password: ${{ secrets.EMAIL_PASSWORD }}
    subject: 📚 arXiv Daily Digest - ${{ env.DATE }}
    to: your-email@example.com
    from: GitHub Actions
    body: file://daily-summaries/summary-latest.md
```

Add secrets:
- `EMAIL_USERNAME`
- `EMAIL_PASSWORD`

---

## 🌐 Enable GitHub Pages

### Serve Papers as Website

1. Go to **Settings → Pages**
2. Source: **Deploy from a branch**
3. Branch: **master** or **gh-pages**
4. Folder: **/ (root)**

5. Create `index.html` or use Jekyll theme

The papers will be accessible at:
`https://YOUR_USERNAME.github.io/my-starred-repos/`

---

## 📊 Output Files

### Generated Files

```
my-starred-repos/
├── arxiv-papers/
│   ├── papers-2025-01-17.json   # Daily papers (JSON)
│   └── papers-latest.json       # Latest papers
├── daily-summaries/
│   ├── summary-2025-01-17.md    # Daily summary (Markdown)
│   └── summary-latest.md        # Latest summary
├── README_ARXIV_DAILY.md        # Main dashboard
└── arxiv-config.yml             # Configuration
```

### JSON Structure

```json
[
  {
    "id": "2401.12345",
    "title": "Paper Title",
    "authors": ["Author 1", "Author 2"],
    "abstract": "Full abstract...",
    "published": "2025-01-17T12:00:00",
    "categories": ["cs.AI", "cs.LG"],
    "pdf_url": "https://arxiv.org/pdf/2401.12345",
    "arxiv_url": "https://arxiv.org/abs/2401.12345",
    "relevance_score": 0.85,
    "ai_summary": "AI-generated summary..."
  }
]
```

---

## 🐛 Troubleshooting

### Issue: Workflow Not Running

**Solution:**
1. Check Actions tab is enabled
2. Verify workflow file is in `.github/workflows/`
3. Check branch name (must be `master` or `main`)
4. Manually trigger: Actions → workflow → Run workflow

### Issue: No Papers Found

**Solution:**
1. Check `arxiv-config.yml` syntax
2. Broaden search keywords
3. Lower `min_relevance_score`
4. Increase `days_to_look_back`
5. Check arXiv categories are valid

### Issue: AI Summaries Not Working

**Solution:**
1. Verify API key is set in GitHub Secrets
2. Check secret name: `OPENAI_API_KEY` or `ANTHROPIC_API_KEY`
3. Verify API key has credits/quota
4. Check workflow logs for errors
5. Test locally with `export OPENAI_API_KEY=...`

### Issue: Rate Limiting

**Solution:**
1. Reduce `max_papers_per_category`
2. Increase `rate_limit_delay` in config
3. Reduce number of search queries
4. Use `days_to_look_back: 1` instead of 7

### Issue: Workflow Fails to Commit

**Solution:**
1. Check workflow permissions: Settings → Actions → Workflow permissions
2. Enable "Read and write permissions"
3. Verify git config in workflow

### Issue: Too Many Papers

**Solution:**
1. Increase `min_relevance_score` (e.g., 0.7)
2. Reduce `max_papers_per_category` (e.g., 20)
3. Add more specific keywords
4. Use `exclude_keywords` to filter out unwanted topics

---

## 📈 Best Practices

### 1. Start Conservative

```yaml
filters:
  max_papers_per_category: 20
  min_relevance_score: 0.7
  days_to_look_back: 1
```

### 2. Use Specific Keywords

❌ Bad: "machine learning"
✅ Good: "large language model", "transformer architecture"

### 3. Monitor Costs

- OpenAI GPT-4o-mini: ~$0.01-0.05/day
- Anthropic Claude Haiku: ~$0.01-0.03/day
- Set budget alerts in API dashboards

### 4. Regular Review

- Check weekly digests
- Adjust keywords based on results
- Update relevance thresholds
- Archive old papers monthly

---

## 🎯 Example Use Cases

### 1. LLM Researcher

```yaml
research_interests:
  llm_core:
    - "large language model"
    - "GPT"
    - "transformer"
  llm_training:
    - "RLHF"
    - "instruction tuning"
    - "alignment"
  llm_applications:
    - "agent"
    - "chain of thought"
    - "prompt engineering"

filters:
  min_relevance_score: 0.6
  max_papers_per_category: 30
```

### 2. MLOps Engineer

```yaml
research_interests:
  mlops:
    - "MLOps"
    - "model serving"
    - "feature store"
  production_ml:
    - "model monitoring"
    - "drift detection"
    - "A/B testing"

arxiv_categories:
  - "cs.SE"
  - "cs.LG"
  - "cs.DC"
```

### 3. Computer Vision Researcher

```yaml
research_interests:
  vision:
    - "object detection"
    - "segmentation"
    - "diffusion model"
  multimodal:
    - "vision language"
    - "CLIP"
    - "image captioning"

arxiv_categories:
  - "cs.CV"
  - "cs.AI"
```

---

## 📚 Additional Resources

- [arXiv API Documentation](https://info.arxiv.org/help/api/index.html)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [OpenAI API Pricing](https://openai.com/pricing)
- [Anthropic API Pricing](https://www.anthropic.com/pricing)

---

## 🤝 Support

If you encounter issues:

1. Check [Troubleshooting](#troubleshooting) section
2. Review workflow logs in Actions tab
3. Test locally first
4. Check GitHub Actions status: https://www.githubstatus.com/

---

**Happy Researching! 🚀📚**

*Last updated: 2025-01-17*
