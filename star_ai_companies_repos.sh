#!/bin/bash

# Top AI Companies GitHub Repositories Star Script
# NVIDIA, Anthropic, OpenAI, and Perplexity

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

echo "🚀 Starting to star AI Companies repositories..."
echo "============================================================"
echo ""

# NVIDIA - Main Organization
echo "💚 NVIDIA - Main Organization..."
star_repo "NVIDIA/open-gpu-kernel-modules"
star_repo "NVIDIA/nvidia-container-toolkit"
star_repo "NVIDIA/k8s-device-plugin"
star_repo "NVIDIA/gpu-operator"
star_repo "NVIDIA/nvidia-docker"
star_repo "NVIDIA/cuda-samples"
star_repo "NVIDIA/cudnn-frontend"
star_repo "NVIDIA/cutlass"
star_repo "NVIDIA/TensorRT"
star_repo "NVIDIA/TensorRT-LLM"
star_repo "NVIDIA/Megatron-LM"
star_repo "NVIDIA/NeMo"
star_repo "NVIDIA/NeMo-Guardrails"
star_repo "NVIDIA/GenerativeAIExamples"
star_repo "NVIDIA/cuda-quantum"
star_repo "NVIDIA/cuDF"
star_repo "NVIDIA/cuML"
star_repo "NVIDIA/cuGraph"
star_repo "NVIDIA/DALI"
star_repo "NVIDIA/apex"
star_repo "NVIDIA/TransformerEngine"
star_repo "NVIDIA/DeepLearningExamples"
star_repo "NVIDIA/Fuser"

# NVIDIA Research (NVlabs)
echo ""
echo "🔬 NVIDIA Research (NVlabs)..."
star_repo "NVlabs/stylegan"
star_repo "NVlabs/stylegan2"
star_repo "NVlabs/stylegan3"
star_repo "NVlabs/eg3d"
star_repo "NVlabs/instant-ngp"
star_repo "NVlabs/neuralangelo"
star_repo "NVlabs/tiny-cuda-nn"
star_repo "NVlabs/sana"
star_repo "NVlabs/sionna"
star_repo "NVlabs/kaolin"
star_repo "NVlabs/nvdiffrast"
star_repo "NVlabs/imaginaire"
star_repo "NVlabs/VILA"

# NVIDIA AI-IOT
echo ""
echo "🤖 NVIDIA AI-IOT..."
star_repo "NVIDIA-AI-IOT/jetson-inference"
star_repo "NVIDIA-AI-IOT/torch2trt"
star_repo "NVIDIA-AI-IOT/deepstream_python_apps"

# NVIDIA RAPIDS
echo ""
echo "🚀 NVIDIA RAPIDS..."
star_repo "rapidsai/cudf"
star_repo "rapidsai/cuml"
star_repo "rapidsai/cugraph"
star_repo "rapidsai/cusignal"

# Anthropic - Official Repositories
echo ""
echo "🟣 Anthropic - Official Repositories..."
star_repo "anthropics/anthropic-sdk-python"
star_repo "anthropics/anthropic-sdk-typescript"
star_repo "anthropics/anthropic-sdk-java"
star_repo "anthropics/anthropic-sdk-go"
star_repo "anthropics/anthropic-sdk-php"
star_repo "anthropics/anthropic-quickstarts"
star_repo "anthropics/anthropic-tools"
star_repo "anthropics/courses"
star_repo "anthropics/prompt-eng-interactive-tutorial"
star_repo "anthropics/anthropic-cookbook"
star_repo "anthropics/claude-code"
star_repo "anthropics/skills"

# OpenAI - Official Repositories
echo ""
echo "🔵 OpenAI - Official Repositories..."
star_repo "openai/openai-python"
star_repo "openai/openai-node"
star_repo "openai/openai-go"
star_repo "openai/openai-java"
star_repo "openai/openai-dotnet"
star_repo "openai/openai-cookbook"
star_repo "openai/openai-quickstart-python"
star_repo "openai/openai-quickstart-node"
star_repo "openai/gpt-2"
star_repo "openai/whisper"
star_repo "openai/CLIP"
star_repo "openai/DALL-E"
star_repo "openai/point-e"
star_repo "openai/shap-e"
star_repo "openai/jukebox"
star_repo "openai/tiktoken"
star_repo "openai/evals"
star_repo "openai/openai-realtime-api-beta"
star_repo "openai/simple-evals"
star_repo "openai/swarm"
star_repo "openai/codex"
star_repo "openai/openai-agents-js"
star_repo "openai/gpt-oss-120b"
star_repo "openai/gpt-oss-20b"
star_repo "openai/harmony"
star_repo "openai/grade-school-math"
star_repo "openai/baselines"
star_repo "openai/gym"
star_repo "openai/multiagent-particle-envs"
star_repo "openai/mujoco-py"

# Perplexity AI - Official Repositories
echo ""
echo "🟦 Perplexity AI - Official Repositories..."
star_repo "perplexityai/modelcontextprotocol"
star_repo "perplexityai/api-cookbook"
star_repo "perplexityai/perplexity-py"
star_repo "perplexityai/pplx-garden"

# Community Projects - Perplexica (Open Source Alternative)
echo ""
echo "🌟 Perplexity Community Projects..."
star_repo "ItzCrazyKns/Perplexica"

# Related AI Research Organizations
echo ""
echo "🎓 Related AI Research..."
star_repo "openai/triton"
star_repo "openai/guided-diffusion"
star_repo "openai/improved-diffusion"
star_repo "openai/consistency_models"
star_repo "openai/glide-text2im"

# Multi-Modal & Vision
echo ""
echo "👁️  Multi-Modal & Vision Projects..."
star_repo "openai/CLIP"
star_repo "openai/openai-vision-api"

# Tools & Utilities
echo ""
echo "🛠️  Tools & Utilities..."
star_repo "NVIDIA/AIStore"
star_repo "NVIDIA/NVTabular"
star_repo "NVIDIA/MinkowskiEngine"

# Awesome Lists Related
echo ""
echo "⭐ Awesome Lists..."
star_repo "taishi-i/awesome-ChatGPT-repositories"

echo ""
echo "============================================================"
echo "✅ Done! All AI Companies repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   💚 NVIDIA Main: 23 repos"
echo "   🔬 NVIDIA Research (NVlabs): 13 repos"
echo "   🤖 NVIDIA AI-IOT: 3 repos"
echo "   🚀 NVIDIA RAPIDS: 4 repos"
echo "   🟣 Anthropic: 12 repos"
echo "   🔵 OpenAI: 30 repos"
echo "   🟦 Perplexity AI: 4 repos"
echo "   🌟 Community Projects: 1 repo"
echo "   🎓 Related Research: 4 repos"
echo "   👁️  Multi-Modal: 2 repos"
echo "   🛠️  Tools & Utilities: 3 repos"
echo "   ⭐ Awesome Lists: 1 repo"
echo ""
echo "🎉 Total: ~100 AI Companies repositories starred!"
echo ""
echo "🏢 Companies Covered:"
echo "   ✓ NVIDIA (Main, Research, RAPIDS, AI-IOT)"
echo "   ✓ Anthropic (Claude AI, SDKs, Tools)"
echo "   ✓ OpenAI (GPT, Whisper, CLIP, DALL-E, Codex)"
echo "   ✓ Perplexity AI (API, MCP, Tools)"
