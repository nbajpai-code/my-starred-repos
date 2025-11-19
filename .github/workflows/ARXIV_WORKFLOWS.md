# arXiv Automation Workflows

This directory contains GitHub Actions workflows for automated arXiv paper tracking and management.

## 📋 Available Workflows

### 1. 🚀 Setup arXiv Trackers (`setup-arxiv-trackers.yml`)

**Purpose:** Automate the setup of arXiv paper tracking repositories

**Trigger:** Manual (workflow_dispatch)

**What it does:**
- Forks your chosen arXiv tracker repository
- Configures keywords and categories
- Enables GitHub Actions
- Sets up notifications
- Creates tracking registry

**How to use:**

#### Via GitHub Web Interface:
1. Go to [Actions tab](../../actions)
2. Click "Setup arXiv Paper Trackers" workflow
3. Click "Run workflow"
4. Fill in the form:
   - **Tracker type:** Choose from dropdown (daily-arXiv-ai-enhanced, ArxivDigest, etc.)
   - **Keywords:** e.g., `large language model, reinforcement learning, transformers`
   - **Categories:** e.g., `cs.AI, cs.LG, cs.CL`
   - **Enable notifications:** true/false
   - **Auto-star papers:** true/false
5. Click "Run workflow"
6. Wait 1-2 minutes
7. Check Issues for setup confirmation

#### Via GitHub CLI:
```bash
gh workflow run "Setup arXiv Paper Trackers" \
  --repo nbajpai-code/my-starred-repos \
  -f tracker_type="daily-arXiv-ai-enhanced" \
  -f keywords="transformers, diffusion models, RLHF" \
  -f categories="cs.AI, cs.LG, cs.CL" \
  -f enable_notifications=true \
  -f auto_star_papers=false
```

**Output:**
- Forked repository configured and running
- GitHub Issue created with setup details
- Tracking registry updated in `arxiv-trackers/`

---

### 2. 🔄 Sync arXiv Papers (`sync-arxiv-papers.yml`)

**Purpose:** Automatically sync papers from all your active trackers to this repository

**Trigger:**
- **Scheduled:** Daily at 10 AM UTC
- **Manual:** workflow_dispatch

**What it does:**
- Discovers all your active arXiv tracker repositories
- Syncs latest papers from each tracker
- Creates daily digest
- Organizes papers by date and source
- Creates GitHub Issue with highlights
- Maintains historical archive

**How to use:**

#### Automatic (Recommended):
The workflow runs automatically every day at 10 AM UTC. No action needed!

#### Manual Trigger via Web:
1. Go to [Actions tab](../../actions)
2. Click "Sync arXiv Papers from Trackers"
3. Click "Run workflow"
4. Optionally enable "Force sync all trackers"
5. Click "Run workflow"

#### Manual Trigger via CLI:
```bash
# Standard sync
gh workflow run "Sync arXiv Papers from Trackers" \
  --repo nbajpai-code/my-starred-repos

# Force sync all
gh workflow run "Sync arXiv Papers from Trackers" \
  --repo nbajpai-code/my-starred-repos \
  -f force_sync=true
```

**Output:**
- `synced-arxiv-papers/YYYY-MM-DD/` - Daily paper archives
- `curated-papers/YYYY-MM-DD-highlights.md` - Top papers
- GitHub Issue with daily digest
- Updated sync index

---

### 3. 📚 arXiv Daily Paper Crawler (`arxiv-daily-crawler.yml`)

**Purpose:** Your existing arXiv crawler that fetches papers directly

**Trigger:**
- **Scheduled:** Daily at 9 AM UTC
- **Manual:** workflow_dispatch
- **On push:** When config changes

**What it does:**
- Fetches papers based on `arxiv-config.yml`
- Generates AI summaries (if API keys configured)
- Creates daily paper list
- Updates README
- Creates GitHub Issues

**How to configure:**
Edit `arxiv-config.yml` in the repository root.

---

## 🎯 Typical Workflow

### Initial Setup (One-time)

**Option A: Via Web Interface**
1. Go to Actions → "Setup arXiv Paper Trackers"
2. Run workflow with your research interests
3. Wait for confirmation issue
4. Done! Papers will be tracked daily

**Option B: Via Script**
```bash
cd scripts/arxiv-automation
./setup-arxiv-tracker.sh
```

### Daily Operations (Automatic)

Once set up, everything runs automatically:

```
9:00 AM UTC  → arXiv Daily Crawler runs (direct fetch)
              → Fetches papers matching your config
              → Generates summaries
              → Creates issue if papers found

10:00 AM UTC → Sync Papers runs (from trackers)
              → Syncs from all your forked trackers
              → Consolidates in synced-arxiv-papers/
              → Creates daily digest issue

Throughout day → You review papers in Issues tab
                → Star interesting repos
                → Add to reading list
```

### Monitoring (Manual)

```bash
# Check workflow status
gh run list --repo nbajpai-code/my-starred-repos

# View latest run
gh run view --repo nbajpai-code/my-starred-repos

# List today's synced papers
ls synced-arxiv-papers/$(date +%Y-%m-%d)/

# View active trackers
cat arxiv-trackers/README.md
```

---

## 📁 Directory Structure

After running the workflows, your repository will have:

```
my-starred-repos/
├── .github/
│   └── workflows/
│       ├── arxiv-daily-crawler.yml      # Direct paper fetching
│       ├── setup-arxiv-trackers.yml     # Tracker setup automation
│       └── sync-arxiv-papers.yml        # Daily sync from trackers
│
├── arxiv-config.yml                     # Config for direct crawler
│
├── arxiv-trackers/                      # Registry of active trackers
│   ├── README.md                        # Index of all trackers
│   ├── daily-arXiv-ai-enhanced.md       # Tracker 1 details
│   ├── DailyArXiv.md                    # Tracker 2 details
│   └── ...
│
├── synced-arxiv-papers/                 # Synced from all trackers
│   ├── README.md                        # Sync index
│   ├── 2025-11-19/                      # Today's papers
│   │   ├── README.md                    # Daily summary
│   │   ├── daily-arXiv-ai-enhanced/     # Papers from tracker 1
│   │   ├── DailyArXiv/                  # Papers from tracker 2
│   │   └── ...
│   └── 2025-11-18/                      # Yesterday's papers
│       └── ...
│
├── curated-papers/                      # Highlights
│   ├── 2025-11-19-highlights.md
│   └── ...
│
├── arxiv-papers/                        # Direct crawler output
│   └── papers-2025-11-19.json
│
└── daily-summaries/                     # AI summaries
    └── summary-2025-11-19.md
```

---

## ⚙️ Configuration

### Setup New Tracker

```yaml
# Via workflow dispatch
tracker_type: "daily-arXiv-ai-enhanced"
keywords: "large language model, transformers, BERT"
categories: "cs.AI, cs.LG, cs.CL"
enable_notifications: true
```

### Configure Direct Crawler

Edit `arxiv-config.yml`:
```yaml
keywords:
  - "reinforcement learning"
  - "multi-agent systems"

categories:
  - "cs.AI"
  - "cs.LG"
  - "cs.MA"
```

### Add API Keys (Optional)

For AI summaries, add secrets:
1. Go to Settings → Secrets and variables → Actions
2. Add secrets:
   - `OPENAI_API_KEY` - For GPT summaries
   - `ANTHROPIC_API_KEY` - For Claude summaries

---

## 🔍 Troubleshooting

### Workflow not running?
```bash
# Check if Actions are enabled
gh api repos/nbajpai-code/my-starred-repos/actions/permissions

# View recent runs
gh run list --repo nbajpai-code/my-starred-repos --limit 10
```

### No papers syncing?
```bash
# Check active trackers
gh repo list --fork

# Manually trigger sync
gh workflow run "Sync arXiv Papers from Trackers" \
  --repo nbajpai-code/my-starred-repos
```

### Tracker not found?
Ensure you've run the setup workflow first:
```bash
gh workflow run "Setup arXiv Paper Trackers" \
  --repo nbajpai-code/my-starred-repos \
  -f tracker_type="daily-arXiv-ai-enhanced" \
  -f keywords="your keywords" \
  -f categories="cs.AI, cs.LG"
```

---

## 🎨 Customization

### Change Sync Schedule

Edit `.github/workflows/sync-arxiv-papers.yml`:
```yaml
on:
  schedule:
    # Change from 10 AM to 2 PM UTC
    - cron: '0 14 * * *'
```

### Add Custom Filters

Modify sync workflow to filter by relevance, citation count, etc.

### Integrate with Notion

Add a step to export papers to Notion:
```yaml
- name: Export to Notion
  run: |
    # Your Notion API integration
    python scripts/export-to-notion.py
```

---

## 📚 Additional Resources

- [ARXIV_RESEARCH_GUIDE.md](../../ARXIV_RESEARCH_GUIDE.md) - Full research guide
- [Automation Script README](../../scripts/arxiv-automation/README.md) - CLI tool guide
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

## 💡 Pro Tips

1. **Multiple Research Areas**: Run setup workflow multiple times with different configs
2. **Custom Labels**: Add labels to Issues for easy filtering
3. **Reading Lists**: Create Projects to track papers
4. **Share Digests**: Forward daily issues to your team
5. **Export Papers**: Use workflow artifacts for offline reading

---

**Questions?** Open an issue with the `question` label!

*🤖 Automated with GitHub Actions*
