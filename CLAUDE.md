# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a curated collection of **3,500+ starred GitHub repositories** organized by technology domain. The repository serves as a comprehensive index and reference for professional expertise across AI/ML, Cybersecurity, Cloud Infrastructure, Networking, Systems Programming, Python Development, and Enterprise Solutions.

**Primary Purpose:** Documentation and organization of curated GitHub stars, not active development.

## Architecture & Organization

### Core Documentation Files

- **README.md** - Main entry point with categorized overview of all 3,500+ repos
- **STARRED-INDEX.md** - Comprehensive index with direct links to all starred repositories
- **PROMPT_LINTING_GUIDE.md** - Best practices guide for prompt engineering and validation
- **SETUP.md** - GitHub publishing and maintenance instructions

### Automation Scripts (32 Shell Scripts)

All scripts follow the pattern: `star_<category>_repos.sh`

**Script Categories:**
1. **AI & ML:** `star_ai_repos.sh`, `star_ai_infrastructure_repos.sh`, `star_ai_companies_repos.sh`, `star_mlops_repos.sh`, `star_aiops_repos.sh`, `star_llm_frameworks_repos.sh`
2. **Security & Cloud:** `star_security_cloud_api_repos.sh`
3. **Networking:** `star_network_observability_repos.sh`, `star_datacenter_network_repos.sh`, `star_cisco_observability_repos.sh`, `star_networking_protocols_ai_repos.sh`, `star_sciencelogic_scipy_repos.sh`
4. **Systems Programming:** `star_cpp_go_repos.sh`
5. **Python:** `star_python_projects_repos.sh`, `star_python_conference_repos.sh`
6. **Conferences:** `star_pycon_kubecon_repos.sh`, `star_tech_conferences_repos.sh`, `star_datacenter_conferences_repos.sh`, `star_security_dell_conferences_repos.sh`, `star_ocp_conference_repos.sh`, `star_pm_university_conferences_repos.sh`
7. **Specialized:** `star_coding_agents_benchmarks_repos.sh`, `star_quality_database_repos.sh`, `star_quantum_emerging_tech_repos.sh`, `star_openai_resources_repos.sh`, `star_it_certification_repos.sh`, `star_prompt_engineering_tools.sh`, `star_arxiv_research_papers.sh`, `star_dp600_exam_prep_repos.sh`
8. **Enterprise:** `star_broadcom_repos.sh`, `star_enterprise_conferences_splunk.sh`, `star_testing_observability_tools.sh`

**Script Structure:**
- Each script contains a bash array of `owner/repo` strings
- Uses GitHub CLI (`gh`) to star repositories
- Includes categorized comments matching README.md sections
- Error handling for already-starred repos

### Custom Tooling

**prompt_linter.py** - Production-quality Python tool for LLM prompt validation:
- Security checks: Injection patterns, PII detection
- Clarity analysis: Structure, ambiguity, anti-patterns
- Performance: Length, redundancy, token estimation
- Best practices: Examples, output format, context definition

## Common Development Tasks

### Running the Prompt Linter

```bash
# Analyze a prompt string
python prompt_linter.py "Your prompt text here"

# Analyze a prompt from file
python prompt_linter.py --file prompt.txt

# The tool exits with code 1 if errors are found
```

### Adding a New Automation Script (Complete Workflow)

When creating a new `star_*.sh` script, follow this **complete checklist**:

#### 1. Create the Script
```bash
# Create new script
vim star_new_category_repos.sh

# Make it executable
chmod +x star_new_category_repos.sh

# Test run the script
./star_new_category_repos.sh
```

#### 2. Update Documentation Files

**Required Updates:**
- [ ] `CLAUDE.md` - Add script to "Automation Scripts" list and update count
- [ ] `README.md` - Add new category section with repo count and description
- [ ] `STARRED-INDEX.md` - Add direct links to all new repositories (if applicable)

#### 3. Update GitHub Actions Workflow

**CRITICAL:** Add script to `.github/workflows/update-starred-repos.yml`

```bash
# Edit the workflow file
vim .github/workflows/update-starred-repos.yml
```

**Changes needed:**
1. Add script to appropriate category step (e.g., AI, Security, Networking)
2. Update "Categories Updated" in update report (line ~220)
3. Update GitHub issue template with new category (line ~290)

**Example:**
```yaml
- name: Update AI & ML Repositories
  if: github.event.inputs.category == 'all' || github.event.inputs.category == 'ai'
  run: |
    ./star_ai_repos.sh || echo "⚠️ Some repos may already be starred"
    ./star_new_category_repos.sh || echo "⚠️ Some repos may already be starred"  # ADD THIS
```

#### 4. Commit Changes

```bash
# Stage all modified files
git add star_new_category_repos.sh CLAUDE.md README.md STARRED-INDEX.md .github/workflows/update-starred-repos.yml

# Check what's staged
git status

# Commit with descriptive message
git commit -m "🤖 Add [Category Name] automation script ([count] repos)

- New script: star_new_category_repos.sh with [count] repositories
- Updated CLAUDE.md with script count and categories
- Updated README.md with new category section
- Updated STARRED-INDEX.md with direct links
- Added to GitHub Actions monthly workflow

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>"
```

#### 5. Push to GitHub

**CRITICAL:** Don't forget to push!

```bash
# Push to remote
git push origin master

# Verify push was successful
git status
git log --oneline --decorate -3
```

#### 6. Verify on GitHub

- [ ] Visit https://github.com/nbajpai-code/my-starred-repos
- [ ] Verify new script is visible
- [ ] Check `.github/workflows/update-starred-repos.yml` includes new script
- [ ] Optionally: Manually trigger workflow to test

### Complete Checklist for New Scripts

Use this as a reference when adding any new automation:

- [ ] **Create Script**
  - [ ] Write `star_*.sh` with proper structure
  - [ ] Make executable (`chmod +x`)
  - [ ] Test run locally

- [ ] **Update Documentation**
  - [ ] Update `CLAUDE.md` (script count + categories)
  - [ ] Update `README.md` (new category section)
  - [ ] Update `STARRED-INDEX.md` (direct links)

- [ ] **Update GitHub Actions**
  - [ ] Add script to `.github/workflows/update-starred-repos.yml`
  - [ ] Add to appropriate category step
  - [ ] Update report templates (2 locations)

- [ ] **Git Operations**
  - [ ] Stage all files (`git add`)
  - [ ] Commit with descriptive message
  - [ ] **PUSH to GitHub** (`git push origin master`)
  - [ ] Verify on GitHub web interface

### Updating Documentation (Without New Scripts)

When updating existing scripts or documentation only:

1. Update the appropriate files (README.md, STARRED-INDEX.md, etc.)
2. Update statistics/counts if repos were added
3. Commit all changes together

```bash
git add README.md STARRED-INDEX.md
git commit -m "📝 Update [category] repositories ([count] repos)"
git push origin master
```

### Running Star Scripts

```bash
# Star all repos in a category
./star_ai_repos.sh

# Multiple categories
./star_ai_repos.sh && ./star_security_cloud_api_repos.sh

# All scripts are idempotent - safe to re-run
```

### GitHub Actions Automation

The repository includes automated workflows in `.github/workflows/`:

**update-starred-repos.yml** - Monthly automation to keep stars current:
- Runs on the 1st of every month at 9 AM UTC
- Can be manually triggered for specific categories via workflow_dispatch
- Supports category-specific updates (ai, security, networking, python, etc.)
- Creates monthly update reports in `monthly-reports/` directory
- Automatically creates GitHub issues with update summaries

**Manual trigger from GitHub UI:**
```
Actions → Update Starred Repositories → Run workflow
Select category: all/ai/security/networking/python/conferences/etc.
```

**arxiv-daily-crawler.yml** - Automated arXiv research paper tracking
**blank.yml** - Template for additional custom workflows

## Repository Statistics & Categories

**Total Repositories Tracked:** ~3,500

**Major Categories (from README.md):**
- AI & ML: ~676 repos (NVIDIA, Anthropic, OpenAI, META, Google, Capital One)
- LLM Frameworks & Orchestration: ~153 repos (LangChain, LlamaIndex, Haystack, AutoGen, CrewAI)
- AIOps: ~10 repos (Keep, AIOpsLab, awesome-AIOps)
- Cybersecurity & DevSecOps: ~132 repos (OWASP, SAST/DAST, Container Security)
- Cloud Infrastructure: ~200 repos (AWS, Azure, GCP, OCI, IaC)
- Networking & Observability: ~376 repos (ScienceLogic, Cisco FSO, DataCenter)
- Networking Protocols: ~145 repos (BGP, OSPF, EVPN, SDN, MPLS, 5G Core)
- Cloud Native & CNCF: ~162 repos (Kubernetes, Prometheus, Service Mesh)
- Systems Programming: ~98 repos (LLVM, C++, Go, gRPC)
- Python Development: ~136 repos (Frameworks, Tools, Best Practices)
- Conference Resources: ~294 repos (PyCon, KubeCon, Ray Summit, PyTorch, SciPy)
- AI Coding Agents & Benchmarks: ~45 repos (Cline, BigCode, HumanEval)
- Quality Engineering & Testing: ~65 repos (Selenium, Cypress, Playwright)
- Database Technologies: ~120 repos (MongoDB, PostgreSQL, Redis, Elasticsearch)
- Quantum & Emerging Tech: ~100 repos (Qiskit, WebAssembly, Edge Computing)
- OpenAI Resources: ~100 repos (APIs, Models, Research, RL)
- Product Management & University: ~38 repos (CMU, Stanford, MIT, Top ML Papers)
- IT/Tech Certifications: ~96 repos (Kubernetes, AWS, Azure, GCP, HashiCorp)
- DP-600 Exam Prep: ~35 repos (Microsoft Fabric Analytics Engineer certification)
- Prompt Engineering: ~90 repos (Linting, Security, Frameworks, Evaluation)
- arXiv Research Papers: Automated daily tracking of ML/AI research
- Enterprise Solutions (Broadcom/CA): ~361 repos (DX NetOps, APM, API Management)
- API Security & Management: ~13 repos (Kong, Tyk, APISIX)

## Key Technology Domains

### AI/ML Focus Areas
- **LLM Frameworks:** LangChain (langchain, langgraph, langsmith, langserve), LlamaIndex (llama_index, llama-hub, llama_deploy), Haystack, Semantic Kernel, DSPy, Pydantic-AI
- **Agent Systems:** AutoGen, CrewAI, MetaGPT, SuperAGI, BabyAGI, AgentGPT, TaskWeaver, Voyager
- **RAG Frameworks:** RAGFlow, Embedchain, PrivateGPT, LocalGPT, Quivr, RAGatouille, RAGAS (evaluation)
- **Type-Safe LLM Tools:** Instructor, Outlines, Guidance, TypeChat, Mirascope, Marvin
- **LLM Observability:** LangFuse, Phoenix, WhyLogs, DeepEval, UpTrain, TruLens, Helicone, OpenLIT
- **Workflow Builders:** LangFlow, Flowise, Dify, AnythingLLM, n8n
- **LLM Infrastructure:** Model serving (vLLM, BentoML), optimization (ONNX, TensorRT)
- **MLOps Platforms:** MLflow, Kubeflow, DVC, Metaflow, ZenML
- **Distributed Training:** Ray, DeepSpeed, Horovod, ColossalAI
- **Vector DBs:** Milvus, Chroma, Qdrant, Weaviate, pgvector, FAISS

### Networking Specializations
- **Observability:** Prometheus, Grafana, OpenTelemetry, eBPF (Cilium, Hubble)
- **Cisco Stack:** DX NetOps, Model-Driven Telemetry, AppDynamics, ThousandEyes, DNA Center
- **ScienceLogic:** OpenTelemetry components, Skylar Automated RCA
- **SDN Controllers:** OpenDaylight, ONOS, Ryu
- **Protocols:** BGP (GoBGP), OSPF (FRRouting), EVPN/VXLAN, MPLS, 5G Core (Open5GS, free5GC)

### Security Domains
- **SAST:** GitHub CodeQL, Semgrep, SonarQube, TruffleHog
- **DAST:** OWASP ZAP, StackHawk, Nuclei
- **Container Security:** Trivy, Grype, Syft, Dockle, Checkov
- **K8s Security:** kube-bench, Kubescape, Falco, OPA/Gatekeeper
- **DevSecOps:** SLSA, Cosign, in-toto, GitGuardian

## Critical Guidelines

### When Modifying Documentation

1. **Maintain Consistency:** Category names and repo counts must match across README.md, STARRED-INDEX.md, and scripts
2. **Preserve Structure:** README.md uses specific markdown formatting with tables, expandable sections, and shields.io badges
3. **Update Statistics:** When adding repos, update the "Repository Statistics" section and individual category counts
4. **Link Integrity:** STARRED-INDEX.md must have working `https://github.com/owner/repo` links

### When Working with Scripts

1. **Array Format:** Each repo must be in `"owner/repository"` format with double quotes
2. **Comments:** Maintain section headers matching README.md categories
3. **Error Handling:** Scripts should continue on errors (already-starred repos)
4. **GitHub CLI:** All scripts assume `gh` is authenticated (`gh auth status`)

### Prompt Linter Development

The prompt_linter.py tool is production code. When modifying:
- Maintain the dataclass-based issue reporting structure
- Keep severity levels (ERROR, WARNING, INFO) distinct
- Preserve CLI interface compatibility (`--file` flag)
- Add new checks as methods following `_check_*` pattern
- Update docstrings for any new detection patterns

## Git Workflow

**Branch:** `master` (legacy name, but keep as-is per git status)
**Main Branch for PRs:** None specified (single-user repo)

**Common Commands:**
```bash
# Check status
git status

# Add and commit documentation updates
git add README.md STARRED-INDEX.md
git commit -m "Add [Category Name] repositories ([count] repos)"

# Add new script
git add star_new_category_repos.sh
chmod +x star_new_category_repos.sh  # Make executable
git commit -m "Add automation for [category] repos"

# Push changes
git push origin master
```

## Dependencies & Requirements

**Required Tools:**
- `gh` (GitHub CLI) - For starring repositories
- `python3` - For prompt_linter.py (stdlib only, no external deps)
- `git` - For version control
- `bash` - For automation scripts

**No Package Manager:** No package.json, requirements.txt, or similar - this is a documentation repository

## Professional Context

This repository reflects expertise in:
- **Cybersecurity:** Microsoft Copilot for Security, Career Essentials in Cybersecurity
- **Cloud Architecture:** Azure AI/Azure Fundamentals, AWS Solutions Architect Associate
- **AI/ML:** Career Essentials in Generative AI, MCP/A2A protocols
- **Networking:** DX NetOps, SMARTS, Network Observability, Model-Driven Telemetry
- **API Security:** API Product Manager, Designer, Security Architect
- **DevSecOps:** Infrastructure automation, CI/CD security

**Current Focus (2025):**
1. Agentic AI Development & MLOps
2. AIOps & Intelligent Operations
3. Cloud Security Automation
4. Network Observability & ScienceLogic
5. Python Excellence & Scientific Computing

## Maintenance Notes

- **Last Updated:** November 18, 2025
- **Update Frequency:** Automated monthly via GitHub Actions (1st of month)
- **Manual Updates:** Via workflow_dispatch or running star scripts directly
- **Purpose:** Professional development, continuous learning, community engagement
- **Visibility:** Public repository for portfolio showcase

## Working with Claude Code

When asked to make changes:
1. **Understand scope:** Is this adding new repos, updating docs, or modifying tooling?
2. **Check consistency:** Verify changes across README.md, STARRED-INDEX.md, and relevant scripts
3. **Preserve formatting:** Markdown tables, shields.io badges, and emoji indicators are intentional
4. **Test locally:** For script changes, verify bash syntax and GitHub CLI commands
5. **Update GitHub Actions:** ALWAYS check if `.github/workflows/update-starred-repos.yml` needs updating
6. **Atomic commits:** Group related changes (e.g., all files for a new category together)
7. **PUSH to GitHub:** Never forget to `git push origin master` after committing

### Common Mistakes to Avoid

❌ **Don't forget these critical steps:**
- Forgetting to add new scripts to GitHub Actions workflow
- Not pushing commits to GitHub (`git push origin master`)
- Missing documentation updates (CLAUDE.md, README.md)
- Not testing scripts before committing
- Forgetting to update script counts in CLAUDE.md
- Not making scripts executable (`chmod +x`)

✅ **Always do:**
- Test scripts locally first
- Update all 3 documentation files (CLAUDE.md, README.md, STARRED-INDEX.md)
- Add to GitHub Actions workflow if creating new automation
- Commit AND push to GitHub
- Verify on GitHub web interface after pushing

## Reference Links

- **LinkedIn:** [linkedin.com/in/nirajbajpai](https://www.linkedin.com/in/nirajbajpai)
- **GitHub Profile:** [github.com/nbajpai-code](https://github.com/nbajpai-code)
- **Repository URL:** [github.com/nbajpai-code/my-starred-repos](https://github.com/nbajpai-code/my-starred-repos)
- **Prompt Linting Guide:** See PROMPT_LINTING_GUIDE.md for comprehensive best practices
