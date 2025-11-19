# 🤖 Automated arXiv Paper Tracker Setup

This directory contains automation scripts to help you quickly set up arXiv paper tracking with zero manual configuration.

## 🚀 Quick Start (One Command Setup)

```bash
./setup-arxiv-tracker.sh
```

That's it! The script will guide you through the entire setup process interactively.

## 📋 What Gets Automated

### ✅ Fork Repository
- Automatically forks your chosen arXiv tracker repository
- Clones it to your local machine
- Sets up the correct remote configuration

### ✅ Configure Keywords/Topics
- Interactive prompt for your research interests
- Automatically generates configuration files
- Commits configuration to your fork

### ✅ Enable GitHub Actions
- Enables GitHub Actions on your forked repository
- Triggers the first workflow run
- Sets up automated daily updates

### ✅ Set Up Notifications
- Configure GitHub Issues for new papers
- Set up repository watch for updates
- Optional email notifications

### ✅ API Key Configuration
- Securely add OpenAI API key for AI summaries
- Securely add Anthropic API key
- Keys stored as GitHub Secrets (never in code)

## 🎯 Available Trackers

The script supports automatic setup for these popular arXiv trackers:

| Tracker | Author | Best For |
|---------|--------|----------|
| **daily-arXiv-ai-enhanced** | dw-dengwei | AI-powered summaries, comprehensive coverage |
| **ArxivDigest** | AutoLLM | Personalized recommendations, email digests |
| **DailyArXiv** | MLNLP-World | Keyword-based tracking, simple setup |
| **awesome-daily-AI-arxiv** | MLNLP-World | AI/NLP/CV/Robotics focus |
| **cv-arxiv-daily** | Vincentqyw | Computer vision specific |

## 📖 Detailed Usage

### Prerequisites

Before running the script, ensure you have:

1. **GitHub CLI** (`gh`) installed:
   ```bash
   # macOS
   brew install gh

   # Linux
   curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
   sudo apt update
   sudo apt install gh

   # Windows
   winget install --id GitHub.cli
   ```

2. **Authenticated with GitHub**:
   ```bash
   gh auth login
   ```

3. **Git** installed:
   ```bash
   git --version
   ```

### Step-by-Step Example

```bash
# 1. Navigate to the automation directory
cd scripts/arxiv-automation

# 2. Run the setup script
./setup-arxiv-tracker.sh

# The script will:
# ================

# Check prerequisites
# ✓ GitHub CLI is installed
# ✓ GitHub CLI is authenticated
# ✓ Git is installed

# Show available trackers
# Choose a tracker (1-6): 1

# Fork and clone repository
# ✓ Repository forked successfully
# ✓ Repository cloned to: /path/to/daily-arXiv-ai-enhanced

# Configure your research interests
# Enter research topics/keywords (comma-separated):
# > transformers, diffusion models, reinforcement learning

# Enter arXiv categories (comma-separated):
# > cs.AI, cs.LG, cs.CL

# Enable GitHub Actions
# ✓ GitHub Actions enabled
# ✓ Configuration pushed to GitHub

# Set up notifications
# How would you like to be notified?
# 1) GitHub Issues (automatically created)
# 2) Watch repository (GitHub notifications)
# 3) Both
# 4) Skip notifications
# Choose option (1-4): 3

# Add API keys (optional)
# Would you like to add API keys? (y/n): y
# Enter OpenAI API key: sk-...
# ✓ OpenAI API key added

# Setup Complete!
# ================
# ✓ arXiv tracker is now set up and running!
#
# 📁 Repository: https://github.com/yourusername/daily-arXiv-ai-enhanced
# ⚙️  Actions: https://github.com/yourusername/daily-arXiv-ai-enhanced/actions
# 📊 Papers will be tracked daily
```

## 🔧 Advanced Configuration

### Custom Configuration Files

After running the script, you can further customize:

#### For DailyArXiv:
Edit `config.yaml`:
```yaml
keywords:
  - "large language model"
  - "reinforcement learning"
  - "computer vision"

categories:
  - "cs.AI"
  - "cs.LG"
  - "cs.CL"

max_papers_per_keyword: 100

notifications:
  email: true
  github_issues: true

update_schedule: "daily"
```

#### For daily-arXiv-ai-enhanced:
Edit `arxiv-config.yml`:
```yaml
custom_keywords:
  - "transformers"
  - "diffusion models"
  - "neural architecture search"

arxiv_categories:
  - "cs.AI"
  - "cs.LG"
  - "cs.CV"

ai_summary: true
max_papers: 50
```

### Manual Workflow Trigger

You can manually trigger a workflow run:
```bash
# Via GitHub CLI
gh workflow run "Daily arXiv Papers" --repo yourusername/daily-arXiv-ai-enhanced

# Or via GitHub web interface:
# Go to: https://github.com/yourusername/REPO_NAME/actions
# Click on the workflow
# Click "Run workflow"
```

### Update Keywords Later

To update your keywords after initial setup:

```bash
cd daily-arXiv-ai-enhanced  # or your tracker name

# Edit the config file
vim config.yaml  # or arxiv-config.yml

# Commit and push
git add config.yaml
git commit -m "Update research keywords"
git push
```

The next workflow run will use your updated keywords!

## 🎨 Customization Examples

### Example 1: Focus on AI/ML
```yaml
keywords:
  - "large language model"
  - "GPT"
  - "BERT"
  - "transformer"
  - "attention mechanism"

categories:
  - "cs.AI"
  - "cs.LG"
  - "cs.CL"
```

### Example 2: Focus on Computer Vision
```yaml
keywords:
  - "object detection"
  - "image segmentation"
  - "diffusion model"
  - "stable diffusion"
  - "DALLE"

categories:
  - "cs.CV"
  - "cs.AI"
```

### Example 3: Focus on Reinforcement Learning
```yaml
keywords:
  - "reinforcement learning"
  - "Q-learning"
  - "policy gradient"
  - "multi-agent"
  - "RLHF"

categories:
  - "cs.LG"
  - "cs.AI"
  - "cs.RO"
```

### Example 4: Broad ML Coverage
```yaml
keywords:
  - "machine learning"
  - "deep learning"
  - "neural network"
  - "optimization"
  - "training"

categories:
  - "cs.LG"
  - "cs.AI"
  - "stat.ML"
```

## 📊 Viewing Your Papers

Once set up, you can view papers in multiple ways:

### 1. GitHub Repository
```bash
# View in browser
gh repo view --web yourusername/daily-arXiv-ai-enhanced
```

Papers are typically organized in:
- `papers/` or `arxiv-papers/` - Daily paper lists
- `summaries/` or `daily-summaries/` - AI-generated summaries
- `README.md` - Latest papers overview

### 2. GitHub Issues
If you enabled issue notifications, each day's papers create a new issue:
```bash
# List issues
gh issue list --repo yourusername/daily-arXiv-ai-enhanced

# View specific issue
gh issue view 1 --repo yourusername/daily-arXiv-ai-enhanced
```

### 3. GitHub Actions Output
Check the workflow runs:
```bash
gh run list --repo yourusername/daily-arXiv-ai-enhanced

# View specific run
gh run view RUN_ID --repo yourusername/daily-arXiv-ai-enhanced
```

### 4. RSS Feed
Subscribe to your repository's commit feed:
```
https://github.com/yourusername/daily-arXiv-ai-enhanced/commits/main.atom
```

## 🔍 Troubleshooting

### Script fails with "gh: command not found"
**Solution**: Install GitHub CLI:
```bash
brew install gh  # macOS
# See prerequisites section for other OS
```

### "Not authenticated with GitHub CLI"
**Solution**: Authenticate:
```bash
gh auth login
# Follow the prompts
```

### GitHub Actions not running
**Solution**:
1. Check Actions tab: `https://github.com/yourusername/REPO_NAME/actions`
2. Ensure Actions are enabled in Settings > Actions
3. Manually trigger: Click "Run workflow" in Actions tab

### No papers appearing
**Solution**:
1. Check your keywords - they may be too specific
2. Verify arXiv categories are correct
3. Check workflow logs for errors
4. Wait 24 hours - trackers run daily

### Want to track multiple topics separately
**Solution**: Run the script multiple times with different trackers!
```bash
# First run - ML/AI focus
./setup-arxiv-tracker.sh
# Choose tracker 1, configure for ML

# Second run - CV focus
./setup-arxiv-tracker.sh
# Choose tracker 5, configure for CV
```

## 🎯 Pro Tips

### Tip 1: Use Multiple Trackers
Different trackers have different strengths. Set up 2-3 for comprehensive coverage:
- `daily-arXiv-ai-enhanced` for AI summaries
- `DailyArXiv` for keyword alerts
- `cv-arxiv-daily` for CV-specific papers

### Tip 2: Star Important Papers
When you find interesting papers:
```bash
cd daily-arXiv-ai-enhanced
# Add star/bookmark in your notes
echo "⭐ Important: [Paper Title](link)" >> STARRED_PAPERS.md
git add STARRED_PAPERS.md
git commit -m "Add starred paper"
git push
```

### Tip 3: Create Reading Lists
Organize papers by topic:
```bash
mkdir reading-lists
echo "# To Read - Transformers" > reading-lists/transformers.md
echo "# To Read - Diffusion" > reading-lists/diffusion.md
```

### Tip 4: Sync with Notion/Obsidian
Export daily summaries to your note-taking system:
```bash
# Add a workflow to copy summaries to your notes folder
cp daily-summaries/*.md ~/Obsidian/Research/
```

### Tip 5: Email Notifications
Some trackers support email. Add your email to config:
```yaml
notifications:
  email: your-email@example.com
```

## 📚 Additional Resources

- [GitHub CLI Documentation](https://cli.github.com/manual/)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [arXiv API Documentation](https://info.arxiv.org/help/api/index.html)
- [ARXIV_RESEARCH_GUIDE.md](../../ARXIV_RESEARCH_GUIDE.md) - Full research guide

## 🆘 Support

If you encounter issues:

1. **Check the logs**:
   ```bash
   gh run view --log --repo yourusername/REPO_NAME
   ```

2. **Verify configuration**:
   ```bash
   cat config.yaml  # or arxiv-config.yml
   ```

3. **Re-run setup**:
   ```bash
   ./setup-arxiv-tracker.sh
   ```

4. **Manual setup**: Follow the original repository's README

## 🔄 Updating

To update the automation script:
```bash
cd my-starred-repos
git pull
chmod +x scripts/arxiv-automation/setup-arxiv-tracker.sh
```

---

**Happy Researching! 🚀**

*Generated with ❤️ by Claude Code*
