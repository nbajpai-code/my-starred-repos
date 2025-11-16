#!/bin/bash

# GitHub AI Repositories Star Script
# This script will star all the top AI repositories using GitHub CLI API
# Make sure you have GitHub CLI installed and authenticated:
# brew install gh
# gh auth login

star_repo() {
    local repo=$1
    echo -n "⭐ Starring $repo... "
    if gh api --method PUT "/user/starred/$repo" --silent 2>/dev/null; then
        echo "✓"
    else
        echo "✗ (may already be starred or doesn't exist)"
    fi
    sleep 0.3  # Be nice to GitHub API
}

echo "🚀 Starting to star AI repositories..."
echo "================================================"
echo ""

# Major AI Companies & Organizations
echo "📚 Major AI lab repositories..."
star_repo "openai/openai-python"
star_repo "openai/openai-cookbook"
star_repo "openai/swarm"
star_repo "anthropics/anthropic-sdk-python"
star_repo "anthropics/courses"
star_repo "google-research/google-research"
star_repo "google-deepmind/deepmind-research"
star_repo "facebookresearch/llama"
star_repo "facebookresearch/faiss"
star_repo "microsoft/AI"
star_repo "huggingface/transformers"
star_repo "Stability-AI/stablediffusion"

# Protocol & Standards
echo ""
echo "🔌 Protocol repositories..."
star_repo "modelcontextprotocol/specification"
star_repo "modelcontextprotocol/servers"
star_repo "a2aproject/A2A"

# LLM & Agent Frameworks
echo ""
echo "🤖 LLM and agent frameworks..."
star_repo "langchain-ai/langchain"
star_repo "run-llama/llama_index"
star_repo "langgenius/dify"
star_repo "joaomdmoura/crewAI"
star_repo "microsoft/autogen"
star_repo "modelscope/agentscope"

# ML/DL Frameworks
echo ""
echo "🧠 ML/DL frameworks..."
star_repo "pytorch/pytorch"
star_repo "tensorflow/tensorflow"
star_repo "google/jax"

# Open Source Models
echo ""
echo "🦙 Open source model repositories..."
star_repo "meta-llama/llama"
star_repo "meta-llama/llama3"
star_repo "mistralai/mistral-src"
star_repo "EleutherAI/gpt-neox"
star_repo "LAION-AI/Open-Assistant"

# Educational Resources
echo ""
echo "📖 Educational repositories..."
star_repo "microsoft/AI-For-Beginners"
star_repo "microsoft/ML-For-Beginners"
star_repo "karpathy/nn-zero-to-hero"
star_repo "GokuMohandas/Made-With-ML"
star_repo "DataTalksClub/machine-learning-zoomcamp"

# Awesome Lists
echo ""
echo "⭐ Awesome lists..."
star_repo "Shubhamsaboo/awesome-llm-apps"
star_repo "kyrolabs/awesome-agents"
star_repo "punkpeye/awesome-mcp-servers"
star_repo "MamczurMiroslaw/best_ai_knowledge_repos"
star_repo "mbadry1/Top-Deep-Learning"

# Trending Projects
echo ""
echo "🔥 Trending projects..."
star_repo "github/github-mcp-server"
star_repo "n8n-io/n8n"
star_repo "FlowiseAI/Flowise"
star_repo "Mintplex-Labs/anything-llm"

# Notable Contributors
echo ""
echo "👨‍💻 Notable contributor repositories..."
star_repo "karpathy/nanoGPT"
star_repo "karpathy/micrograd"
star_repo "rasbt/LLMs-from-scratch"

echo ""
echo "================================================"
echo "✅ Done! All repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
