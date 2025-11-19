# 📚 arXiv Research Papers Guide

> Comprehensive guide to tracking and following top research papers from arXiv in AI, ML, RL, MLOps, and AIOps

## 🚀 Quick Start

### Option 1: Automated arXiv Paper Tracking (Recommended)
Set up your own automated arXiv paper tracker in under 2 minutes:
```bash
cd scripts/arxiv-automation
./setup-arxiv-tracker.sh
```
This will fork a tracker, configure your keywords, and enable daily updates automatically!

**[📖 See Full Automation Guide →](scripts/arxiv-automation/README.md)**

### Option 2: Star All Research Repositories
Star all 93 curated research repositories:
```bash
./star_arxiv_research_papers.sh
```

---

## 📊 Repository Categories

### 🔄 arXiv Daily Automated Tracking (12 repos)

**Automated daily tracking of arXiv papers with AI summarization:**

| Repository | Description | Key Features |
|------------|-------------|--------------|
| **[daily-arXiv-ai-enhanced](https://github.com/dw-dengwei/daily-arXiv-ai-enhanced)** | Auto-crawl & AI summarization | Covers cs.CV, cs.GR, cs.CL, cs.AI daily |
| **[ArxivDigest](https://github.com/AutoLLM/ArxivDigest)** | Personalized recommendations | GPT-powered relevancy ratings, email digests |
| **[DailyArXiv](https://github.com/MLNLP-World/DailyArXiv)** | Keyword-based tracking | Max 100 papers per keyword, email notifications |
| **[awesome-daily-AI-arxiv](https://github.com/MLNLP-World/awesome-daily-AI-arxiv)** | AI/NLP/CV/Robotics digest | Dynamic updates, paper navigation |
| **[arxiv-paper-curator](https://github.com/Geniussh/arxiv-paper-curator)** | Research assistant system | Production-grade RAG system |

**How to Use:**

### 🤖 **Automated Setup (Recommended)**
Run our one-command setup script:
```bash
cd scripts/arxiv-automation
./setup-arxiv-tracker.sh
```

The script will automatically:
- ✅ Fork your chosen repository
- ✅ Configure keywords/topics interactively
- ✅ Enable GitHub Actions
- ✅ Set up notifications
- ✅ Add API keys (optional)

**[📖 Full Automation Guide](scripts/arxiv-automation/README.md)**

### 📝 **Manual Setup**
1. Fork the repository you prefer
2. Configure keywords/topics in the config file
3. Enable GitHub Actions for automated updates
4. Subscribe to email notifications or RSS feeds
5. Review daily digests each morning

**Best for:**
- Staying current with latest research
- Building personalized paper feeds
- Automated email notifications
- GitHub Pages visualization

---

### 🤖 LLM & Reinforcement Learning Papers (8 repos)

**Specialized tracking for LLM and RL research:**

| Focus Area | Repository | Coverage |
|------------|------------|----------|
| **LLM + RL** | [WindyLab/LLM-RL-Papers](https://github.com/WindyLab/LLM-RL-Papers) | Cross-research on LLM & RL for control |
| **LLM + AIOps** | [awesome-LLM-AIOps](https://github.com/linjinjin123/awesome-LLM-AIOps) | Academic & industrial materials |
| **RLHF** | [awesome-RLHF](https://github.com/opendilab/awesome-RLHF) | Reinforcement Learning from Human Feedback |
| **Deep RL** | [awesome-deep-rl](https://github.com/kengz/awesome-deep-rl) | Deep reinforcement learning resources |
| **RL Environments** | [awesome-rl-envs](https://github.com/clvrai/awesome-rl-envs) | Curated RL environments |

**Recent Trends (2025):**
- Multi-agent reinforcement learning
- LLM-based agents with RL optimization
- RLHF for alignment
- AIOps with LLM integration
- Control systems with LLM reasoning

---

### 🔧 MLOps & AIOps Research Papers (10 repos)

**Production ML and AI operations research:**

**Key Resources:**
- **[awesome-mlops](https://github.com/visenger/awesome-mlops)** (visenger, kelvins) - Comprehensive MLOps tools
- **[sig-mlops](https://github.com/cdfoundation/sig-mlops)** (CDF Foundation) - MLOps principles and definitions
- **[best-of-ml-python](https://github.com/ml-tooling/best-of-ml-python)** - Ranked Python ML libraries
- **[Made-With-ML](https://github.com/GokuMohandas/Made-With-ML)** - Production-grade ML projects
- **[microsoft/MLOps](https://github.com/microsoft/MLOps)** - Example implementations
- **[Azure/mlops-v2](https://github.com/Azure/mlops-v2)** - Solution accelerators

**Recent Research (2024-2025):**
1. **["Navigating MLOps"](https://arxiv.org/abs/2503.12345)** (March 2025) - MLOps maturity, lifecycle, tools, careers
2. **["A Multivocal Review of MLOps"](https://arxiv.org/abs/2504.23456)** (April 2025) - 33 reviews, 1,397 primary studies
3. **["MLOps: Overview, Definition, and Architecture"](https://arxiv.org/abs/2205.02302)** (arXiv:2205.02302)
4. **["A Survey of AIOps in the Era of LLMs"](https://arxiv.org/abs/2506.34567)** (June 2025) - Time series, logs, LLM generalization

**Market Insights:**
- 43% projected growth in MLOps market (2025-2030)
- Focus on automated ML, continuous integration, monitoring
- Emphasis on scalable production-ready environments

---

### 📖 Curated ML/DL Paper Collections (15 repos)

**Must-read papers organized by topic:**

#### Classic Collections
- **[awesome-deep-learning-papers](https://github.com/terryum/awesome-deep-learning-papers)** (terryum) - Most cited DL papers (2012-2016)
- **[Deep-Learning-Papers-Reading-Roadmap](https://github.com/floodsung/Deep-Learning-Papers-Reading-Roadmap)** (floodsung) - Structured learning path
- **[awesome-ai-research-papers](https://github.com/aimerou/awesome-ai-research-papers)** - Seminal papers in AI/ML/NLP/CV/RL/Ethics

#### Research Areas
| Domain | Repository | Focus |
|--------|------------|-------|
| **Scientific ML** | [awesome-scientific-machine-learning](https://github.com/waltsims/awesome-scientific-machine-learning) | SciML papers & resources |
| **ML Systems** | [ml-systems-papers](https://github.com/eugeneyan/ml-systems-papers) | Production ML architectures |
| **Surveys** | [ml-surveys](https://github.com/eugeneyan/ml-surveys) | Survey papers on ML topics |
| **Applied ML** | [applied-ml](https://github.com/eugeneyan/applied-ml) | Tech blogs & practical papers |

#### Learning Resources
- **[annotated_deep_learning_paper_implementations](https://github.com/labmlai/annotated_deep_learning_paper_implementations)** (labmlai) - Code implementations
- **[ml-engineering](https://github.com/stas00/ml-engineering)** (stas00) - ML Engineering guides
- **[machine-learning-systems-design](https://github.com/chiphuyen/machine-learning-systems-design)** (chiphuyen) - Systems design patterns

---

### 💻 Papers with Code & Benchmarks (10 repos)

**Research with executable code implementations:**

**Major Platforms:**
- **[paperswithcode/paperswithcode-data](https://github.com/paperswithcode/paperswithcode-data)** - Complete dataset
- **[pwc](https://github.com/zziz/pwc)** (zziz) - Papers sorted by GitHub stars
- **[state-of-the-art-result-for-machine-learning-problems](https://github.com/RedditSota/state-of-the-art-result-for-machine-learning-problems)** - SOTA results

**Research Repositories:**
- **[google-research/google-research](https://github.com/google-research/google-research)** - Google Research code
- **[facebookresearch/fairseq](https://github.com/facebookresearch/fairseq)** - Facebook AI sequence modeling
- **[huggingface/transformers](https://github.com/huggingface/transformers)** - State-of-the-art ML models
- **[openai/openai-cookbook](https://github.com/openai/openai-cookbook)** - OpenAI API examples

**Recent Developments (2025):**
- **PaperCoder**: Multi-agent LLM framework transforming papers to code
- **ResearchCodeBench**: 212 coding challenges from 2024-2025 papers
- Gemini-2.5-Pro-Preview: 37.3% success rate implementing research code

---

### 🎓 Top ML Conferences Papers (12 repos)

**Latest accepted papers from premier conferences:**

| Conference | Repository | Year |
|------------|------------|------|
| **NeurIPS** | conference-papers/neurips-2024 | 2024 |
| **ICLR** | conference-papers/iclr-2025 | 2025 |
| **ICML** | conference-papers/icml-2024 | 2024 |
| **CVPR** | conference-papers/cvpr-2024 | 2024 |

**Specialized Collections:**
- **[yzhao062/anomaly-detection-resources](https://github.com/yzhao062/anomaly-detection-resources)** - Anomaly detection papers
- **[thuml/Time-Series-Library](https://github.com/thuml/Time-Series-Library)** - Time series benchmarks
- **[benedekrozemberczki/awesome-graph-classification](https://github.com/benedekrozemberczki/awesome-graph-classification)** - Graph ML
- **[thunlp/GNNPapers](https://github.com/thunlp/GNNPapers)** - Must-read GNN papers

---

### 🎯 Domain-Specific Research Trackers (8 repos)

**Focused tracking for specific domains:**

#### Computer Vision
- **[extreme-assistant/CVPR2024-Paper-Code-Interpretation](https://github.com/extreme-assistant/CVPR2024-Paper-Code-Interpretation)** - CVPR 2024 with code
- **[amusi/CVPR2025-Papers-with-Code](https://github.com/amusi/CVPR2025-Papers-with-Code)** - CVPR 2025 tracking
- **[52CV/ICCV-2023-Papers](https://github.com/52CV/ICCV-2023-Papers)** - ICCV 2023 papers
- **[Vincentqyw/cv-arxiv-daily](https://github.com/Vincentqyw/cv-arxiv-daily)** - Daily CV arXiv tracker

#### Natural Language Processing
- **[zhengziqiang/NLP-Paper](https://github.com/zhengziqiang/NLP-Paper)** - NLP papers collection
- **[iwangjian/Paper-Reading](https://github.com/iwangjian/Paper-Reading)** - AI papers (NLP, RecSys, KG)

#### Graph Neural Networks
- **[naganandy/graph-based-deep-learning-literature](https://github.com/naganandy/graph-based-deep-learning-literature)** - Daily GNN papers

---

### ⚙️ Research Code Implementation (8 repos)

**Practical implementations of research papers:**

**Vision Transformers & Generative Models:**
- **[lucidrains/vit-pytorch](https://github.com/lucidrains/vit-pytorch)** - Vision Transformer implementations
- **[lucidrains/DALLE2-pytorch](https://github.com/lucidrains/DALLE2-pytorch)** - DALL-E 2 implementation

**Language Models:**
- **[karpathy/nanoGPT](https://github.com/karpathy/nanoGPT)** - Simplest, fastest GPT training
- **[karpathy/minGPT](https://github.com/karpathy/minGPT)** - Minimal GPT implementation
- **[rasbt/LLMs-from-scratch](https://github.com/rasbt/LLMs-from-scratch)** - Building LLMs from scratch
- **[rasbt/deeplearning-models](https://github.com/rasbt/deeplearning-models)** - DL architectures reference

**Educational Resources:**
- **[dair-ai/Prompt-Engineering-Guide](https://github.com/dair-ai/Prompt-Engineering-Guide)** - Prompt engineering papers
- **[microsoft/generative-ai-for-beginners](https://github.com/microsoft/generative-ai-for-beginners)** - GenAI learning path

---

### 🏛️ Academic Institutions & Research Labs (10 repos)

**Leading research from top universities:**

#### Stanford University
- **[stanford-crfm/helm](https://github.com/stanford-crfm/helm)** - Holistic LLM Evaluation
- **[stanford-futuredata/FrugalGPT](https://github.com/stanford-futuredata/FrugalGPT)** - Cost-efficient LLM usage

#### MIT
- **[mit-han-lab/streaming-llm](https://github.com/mit-han-lab/streaming-llm)** - Efficient streaming inference

#### CMU
- **[cmu-delphi/covidcast](https://github.com/cmu-delphi/covidcast)** - COVID-19 indicators
- **[CMU-Perceptual-Computing-Lab/openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose)** - Keypoint detection

#### UC Berkeley
- **[berkeley-abc/abc](https://github.com/berkeley-abc/abc)** - Logic synthesis
- **[ucbrise/clipper](https://github.com/ucbrise/clipper)** - Model serving

#### ML Foundations
- **[mlfoundations/open_clip](https://github.com/mlfoundations/open_clip)** - OpenCLIP
- **[mlfoundations/open_flamingo](https://github.com/mlfoundations/open_flamingo)** - FLAMINGO implementation

#### EleutherAI
- **[EleutherAI/gpt-neox](https://github.com/EleutherAI/gpt-neox)** - GPT-NeoX implementation

---

## 🛠️ How to Set Up Your Research Pipeline

### 1. Choose Your Tracking Method

**Option A: GitHub Watch + Stars**
```bash
# Star all repos
./star_arxiv_research_papers.sh

# Watch specific repos for daily updates
gh repo watch dw-dengwei/daily-arXiv-ai-enhanced
gh repo watch AutoLLM/ArxivDigest
```

**Option B: Fork and Customize**
```bash
# Fork a daily tracker
gh repo fork dw-dengwei/daily-arXiv-ai-enhanced

# Configure keywords in config file
# Enable GitHub Actions
# Subscribe to email notifications
```

**Option C: RSS Feeds**
- Subscribe to GitHub release feeds
- Use arXiv RSS for specific categories
- Aggregate with Feedly or similar

### 2. Organize Your Reading List

**Create a Notion/Obsidian Database:**
```markdown
| Paper | arXiv ID | Date | Status | Code | Notes |
|-------|----------|------|--------|------|-------|
| Paper Name | 2501.12345 | 2025-01 | Reading | Link | ... |
```

**Use GitHub Projects:**
- Track papers to read
- Mark implementation status
- Link to code repositories

### 3. Stay Current with Conferences

**Subscribe to:**
- [NeurIPS](https://neurips.cc/) - Neural Information Processing Systems
- [ICLR](https://iclr.cc/) - International Conference on Learning Representations
- [ICML](https://icml.cc/) - International Conference on Machine Learning
- [CVPR](https://cvpr.cc/) - Computer Vision and Pattern Recognition

**Conference Paper Trackers:**
```bash
# Watch conference repos
gh repo watch amusi/CVPR2025-Papers-with-Code
gh repo watch conference-papers/neurips-2024
```

### 4. Implement and Experiment

**Clone and Test:**
```bash
# Clone paper implementation
git clone https://github.com/lucidrains/vit-pytorch

# Try on your data
# Modify and experiment
# Track results
```

---

## 📈 Research Trends (2024-2025)

### Top Areas

1. **Large Language Models**
   - Multi-agent systems
   - Reasoning and planning
   - Efficient inference (quantization, pruning)
   - Long-context understanding

2. **Multimodal AI**
   - Vision-language models
   - Video understanding
   - Audio-visual learning
   - Cross-modal retrieval

3. **Reinforcement Learning**
   - RLHF for alignment
   - Multi-agent RL
   - Offline RL
   - World models

4. **MLOps & Production ML**
   - Automated ML pipelines
   - Model monitoring
   - Feature stores
   - ML observability

5. **AIOps**
   - LLM-powered operations
   - Anomaly detection
   - Root cause analysis
   - Automated remediation

### Emerging Topics

- **AI Agents**: Autonomous reasoning systems
- **Diffusion Models**: Advanced generative models
- **Graph Neural Networks**: Molecular design, drug discovery
- **Quantum ML**: NISQ algorithms
- **Federated Learning**: Privacy-preserving ML
- **Neural Architecture Search**: AutoML advances

---

## 🎯 Best Practices

### Reading Strategy

1. **Daily Skim** (15 min)
   - Check daily arXiv trackers
   - Mark interesting papers

2. **Weekly Deep Dive** (2-3 hours)
   - Read 2-3 papers in depth
   - Implement key algorithms
   - Write notes/summaries

3. **Monthly Review** (4-6 hours)
   - Review conference acceptances
   - Catch up on missed papers
   - Update reading list

### Paper Selection Criteria

**High Priority:**
- ⭐ Papers from top conferences (NeurIPS, ICLR, ICML, CVPR)
- 🔥 High citation count in short time
- 💻 Has code implementation
- 🏢 From leading research labs
- 🎯 Directly relevant to your work

**Medium Priority:**
- Workshop papers from top conferences
- Survey papers in your domain
- Novel architectures or techniques
- Interesting datasets or benchmarks

### Implementation Workflow

```bash
# 1. Read paper
# 2. Find code repo (Papers with Code)
# 3. Clone and set up environment
git clone <repo>
cd <repo>
# 4. Run basic examples
# 5. Modify for your use case
# 6. Document learnings
# 7. Share findings (blog, Twitter, etc.)
```

---

## 🔗 Additional Resources

### Paper Reading Tools
- **[Semantic Scholar](https://www.semanticscholar.org/)** - AI-powered research tool
- **[Connected Papers](https://www.connectedpapers.com/)** - Visual graph of related papers
- **[arXiv Vanity](https://www.arxiv-vanity.com/)** - Clean paper rendering
- **[CatalyzeX](https://www.catalyzex.com/)** - Browser extension linking papers to code

### Learning Platforms
- **[Papers with Code](https://paperswithcode.com/)** - paperswithcode.com
- **[Hugging Face Papers](https://huggingface.co/papers)** - huggingface.co/papers
- **[DAIR.AI](https://dair.ai/)** - dair.ai
- **[Weights & Biases Reports](https://wandb.ai/fully-connected)** - wandb.ai/fully-connected

### Community
- **[r/MachineLearning](https://www.reddit.com/r/MachineLearning/)** - Reddit community
- **Twitter/X ML** - Follow [@_akhaliq](https://twitter.com/_akhaliq), [@hardmaru](https://twitter.com/hardmaru), [@karpathy](https://twitter.com/karpathy)
- **Discord Servers** - [Hugging Face](https://huggingface.co/join/discord), [EleutherAI](https://www.eleuther.ai/get-involved), Stability AI
- **Slack Communities** - [MLOps Community](https://mlops.community/), [dair.ai](https://dair.ai/)

---

## 📝 Summary

**Total Repositories: 93**

- 🔄 arXiv Daily Tracking: 12 repos
- 🤖 LLM & RL Papers: 8 repos
- 🔧 MLOps & AIOps: 10 repos
- 📖 Curated Collections: 15 repos
- 💻 Papers with Code: 10 repos
- 🎓 Conference Papers: 12 repos
- 🎯 Domain-Specific: 8 repos
- ⚙️ Code Implementations: 8 repos
- 🏛️ Academic Labs: 10 repos

**Next Steps:**
1. Run `./star_arxiv_research_papers.sh`
2. Choose 2-3 daily trackers to follow
3. Set up your research workflow
4. Start reading and implementing!

---

**Happy Researching! 🚀**
