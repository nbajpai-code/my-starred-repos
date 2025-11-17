# 🔄 Monthly Repository Update System

Automated GitHub Actions workflow to keep your starred repositories up-to-date.

---

## 📋 Overview

This system automatically runs all your star scripts on a monthly or quarterly schedule to ensure your GitHub stars stay current with the latest repositories in each category.

### What Gets Updated

✅ **All Repository Categories:**
- AI & Machine Learning (NVIDIA, Anthropic, OpenAI, META, Google)
- MLOps & AIOps
- Cybersecurity & DevSecOps
- Networking & Observability
- Systems Programming (C++/Go/LLVM)
- Python Development
- Conference Resources (Python, Tech, Data Center, Security)
- Enterprise Solutions (Broadcom/CA)
- Database Technologies
- Quantum & Emerging Technologies
- IT/Tech Certifications
- DP-600 Microsoft Fabric Analytics Engineer Exam Prep
- Prompt Engineering & Linting
- arXiv Research Papers
- Testing & Observability
- Coding Agents & Benchmarks

### Update Frequency

**Default: Monthly**
- Runs on the 1st of every month at 9 AM UTC
- ~30 star scripts executed
- ~3,000+ repositories checked

**Optional: Quarterly**
- Runs on Jan 1, Apr 1, Jul 1, Oct 1
- Less frequent, suitable if you prefer fewer updates

---

## ⚙️ Configuration

### Switch to Quarterly Updates

Edit `.github/workflows/update-starred-repos.yml`:

```yaml
on:
  schedule:
    # Comment out monthly schedule
    # - cron: '0 9 1 * *'

    # Uncomment quarterly schedule
    - cron: '0 9 1 1,4,7,10 *'
```

### Change Update Time

```yaml
schedule:
  - cron: '0 9 1 * *'  # 9 AM UTC
  # Change to:
  - cron: '0 21 1 * *'  # 9 PM UTC
  - cron: '30 14 1 * *'  # 2:30 PM UTC
```

**Cron Format:** `minute hour day month day-of-week`

**Examples:**
- `0 9 1 * *` - 1st day of month, 9 AM UTC
- `0 9 1,15 * *` - 1st and 15th of month, 9 AM UTC
- `0 9 * * 1` - Every Monday, 9 AM UTC

---

## 🚀 Usage

### Automatic Monthly Runs

No action needed! The workflow runs automatically on the 1st of each month.

### Manual Trigger (Anytime)

#### Option 1: GitHub Web UI

1. Go to: https://github.com/nbajpai-code/my-starred-repos/actions
2. Click "Update Starred Repositories"
3. Click "Run workflow"
4. Select options:
   - **Category:** Choose specific category or 'all'
   - **Update README:** Check to update documentation
5. Click "Run workflow"

#### Option 2: GitHub CLI

```bash
# Update all categories
gh workflow run update-starred-repos.yml

# Update specific category
gh workflow run update-starred-repos.yml \
  -f category=ai \
  -f update_readme=true

# Update only networking
gh workflow run update-starred-repos.yml \
  -f category=networking \
  -f update_readme=false
```

#### Option 3: API Call

```bash
curl -X POST \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml/dispatches \
  -d '{"ref":"master","inputs":{"category":"all","update_readme":"true"}}'
```

---

## 📊 What Happens During Update

### Workflow Steps

1. **Checkout Repository** (10 sec)
   - Fetches latest code
   - Ensures scripts are executable

2. **Authenticate GitHub CLI** (5 sec)
   - Uses GitHub token
   - Verifies permissions

3. **Run Star Scripts** (10-20 min)
   - Executes all relevant scripts
   - Stars new repositories
   - Skips already-starred repos
   - Continues on errors

4. **Generate Report** (30 sec)
   - Creates update summary
   - Counts total stars
   - Lists updated categories

5. **Create GitHub Issue** (10 sec)
   - Posts summary to Issues
   - Includes statistics
   - Links to workflow run

6. **Commit Report** (30 sec)
   - Saves to monthly-reports/
   - Pushes to repository

**Total Time:** ~15-25 minutes

---

## 📁 Output Files

### Monthly Reports Directory

```
monthly-reports/
├── update-2025-01.md
├── update-2025-02.md
├── update-2025-03.md
└── ...
```

Each report contains:
- Update date and time
- Categories updated
- Scripts executed
- Statistics
- Next scheduled run

### GitHub Issues

New issue created monthly:
- Title: `🌟 Repository Update - YYYY-MM-DD`
- Labels: `automated`, `repository-update`, `monthly-update`
- Body: Full update summary with stats

---

## 🎯 Category-Specific Updates

### Update Only AI/ML

```bash
gh workflow run update-starred-repos.yml -f category=ai
```

### Update Only Security

```bash
gh workflow run update-starred-repos.yml -f category=security
```

### Update Only Networking

```bash
gh workflow run update-starred-repos.yml -f category=networking
```

### Available Categories

- `all` - All categories (default)
- `ai` - AI & ML repos
- `security` - Security repos
- `networking` - Networking repos
- `python` - Python repos
- `conferences` - Conference repos
- `enterprise` - Enterprise repos
- `mlops` - MLOps repos
- `aiops` - AIOps repos
- `systems` - Systems programming
- `databases` - Database repos
- `quantum` - Quantum computing
- `certifications` - IT certifications
- `prompt-engineering` - Prompt engineering

---

## 📈 Monitoring

### View Workflow Runs

**GitHub Web:**
https://github.com/nbajpai-code/my-starred-repos/actions/workflows/update-starred-repos.yml

**GitHub CLI:**
```bash
# List recent runs
gh run list --workflow=update-starred-repos.yml

# View latest run
gh run view --workflow=update-starred-repos.yml

# Watch run in progress
gh run watch
```

### Check Logs

```bash
# Get latest run ID
RUN_ID=$(gh run list --workflow=update-starred-repos.yml --limit 1 --json databaseId --jq '.[0].databaseId')

# View logs
gh run view $RUN_ID --log
```

### Notifications

Monthly update creates a GitHub Issue you can subscribe to:
1. Go to Issues tab
2. Find "Repository Update" issue
3. Click "Subscribe" to get notifications

---

## 🐛 Troubleshooting

### Workflow Not Running

**Check:**
1. Actions tab is enabled
2. Workflow file exists in `.github/workflows/`
3. Schedule syntax is correct
4. Branch is `master` or `main`

**Solution:**
```bash
# Manually trigger to test
gh workflow run update-starred-repos.yml
```

### Some Scripts Failing

**Normal Behavior:**
- Scripts continue on error
- "Already starred" warnings are expected
- Workflow completes even if individual scripts fail

**If All Scripts Fail:**
1. Check GitHub token permissions
2. Verify `gh auth status`
3. Check rate limits: https://github.com/settings/billing
4. Review workflow logs

### Rate Limiting

**Symptoms:**
- "API rate limit exceeded" errors
- Workflow timing out

**Solutions:**
1. Reduce update frequency (switch to quarterly)
2. Split into category-specific runs
3. Add delays between scripts (edit workflow)

### Permission Denied

**Error:** "Permission denied" or "refusing to allow"

**Fix:**
1. Go to Settings → Actions → General
2. Workflow permissions → "Read and write permissions"
3. Check "Allow GitHub Actions to create and approve pull requests"
4. Save

---

## 🔧 Advanced Customization

### Add New Star Script

1. Create new script: `star_new_category.sh`
2. Make executable: `chmod +x star_new_category.sh`
3. Add to workflow:

```yaml
- name: Update New Category
  if: github.event.inputs.category == 'all'
  continue-on-error: true
  run: |
    echo "📦 Updating New Category..."
    ./star_new_category.sh || echo "⚠️ Some repos may already be starred"
```

### Add Email Notifications

Add to workflow:

```yaml
- name: Send Email
  uses: dawidd6/action-send-mail@v3
  with:
    server_address: smtp.gmail.com
    server_port: 465
    username: ${{ secrets.EMAIL_USERNAME }}
    password: ${{ secrets.EMAIL_PASSWORD }}
    subject: 🌟 Monthly Repository Update Complete
    to: your-email@example.com
    from: GitHub Actions
    body: file://update-report.md
```

Add secrets:
- `EMAIL_USERNAME`
- `EMAIL_PASSWORD`

### Add Slack Notification

```yaml
- name: Slack Notification
  uses: 8398a7/action-slack@v3
  with:
    status: ${{ job.status }}
    text: '🌟 Monthly repository update completed!'
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
  if: always()
```

Add secret: `SLACK_WEBHOOK`

---

## 📊 Statistics & Analytics

### View Star History

```bash
# Total stars
gh api user/starred --paginate | jq '. | length'

# Stars per page (sample)
gh api user/starred --per-page 100 | jq '. | length'

# Recently starred
gh api user/starred --per-page 10 | jq '.[].full_name'
```

### Monthly Growth

Check `monthly-reports/` directory to track:
- Star count over time
- New categories added
- Trending repositories

### Export Star Data

```bash
# Export to JSON
gh api user/starred --paginate > all-stars.json

# Extract names
jq '.[].full_name' all-stars.json

# Count by language
jq '[.[].language] | group_by(.) | map({language: .[0], count: length})' all-stars.json
```

---

## 🎯 Best Practices

### 1. Review Before Full Update

```bash
# Test with single category first
gh workflow run update-starred-repos.yml -f category=python
```

### 2. Monitor First Few Runs

- Check workflow logs
- Verify GitHub Issues are created
- Confirm reports in monthly-reports/

### 3. Adjust Frequency as Needed

- Start with monthly
- Switch to quarterly if too frequent
- Use manual triggers for immediate updates

### 4. Keep Scripts Updated

- Review star scripts periodically
- Remove deprecated repositories
- Add new trending projects

### 5. Archive Old Reports

```bash
# Keep last 12 months, archive older
mkdir -p monthly-reports/archive
mv monthly-reports/update-2023-*.md monthly-reports/archive/
```

---

## 📅 Schedule Reference

| Frequency | Cron Expression | Description |
|-----------|----------------|-------------|
| **Monthly** | `0 9 1 * *` | 1st of month, 9 AM UTC |
| **Quarterly** | `0 9 1 1,4,7,10 *` | Jan/Apr/Jul/Oct 1st, 9 AM UTC |
| **Bi-Monthly** | `0 9 1 */2 *` | Every 2 months, 1st day, 9 AM UTC |
| **Weekly** | `0 9 * * 1` | Every Monday, 9 AM UTC |
| **Bi-Weekly** | `0 9 1,15 * *` | 1st and 15th of month, 9 AM UTC |

---

## 🆘 Support

### Useful Commands

```bash
# Check workflow status
gh workflow view update-starred-repos.yml

# List all workflows
gh workflow list

# Disable workflow
gh workflow disable update-starred-repos.yml

# Enable workflow
gh workflow enable update-starred-repos.yml

# View recent run
gh run list --limit 5
```

### Resources

- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Cron Expression Generator](https://crontab.guru/)
- [GitHub API Rate Limits](https://docs.github.com/en/rest/overview/resources-in-the-rest-api#rate-limiting)

---

## ✅ Quick Checklist

- [ ] Workflow deployed to `.github/workflows/`
- [ ] First manual run completed successfully
- [ ] GitHub Issues created correctly
- [ ] Monthly reports directory exists
- [ ] Update frequency configured (monthly/quarterly)
- [ ] Notifications set up (optional)
- [ ] Actions permissions verified
- [ ] Starred count tracking works

---

**Your repository collection will now stay automatically updated! 🌟**

*Last updated: 2025-01-17*
