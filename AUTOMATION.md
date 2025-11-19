# 🤖 Repository Automation Guide

This repository uses GitHub Actions and scripts to automate content updates, paper tracking, and certification deal monitoring. This document explains how each automation works.

## 📊 Automation Overview

| Automation | Schedule | Purpose | Status |
|------------|----------|---------|--------|
| **arXiv Daily Crawler** | Daily at 9 AM UTC | Fetches latest AI/ML research papers | [![Status](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/arxiv-daily-crawler.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/arxiv-daily-crawler.yml) |
| **IT Cert Deals** | Weekly on Monday | Updates certification deals and vouchers | [![Status](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-cert-deals.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-cert-deals.yml) |
| **Starred Repos Sync** | Manual/On-demand | Syncs starred repositories index | [![Status](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml) |
| **Setup arXiv Trackers** | Manual workflow dispatch | Creates tracker configs and setup guides | [![Status](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/setup-arxiv-trackers.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/setup-arxiv-trackers.yml) |
| **Sync arXiv Papers** | Daily at 10 AM UTC | Syncs tracker status and configs | [![Status](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/sync-arxiv-papers.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/sync-arxiv-papers.yml) |

---

## 📚 arXiv Daily Paper Crawler

### What It Does
Automatically fetches and processes research papers from arXiv based on configured keywords and categories.

### Workflow File
`.github/workflows/arxiv-daily-crawler.yml`

### Schedule
- **Automated:** Daily at 9:00 AM UTC
- **Manual:** Can be triggered via GitHub Actions UI

### Configuration
**Requirements:** `requirements-arxiv.txt`
```txt
arxiv>=2.0.0
requests>=2.31.0
python-dateutil>=2.8.2
```

### How It Works
1. Sets up Python 3.11 environment with pip caching
2. Installs dependencies from `requirements-arxiv.txt`
3. Runs the arXiv paper fetching script (searches based on keywords)
4. Generates daily summaries of found papers
5. Commits updates to:
   - `arxiv-papers/` - Individual paper details
   - `daily-summaries/` - Daily aggregated summaries
   - `README_ARXIV_DAILY.md` - Main index
6. Creates GitHub Issue with summary (if new papers found)

### Key Features
- **Pip caching** for faster runs
- **Error handling** for missing files (won't fail if no papers found)
- **Automatic issue creation** for new paper notifications
- **Git automation** with bot commits

### Output Files
```
arxiv-papers/
├── YYYY-MM-DD/
│   ├── paper-1.md
│   ├── paper-2.md
│   └── ...
daily-summaries/
├── summary-YYYY-MM-DD.md
└── summary-latest.md
README_ARXIV_DAILY.md
```

### Troubleshooting
If the workflow fails:
1. Check the Actions tab for error logs
2. Verify `requirements-arxiv.txt` has all dependencies
3. Ensure GitHub Actions has write permissions (Settings → Actions → General → Workflow permissions)

---

## 💳 IT Certification Deals Tracker

### What It Does
Weekly scan for free IT certification exams, beta programs, and discount vouchers across major providers (Microsoft, AWS, Google Cloud, Cisco, etc.).

### Workflow File
`.github/workflows/update-cert-deals.yml`

### Schedule
- **Automated:** Weekly on Monday at 6:00 AM UTC
- **Manual:** Can be triggered via GitHub Actions UI

### Configuration
**Requirements:** `requirements-cert-deals.txt`
```txt
requests>=2.31.0
beautifulsoup4>=4.12.0
python-dateutil>=2.8.2
```

### How It Works
1. Sets up Python 3.11 environment with pip caching
2. Installs dependencies from `requirements-cert-deals.txt`
3. Runs certification deal scraping script
4. Aggregates deals from various sources
5. Updates `LATEST-IT-CERTS-DEALS.md` with findings
6. Commits updates with automated commit message

### Tracked Providers
- **Microsoft:** Azure, Microsoft 365, Security certifications
- **AWS:** Solutions Architect, Developer, SysOps
- **Google Cloud:** GCP certifications
- **Cisco:** Networking certifications
- **CompTIA:** A+, Network+, Security+
- **Others:** Oracle, VMware, Red Hat, etc.

### Output Files
```
LATEST-IT-CERTS-DEALS.md
```

### Typical Value Tracked
The automation typically finds **$794+ in free exam vouchers and beta opportunities** per week.

---

## ⭐ Starred Repositories Sync

### What It Does
Synchronizes your GitHub starred repositories and updates the index files.

### Workflow File
`.github/workflows/update-starred-repos.yml`

### Schedule
- **Manual only:** Triggered via workflow dispatch

### How It Works
1. Fetches all starred repositories via GitHub API
2. Categorizes repos by topic/language
3. Updates `STARRED-INDEX.md` with clickable links
4. Commits changes with detailed statistics

### Output Files
```
STARRED-INDEX.md
```

### Why Manual?
Starring repos is a manual action, so the sync is triggered only when you want to update the index after starring new repositories.

---

## 🔬 Setup arXiv Paper Trackers

### What It Does
Creates personalized arXiv paper tracker configurations based on your research interests.

### Workflow File
`.github/workflows/setup-arxiv-trackers.yml`

### Schedule
- **Manual workflow dispatch** with configurable inputs

### Input Parameters
```yaml
tracker_type:
  - daily-arXiv-ai-enhanced
  - ArxivDigest
  - DailyArXiv
  - awesome-daily-AI-arxiv
  - cv-arxiv-daily

keywords: "large language model, reinforcement learning, transformers"
categories: "cs.AI, cs.LG, cs.CL"
enable_notifications: true/false
```

### How It Works
1. Accepts your research keywords and arXiv categories
2. Generates YAML configuration file for selected tracker
3. Saves config to `arxiv-tracker-configs/`
4. Creates detailed setup guide as GitHub Issue
5. Provides fork links and step-by-step instructions

### Output Files
```
arxiv-tracker-configs/
├── daily-arXiv-ai-enhanced-config.yaml
├── ArxivDigest-config.yaml
└── ...
```

### Automated Setup Guide
When you run this workflow, it automatically creates a GitHub Issue with:
- Direct fork link for the tracker repository
- Download link for your generated config
- Step-by-step setup instructions
- CLI alternative commands

### Available Trackers

| Tracker | Repository | Specialization |
|---------|-----------|----------------|
| **daily-arXiv-ai-enhanced** | [dw-dengwei/daily-arXiv-ai-enhanced](https://github.com/dw-dengwei/daily-arXiv-ai-enhanced) | AI-enhanced paper summaries |
| **ArxivDigest** | [AutoLLM/ArxivDigest](https://github.com/AutoLLM/ArxivDigest) | Personalized paper digests |
| **DailyArXiv** | [MLNLP-World/DailyArXiv](https://github.com/MLNLP-World/DailyArXiv) | Daily ML/NLP papers |
| **awesome-daily-AI-arxiv** | [MLNLP-World/awesome-daily-AI-arxiv](https://github.com/MLNLP-World/awesome-daily-AI-arxiv) | Curated AI papers |
| **cv-arxiv-daily** | [Vincentqyw/cv-arxiv-daily](https://github.com/Vincentqyw/cv-arxiv-daily) | Computer Vision focus |

---

## 🔄 Sync arXiv Papers

### What It Does
Daily synchronization of arXiv tracker status and configuration summaries.

### Workflow File
`.github/workflows/sync-arxiv-papers.yml`

### Schedule
- **Automated:** Daily at 10:00 AM UTC (after trackers run at 9 AM)
- **Manual:** Can be triggered via workflow dispatch

### How It Works
1. Checks for tracker configurations in `arxiv-tracker-configs/`
2. If configs found:
   - Creates sync summary for the day
   - Lists all configured trackers with keywords
   - Updates tracker status dashboard
   - Generates index of latest syncs
3. If no configs found:
   - Displays helpful setup message
   - Provides links to setup workflow

### Output Files
```
synced-arxiv-papers/
├── YYYY-MM-DD/
│   └── README.md
└── README.md (index)

arxiv-trackers/
└── README.md (status dashboard)
```

### Status Dashboard
The workflow creates `arxiv-trackers/README.md` showing:
- All configured trackers
- Their keywords and categories
- Setup status
- Next steps for completing fork setup

### Workflow Coordination
This workflow is designed to run **after** individual tracker workflows complete (scheduled 1 hour later at 10 AM UTC).

---

## 📁 Directory Structure

```
my-starred-repos/
├── .github/
│   └── workflows/
│       ├── arxiv-daily-crawler.yml      # Daily arXiv papers
│       ├── update-cert-deals.yml        # Weekly cert deals
│       ├── update-starred-repos.yml     # Manual repo sync
│       ├── setup-arxiv-trackers.yml     # Tracker setup
│       └── sync-arxiv-papers.yml        # Tracker sync
├── scripts/
│   └── arxiv-automation/
│       ├── setup-arxiv-tracker.sh       # CLI setup script
│       └── README.md                    # CLI documentation
├── arxiv-papers/                        # Daily arXiv papers
├── daily-summaries/                     # Paper summaries
├── arxiv-tracker-configs/               # Tracker YAML configs
├── arxiv-trackers/                      # Tracker status
├── synced-arxiv-papers/                 # Sync history
├── requirements-arxiv.txt               # arXiv dependencies
├── requirements-cert-deals.txt          # Cert deals dependencies
├── LATEST-IT-CERTS-DEALS.md            # Cert deals output
├── README_ARXIV_DAILY.md               # arXiv papers index
├── STARRED-INDEX.md                     # Starred repos index
└── AUTOMATION.md                        # This file
```

---

## 🛠️ Scripts

### `scripts/arxiv-automation/setup-arxiv-tracker.sh`

**Purpose:** CLI tool for automated arXiv tracker setup

**What it does:**
1. Checks prerequisites (GitHub CLI, git)
2. Shows interactive menu of available trackers
3. Prompts for research keywords and arXiv categories
4. Automatically forks the tracker repository
5. Clones your fork locally
6. Generates and commits configuration file
7. Pushes to your fork
8. Enables GitHub Actions
9. Verifies setup completion

**Usage:**
```bash
cd scripts/arxiv-automation
./setup-arxiv-tracker.sh
```

**Interactive Prompts:**
- Select tracker (1-5)
- Enter research keywords (comma-separated)
- Enter arXiv categories (comma-separated)
- Enable notifications (y/n)

**Output:**
- Forked repository in your GitHub account
- Configuration file committed and pushed
- GitHub Actions enabled
- Verification summary

**See also:** `scripts/arxiv-automation/README.md` for detailed usage

---

## 🔐 Permissions & Secrets

### Required Repository Permissions
Go to **Settings → Actions → General → Workflow permissions** and select:
- ✅ **Read and write permissions**
- ✅ **Allow GitHub Actions to create and approve pull requests**

### Optional Secrets (for enhanced features)
Add these in **Settings → Secrets and variables → Actions**:

| Secret Name | Purpose | Used By |
|-------------|---------|---------|
| `GITHUB_TOKEN` | Automatically provided | All workflows (pre-configured) |
| `OPENAI_API_KEY` | AI-powered paper summaries (optional) | arXiv Daily Crawler |
| `ANTHROPIC_API_KEY` | Alternative AI summaries (optional) | arXiv Daily Crawler |

**Note:** The workflows work without API keys, but AI summaries won't be generated.

---

## 📊 Monitoring & Logs

### View Workflow Runs
1. Go to the [Actions tab](https://github.com/nbajpai-code/my-starred-repos/actions)
2. Click on a workflow name
3. View run history, logs, and status

### Status Badges
All status badges are shown at the top of README.md:
- [![arXiv Papers](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/arxiv-daily-crawler.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/arxiv-daily-crawler.yml)
- [![IT Cert Deals](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-cert-deals.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-cert-deals.yml)
- [![Starred Repos](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml/badge.svg)](https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml)

### Email Notifications
GitHub sends email notifications for:
- ❌ Workflow failures
- ✅ First successful run after failure
- 📊 Weekly summary (if enabled)

Configure in: **Settings → Notifications**

---

## 🚀 Quick Start

### Set up your first arXiv tracker
```bash
# Option 1: Use GitHub UI
# 1. Go to Actions → Setup arXiv Paper Trackers
# 2. Click "Run workflow"
# 3. Fill in keywords and categories
# 4. Follow setup guide in created issue

# Option 2: Use CLI script
cd scripts/arxiv-automation
./setup-arxiv-tracker.sh
```

### Manually trigger workflows
```bash
# Trigger arXiv crawler
gh workflow run arxiv-daily-crawler.yml

# Trigger cert deals update
gh workflow run update-cert-deals.yml

# Trigger tracker sync
gh workflow run sync-arxiv-papers.yml
```

### View latest outputs
- **arXiv Papers:** [README_ARXIV_DAILY.md](README_ARXIV_DAILY.md)
- **IT Cert Deals:** [LATEST-IT-CERTS-DEALS.md](LATEST-IT-CERTS-DEALS.md)
- **Starred Repos:** [STARRED-INDEX.md](STARRED-INDEX.md)
- **Tracker Status:** [arxiv-trackers/README.md](arxiv-trackers/README.md)

---

## 🆘 Troubleshooting

### Common Issues

**1. Workflow fails with "Permission denied"**
- **Fix:** Enable write permissions in Settings → Actions → General → Workflow permissions

**2. Pip cache not found**
- **Fix:** Ensure `requirements-*.txt` files exist in repository root
- **Note:** Fixed by adding `cache-dependency-path` to workflows

**3. Git push fails with "rejected"**
- **Fix:** Workflow automatically uses `git pull --rebase && git push`
- **Note:** This happens when multiple workflows run simultaneously

**4. No papers found in arXiv crawler**
- **Check:** Keywords might be too specific
- **Fix:** Broaden keywords or add more arXiv categories
- **Note:** Workflow won't fail, just won't create files

**5. Tracker fork fails with "403"**
- **Reason:** GITHUB_TOKEN cannot fork repositories (security limitation)
- **Fix:** Workflows now generate setup guides instead of auto-forking
- **Action:** Follow the setup guide in created GitHub Issue

**6. Email notifications not received**
- **Check:** GitHub notification settings
- **Fix:** Settings → Notifications → Actions → Enable notifications

---

## 📈 Future Enhancements

Potential improvements to automation:

- [ ] GitHub Pages static site for better UX (MkDocs/Jekyll)
- [ ] Slack/Discord webhook notifications for new papers
- [ ] LLM-powered paper categorization and relevance scoring
- [ ] Automated trending analysis (which topics are hot?)
- [ ] Integration with Zotero/Mendeley for reference management
- [ ] Monthly/yearly statistics reports
- [ ] RSS feed generation for paper updates
- [ ] Automated GitHub Discussions creation for paper discussions

---

## 🔗 Related Documentation

- [arXiv Research Guide](ARXIV_RESEARCH_GUIDE.md) - Research paper tracking overview
- [arXiv Quick Start](ARXIV_QUICK_START.md) - Getting started with arXiv trackers
- [CLI Setup Guide](scripts/arxiv-automation/README.md) - Detailed CLI script documentation
- [Workflow Documentation](.github/workflows/ARXIV_WORKFLOWS.md) - Technical workflow details
- [Production Interface](https://nbajpai-code.github.io/my-starred-repos/) - Web-based tracker setup

---

## 📝 Maintenance

### Weekly Tasks
- ✅ Review IT Cert Deals output (auto-updated Monday)
- ✅ Review new arXiv papers (auto-updated daily)

### Monthly Tasks
- Check workflow run history for failures
- Update `requirements-*.txt` if dependencies have security updates
- Review and close completed setup guide issues

### Quarterly Tasks
- Update arXiv keywords based on new research interests
- Review and archive old synced-arxiv-papers directories
- Update automation documentation if workflows change

---

**Last Updated:** 2025-11-18
**Maintained By:** GitHub Actions (automated) + Manual reviews
**Questions?** Create an [issue](https://github.com/nbajpai-code/my-starred-repos/issues) with the `automation` label
