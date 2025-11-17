# 🚀 Deploy Instructions for arXiv Daily Crawler

Your arXiv Daily Crawler is fully set up and committed locally! Files just need to be pushed to GitHub.

---

## ✅ What's Ready

All files are created and committed locally:

```
✓ .github/workflows/arxiv-daily-crawler.yml (GitHub Actions workflow)
✓ arxiv-config.yml (Configuration file)
✓ scripts/fetch_arxiv_papers.py (Paper crawler)
✓ scripts/generate_summary.py (Summary generator)
✓ ARXIV_SETUP_GUIDE.md (Complete documentation)
✓ requirements-arxiv.txt (Python dependencies)
```

---

## ⚠️ Push Required

The files need to be pushed to GitHub. Choose one of these methods:

### Method 1: GitHub Web UI (Easiest - Recommended)

1. **Go to your repository:**
   ```
   https://github.com/nbajpai-code/my-starred-repos
   ```

2. **Upload workflow file first:**
   - Click "Add file" → "Create new file"
   - Path: `.github/workflows/arxiv-daily-crawler.yml`
   - Copy content from local file
   - Commit with message: "Add arXiv Daily Crawler workflow"

3. **Upload remaining files:**
   - Click "Add file" → "Upload files"
   - Drag and drop:
     - `arxiv-config.yml`
     - `requirements-arxiv.txt`
     - `ARXIV_SETUP_GUIDE.md`
   - Commit

4. **Upload scripts:**
   - Create `scripts/` folder if needed
   - Upload `fetch_arxiv_papers.py` and `generate_summary.py`

### Method 2: GitHub CLI with Workflow Scope

```bash
# Re-authenticate with workflow scope
gh auth refresh -h github.com -s workflow

# Follow the prompt to authorize in browser
# Code: 8A4F-635B (or get new one)
# URL: https://github.com/login/device

# After authorization:
git push origin master
```

### Method 3: SSH (If configured)

```bash
# Change remote to SSH
git remote set-url origin git@github.com:nbajpai-code/my-starred-repos.git

# Push
git push origin master
```

### Method 4: Personal Access Token

```bash
# Create token with workflow scope:
# https://github.com/settings/tokens/new
# Scopes needed: repo, workflow

# Use token for push:
git remote set-url origin https://YOUR_TOKEN@github.com/nbajpai-code/my-starred-repos.git
git push origin master
```

---

## 🎯 After Pushing - Quick Setup

### 1. Configure Your Research Interests

Edit `arxiv-config.yml` on GitHub or locally:

```yaml
research_interests:
  ai_ml:
    - "large language model"
    - "GPT"
    - "transformer"
    # Add more keywords
```

### 2. Add OpenAI API Key (Optional)

**Get Key:** https://platform.openai.com/api-keys

**Add to GitHub:**
1. Go to: Settings → Secrets and variables → Actions
2. Click "New repository secret"
3. Name: `OPENAI_API_KEY`
4. Value: Your API key
5. Click "Add secret"

**Cost:** ~$0.01-0.05 per day with GPT-4o-mini

### 3. Enable GitHub Actions

1. Go to **Actions** tab
2. Enable workflows if prompted
3. Find "arXiv Daily Paper Crawler"
4. Click "Run workflow" to test

### 4. First Run

**Manual trigger:**
1. Actions tab → "arXiv Daily Paper Crawler"
2. Click "Run workflow"
3. Select branch: master
4. Click "Run workflow"

**Wait for completion** (~2-5 minutes)

### 5. Check Results

After workflow completes:

```
arxiv-papers/
├── papers-2025-01-17.json
└── papers-latest.json

daily-summaries/
├── summary-2025-01-17.md
└── summary-latest.md

README_ARXIV_DAILY.md (new!)
```

Plus a new GitHub Issue with the daily digest!

---

## 📊 What Happens Next

### Automatic Daily Runs

The workflow will run automatically:
- **Time:** 9 AM UTC (4 AM EST)
- **Frequency:** Every day
- **Action:** Fetches papers, generates summaries, creates issues

### Expected Papers

With default configuration:
- **20-50 papers per day**
- Focused on: AI/ML, RL, MLOps, AIOps, CV, NLP
- Relevance score: 0.5+ (50% match)

### AI Summaries

If API key is configured:
- **Top 20 papers** get AI summaries
- **200 words** per summary
- **Key insights** extracted
- **Cost:** ~$0.01-0.05/day

---

## 🔧 Customization Examples

### Focus on LLMs Only

```yaml
research_interests:
  llm:
    - "large language model"
    - "GPT"
    - "Claude"
    - "LLaMA"
    - "instruction tuning"
    - "RLHF"

filters:
  min_relevance_score: 0.7
  max_papers_per_category: 15
```

### Broad ML Research

```yaml
research_interests:
  ml:
    - "machine learning"
    - "deep learning"
    - "neural network"

filters:
  min_relevance_score: 0.4
  max_papers_per_category: 100
```

### MLOps Focus

```yaml
research_interests:
  mlops:
    - "MLOps"
    - "model serving"
    - "model deployment"
    - "feature store"
    - "model monitoring"

arxiv_categories:
  - "cs.LG"
  - "cs.SE"
  - "cs.DC"
```

---

## 🐛 Troubleshooting

### Workflow Not Running

**Check:**
1. Actions tab is enabled
2. Workflow file is in `.github/workflows/`
3. Branch is correct (master or main)
4. Manually trigger to test

### No Papers Found

**Fix:**
1. Lower `min_relevance_score` (try 0.3)
2. Add more general keywords
3. Increase `days_to_look_back` (try 2)
4. Check arXiv categories are valid

### AI Summaries Not Working

**Check:**
1. API key is set correctly
2. Secret name is exact: `OPENAI_API_KEY`
3. Key has credits/quota
4. Provider is set correctly in config
5. Check workflow logs for errors

### Rate Limiting

**Fix:**
1. Reduce `max_papers_per_category` (try 20)
2. Increase `rate_limit_delay` in config
3. Reduce number of keywords

---

## 💰 Cost Breakdown

### With AI (OpenAI GPT-4o-mini)

**Per Day:**
- 20 summaries × $0.0005 = **$0.01**

**Per Month:**
- $0.01 × 30 = **$0.30**

**Per Year:**
- $0.30 × 12 = **$3.60**

### Without AI

**100% FREE** - uses paper abstracts

---

## 📚 Documentation

**Complete Guide:** Read `ARXIV_SETUP_GUIDE.md` for:
- Detailed configuration
- API setup
- Local testing
- Troubleshooting
- Best practices

---

## ✅ Checklist

Before first run:

- [ ] Files pushed to GitHub
- [ ] `arxiv-config.yml` configured with your interests
- [ ] API key added (optional)
- [ ] GitHub Actions enabled
- [ ] Workflow triggered manually

After first run:

- [ ] Check `arxiv-papers/` directory
- [ ] Review `daily-summaries/`
- [ ] Read `README_ARXIV_DAILY.md`
- [ ] Check GitHub Issues for digest
- [ ] Adjust relevance scores if needed

---

## 🎯 Quick Commands

```bash
# View local files
ls -la .github/workflows/
ls scripts/
cat arxiv-config.yml

# Check git status
git status
git log --oneline -1

# Push files (after auth)
git push origin master

# View workflow in browser
open https://github.com/nbajpai-code/my-starred-repos/actions
```

---

## 🆘 Need Help?

1. **Check workflow logs:** Actions tab → select run → view logs
2. **Review ARXIV_SETUP_GUIDE.md:** Complete troubleshooting section
3. **Test locally:** Run scripts with Python to debug
4. **Check API status:** OpenAI/Anthropic status pages

---

**Your automated arXiv research system is ready - just push to deploy! 🚀**

*Last updated: 2025-01-17*
