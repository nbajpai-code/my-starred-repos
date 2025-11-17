#!/bin/bash

# Script to star arXiv Research Papers & Automated Tracking repositories
# Created: 2025-11-17
# Focus: AI/ML/RL/MLOps/AIOps research papers from arXiv

echo "Starting to star arXiv Research Papers repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # arXiv Daily Automated Tracking - 12 repos
    # ========================================

    "dw-dengwei/daily-arXiv-ai-enhanced"        # Automatically crawl arXiv papers daily and summarize with AI
    "AutoLLM/ArxivDigest"                       # ArXiv Digest with personalized recommendations using LLMs
    "zezhishao/DailyArXiv"                      # Daily ArXiv Papers - automated fetching with keywords
    "Tavish9/awesome-daily-AI-arxiv"            # Daily AI Research Digest: AI/NLP/CV/Robotics breakthroughs
    "jamwithai/arxiv-paper-curator"             # Research assistant system - automated paper fetching with RAG
    "Blake-Jiang/ad-arxiv-daily"                # Daily arXiv papers in autonomous driving
    "yyyanbj/arxiv-daily"                       # Auto-update papers using GitHub Actions (every 12 hours)
    "dair-ai/ML-Papers-of-the-Week"             # Highlighting top ML papers every week (DAIR.AI)
    "ML-Repositories/ML-Research-Paper-Manager" # Organize and track ML research papers
    "naganandy/graph-based-deep-learning-literature" # Daily tracking of graph neural networks papers
    "terryum/daily-paper-noti"                  # Daily paper notification service for arXiv
    "kobiso/Computer-Vision-Paper-List"         # Computer vision papers organized by conference

    # ========================================
    # LLM & Reinforcement Learning Papers - 8 repos
    # ========================================

    "WindyLab/LLM-RL-Papers"                    # Monitoring recent cross-research on LLM & RL on arXiv
    "Jun-jie-Huang/awesome-LLM-AIOps"           # Academic research & industrial materials on LLM and AIOps
    "opendilab/awesome-RLHF"                    # Awesome RLHF (Reinforcement Learning from Human Feedback)
    "tigerneil/awesome-deep-rl"                 # Curated list of deep reinforcement learning resources
    "aikorea/awesome-rl"                        # Reinforcement learning resources
    "kengz/awesome-deep-rl"                     # Deep reinforcement learning papers
    "clvrai/awesome-rl-envs"                    # RL environments
    "jiachenli94/Awesome-Interaction-Aware-Trajectory-Prediction" # Multi-agent RL and prediction

    # ========================================
    # MLOps & AIOps Research Papers - 10 repos
    # ========================================

    "visenger/awesome-mlops"                    # Curated list of MLOps tools and resources
    "kelvins/awesome-mlops"                     # References for MLOps (Machine Learning Operations)
    "cdfoundation/sig-mlops"                    # MLOps SIG - defining MLOps principles
    "ml-tooling/best-of-ml-python"              # Ranked list of Python ML libraries and tools
    "josephmisiti/awesome-machine-learning"     # Curated list of ML frameworks, libraries and software
    "dair-ai/ML-YouTube-Courses"                # ML courses from YouTube
    "GokuMohandas/Made-With-ML"                 # Learn ML with production-grade projects
    "microsoft/MLOps"                           # MLOps empowering example implementations
    "Azure/mlops-v2"                            # Azure MLOps (v2) solution accelerators
    "fmind/mlops-python-package"                # MLOps Python package template

    # ========================================
    # Curated ML/DL Paper Collections - 15 repos
    # ========================================

    "terryum/awesome-deep-learning-papers"      # Most cited deep learning papers
    "floodsung/Deep-Learning-Papers-Reading-Roadmap" # Deep Learning papers reading roadmap
    "ChristosChristofidis/awesome-deep-learning" # Curated list of DL tutorials, projects, communities
    "awesomelistsio/awesome-ai-research-papers" # Seminal AI research papers (ML, DL, NLP, CV, RL, Ethics)
    "anubhavshrimal/Machine-Learning-Research-Papers" # ML/DL research papers (updated weekly)
    "endymecy/awesome-deeplearning-resources"   # DL and deep RL research papers with code
    "MartinuzziFrancesco/awesome-scientific-machine-learning" # Scientific ML (SciML) papers and resources
    "byungsoo-oh/ml-systems-papers"             # Machine learning systems papers
    "solaris33/awesome-machine-learning-papers" # ML Papers and Repositories
    "eugeneyan/ml-surveys"                      # Survey papers on ML topics
    "labmlai/annotated_deep_learning_paper_implementations" # Annotated implementations of DL papers
    "stas00/ml-engineering"                     # Machine Learning Engineering guides
    "chiphuyen/machine-learning-systems-design" # ML systems design
    "eugeneyan/applied-ml"                      # Applied ML papers and tech blogs
    "mli/paper-reading"                         # Deep learning paper reading notes

    # ========================================
    # Papers with Code & Benchmarks - 10 repos
    # ========================================

    "paperswithcode/paperswithcode-data"        # Papers with Code dataset
    "paperswithcode/galai"                      # GALACTICA model for science
    "zziz/pwc"                                  # Papers with code sorted by stars
    "RedditSota/state-of-the-art-result-for-machine-learning-problems" # SOTA results
    "Hannibal046/Awesome-LLM"                   # Curated list of LLM papers
    "microsoft/LMOps"                           # General tech for enabling AI capabilities with LLMs
    "google-research/google-research"           # Google Research code and papers
    "facebookresearch/fairseq"                  # Facebook AI Research sequence modeling toolkit
    "huggingface/transformers"                  # State-of-the-art ML for PyTorch, TF, JAX
    "openai/openai-cookbook"                    # Examples and guides for OpenAI API

    # ========================================
    # Top ML Conferences Papers - 12 repos
    # ========================================

    "vlgiitr/papers_we_read"                    # Papers read at Vision and Language Group IIT Roorkee
    "conference-papers/neurips-2024"            # NeurIPS 2024 accepted papers
    "conference-papers/iclr-2025"               # ICLR 2025 accepted papers
    "conference-papers/icml-2024"               # ICML 2024 accepted papers
    "conference-papers/cvpr-2024"               # CVPR 2024 accepted papers
    "yzhao062/anomaly-detection-resources"      # Anomaly detection papers and resources
    "academic/awesome-datascience"              # Data science resources
    "thuml/Time-Series-Library"                 # Time series papers and benchmarks
    "benedekrozemberczki/awesome-graph-classification" # Graph classification papers
    "benedekrozemberczki/awesome-community-detection" # Community detection papers
    "danielegrattarola/awesome-gnns"            # Graph neural networks papers
    "thunlp/GNNPapers"                          # Must-read GNN papers

    # ========================================
    # Domain-Specific Research Trackers - 8 repos
    # ========================================

    "extreme-assistant/CVPR2024-Paper-Code-Interpretation" # CVPR 2024 papers with code
    "amusi/CVPR2025-Papers-with-Code"           # CVPR 2025 papers tracking
    "52CV/ICCV-2023-Papers"                     # ICCV 2023 papers
    "Vincentqyw/cv-arxiv-daily"                 # CV arXiv daily
    "wangyuan249/cv-arxiv-daily"                # Computer vision arXiv daily tracker
    "naganandy/graph-based-deep-learning-literature" # Graph DL papers daily
    "zhengziqiang/NLP-Paper"                    # NLP papers collection
    "iwangjian/Paper-Reading"                   # AI paper reading notes (NLP, RecSys, KG)

    # ========================================
    # Research Code Implementation - 8 repos
    # ========================================

    "lucidrains/vit-pytorch"                    # Vision Transformer implementations
    "lucidrains/DALLE2-pytorch"                 # DALL-E 2 implementation
    "karpathy/nanoGPT"                          # Simplest, fastest GPT training
    "karpathy/minGPT"                           # Minimal PyTorch re-implementation of GPT
    "rasbt/LLMs-from-scratch"                   # Implementing LLMs from scratch
    "rasbt/deeplearning-models"                 # Deep learning architectures and models
    "dair-ai/Prompt-Engineering-Guide"          # Prompt engineering guide and papers
    "microsoft/generative-ai-for-beginners"     # Generative AI learning path

    # ========================================
    # Academic Institutions & Research Labs - 10 repos
    # ========================================

    "stanford-crfm/helm"                        # Holistic Evaluation of Language Models
    "stanford-futuredata/FrugalGPT"             # Cost-efficient LLM usage
    "mit-han-lab/streaming-llm"                 # Efficient streaming LLM inference
    "cmu-delphi/covidcast"                      # CMU COVID-19 indicators
    "CMU-Perceptual-Computing-Lab/openpose"     # Real-time multi-person keypoint detection
    "berkeley-abc/abc"                          # UC Berkeley logic synthesis
    "ucbrise/clipper"                           # UC Berkeley model serving system
    "mlfoundations/open_clip"                   # OpenCLIP implementation
    "mlfoundations/open_flamingo"               # Open source FLAMINGO
    "EleutherAI/gpt-neox"                       # EleutherAI GPT-NeoX implementation

)

# GitHub CLI command to star repos
for repo in "${repos[@]}"; do
    echo "Starring $repo..."
    gh repo view "$repo" --json name > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        gh api \
            --method PUT \
            -H "Accept: application/vnd.github+json" \
            "/user/starred/$repo" 2>/dev/null

        if [ $? -eq 0 ]; then
            echo "✓ Successfully starred $repo"
        else
            echo "⚠ Already starred or error: $repo"
        fi
    else
        echo "✗ Repository not found: $repo"
    fi

    # Small delay to avoid rate limiting
    sleep 0.5
done

echo ""
echo "=========================================="
echo "Completed! Summary:"
echo "Total repositories: ${#repos[@]}"
echo "=========================================="
echo ""
echo "Categories:"
echo "  - arXiv Daily Automated Tracking: 12 repos"
echo "  - LLM & Reinforcement Learning Papers: 8 repos"
echo "  - MLOps & AIOps Research Papers: 10 repos"
echo "  - Curated ML/DL Paper Collections: 15 repos"
echo "  - Papers with Code & Benchmarks: 10 repos"
echo "  - Top ML Conferences Papers: 12 repos"
echo "  - Domain-Specific Research Trackers: 8 repos"
echo "  - Research Code Implementation: 8 repos"
echo "  - Academic Institutions & Research Labs: 10 repos"
echo "=========================================="
