#!/bin/bash

# Script to star OpenAI Top Resources (Hiring, Research & Technical) repositories
# Created: 2025-11-16

echo "Starting to star OpenAI Top Resources repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # OpenAI Core & API - 10 repos
    # ========================================

    "openai/openai-python"
    "openai/openai-node"
    "openai/openai-go"
    "openai/openai-dotnet"
    "openai/openai-java"
    "openai/openai-cookbook"
    "openai/openai-openapi"
    "openai/tiktoken"
    "openai/evals"
    "openai/swarm"

    # ========================================
    # OpenAI Models & Research - 15 repos
    # ========================================

    "openai/whisper"
    "openai/CLIP"
    "openai/gpt-2"
    "openai/gpt-3"
    "openai/gpt-oss"
    "openai/chatgpt-retrieval-plugin"
    "openai/DALL-E"
    "openai/jukebox"
    "openai/shap-e"
    "openai/point-e"
    "openai/consistency_models"
    "openai/guided-diffusion"
    "openai/improved-diffusion"
    "openai/glide-text2im"
    "openai/glow"

    # ========================================
    # OpenAI Agents & Tools - 10 repos
    # ========================================

    "openai/openai-agents-python"
    "openai/openai-agents-js"
    "openai/agents.md"
    "openai/openai-realtime-agents"
    "openai/openai-realtime-console"
    "openai/openai-realtime-api-beta"
    "openai/openai-realtime-embedded"
    "openai/openai-cs-agents-demo"
    "openai/openai-cua-sample-app"
    "openai/codex"

    # ========================================
    # OpenAI Reinforcement Learning - 10 repos
    # ========================================

    "openai/gym"
    "openai/baselines"
    "openai/spinningup"
    "openai/universe"
    "openai/retro"
    "openai/roboschool"
    "openai/mujoco-py"
    "openai/evolution-strategies-starter"
    "openai/procgen"
    "openai/universe-starter-agent"

    # ========================================
    # OpenAI Quickstarts & Examples - 10 repos
    # ========================================

    "openai/openai-quickstart-node"
    "openai/openai-quickstart-python"
    "openai/openai-assistants-quickstart"
    "openai/plugins-quickstart"
    "openai/gpt-discord-bot"
    "openai/openai-apps-sdk-examples"
    "openai/openai-chatkit-starter-app"
    "openai/openai-responses-starter-app"
    "openai/openai-structured-outputs-samples"
    "openai/openai-testing-agent-demo"

    # ========================================
    # OpenAI Research Code - 15 repos
    # ========================================

    "openai/human-eval"
    "openai/prm800k"
    "openai/weak-to-strong"
    "openai/simple-evals"
    "openai/transformer-debugger"
    "openai/grok"
    "openai/image-gpt"
    "openai/grade-school-math"
    "openai/following-instructions-human-feedback"
    "openai/automated-interpretability"
    "openai/frontier-evals"
    "openai/mle-bench"
    "openai/SWELancer-Benchmark"
    "openai/model_spec"
    "openai/gpt-5-coding-examples"

    # ========================================
    # OpenAI Multi-Agent & Competition - 10 repos
    # ========================================

    "openai/multiagent-particle-envs"
    "openai/maddpg"
    "openai/multi-agent-emergence-environments"
    "openai/neural-mmo"
    "openai/multiagent-competition"
    "openai/imitation"
    "openai/large-scale-curiosity"
    "openai/random-network-distillation"
    "openai/Video-Pre-Training"
    "openai/requests-for-research"

    # ========================================
    # OpenAI Generative Models - 10 repos
    # ========================================

    "openai/improved-gan"
    "openai/InfoGAN"
    "openai/pixel-cnn"
    "openai/gpt-2-output-dataset"
    "openai/finetune-transformer-lm"
    "openai/lm-human-preferences"
    "openai/summarize-from-feedback"
    "openai/generating-reviews-discovering-sentiment"
    "openai/dalle-2-preview"
    "openai/consistencydecoder"

    # ========================================
    # OpenAI Utilities & Infrastructure - 10 repos
    # ========================================

    "openai/chatkit-js"
    "openai/harmony"
    "openai/sparse_attention"
    "openai/blocksparse"
    "openai/supervised-reptile"
    "openai/kubernetes-ec2-autoscaler"
    "openai/codex-universal"
    "openai/codex-action"
    "openai/deeptype"
    "openai/build-hours"
)

# Counter for tracking
total=${#repos[@]}
success=0
failed=0
already_starred=0

# Loop through each repository and star it
for repo in "${repos[@]}"; do
    echo -n "Starring $repo... "

    # Try to star the repository
    result=$(gh api --method PUT -H "Accept: application/vnd.github+json" \
        "/user/starred/$repo" 2>&1)

    if [ $? -eq 0 ]; then
        echo "✓ Success"
        ((success++))
    else
        # Check if already starred
        if echo "$result" | grep -q "Not Found"; then
            echo "✗ Not Found"
            ((failed++))
        else
            echo "✓ Already starred or success"
            ((already_starred++))
        fi
    fi

    # Small delay to avoid rate limiting
    sleep 0.5
done

echo ""
echo "========================================"
echo "Summary:"
echo "Total repositories: $total"
echo "Successfully starred: $success"
echo "Already starred: $already_starred"
echo "Failed (not found): $failed"
echo "========================================"
echo ""
echo "Breakdown by Category:"
echo "  - OpenAI Core & API: 10 repos"
echo "  - OpenAI Models & Research: 15 repos"
echo "  - OpenAI Agents & Tools: 10 repos"
echo "  - OpenAI Reinforcement Learning: 10 repos"
echo "  - OpenAI Quickstarts & Examples: 10 repos"
echo "  - OpenAI Research Code: 15 repos"
echo "  - OpenAI Multi-Agent & Competition: 10 repos"
echo "  - OpenAI Generative Models: 10 repos"
echo "  - OpenAI Utilities & Infrastructure: 10 repos"
echo "========================================"
echo ""
echo "🎯 HIRING & CAREERS:"
echo "  - Careers: https://openai.com/careers/"
echo "  - Residency Program: https://openai.com/residency/"
echo "  - Interview Guide: https://openai.com/interview-guide/"
echo "  - Emerging Talent: https://openai.com/careers/emerging-talent/"
echo ""
echo "📚 DOCUMENTATION & LEARNING:"
echo "  - API Docs: https://platform.openai.com/docs/"
echo "  - API Reference: https://platform.openai.com/docs/api-reference/"
echo "  - Quickstart: https://platform.openai.com/docs/quickstart"
echo "  - Cookbook: https://github.com/openai/openai-cookbook"
echo ""
echo "🔬 RESEARCH & PUBLICATIONS:"
echo "  - Research: https://openai.com/research/"
echo "  - Publications: https://openai.com/research/index/publication/"
echo "  - News: https://openai.com/news/"
echo "  - Blog: https://openai.com/news/research/"
echo "========================================"
echo "Done!"
