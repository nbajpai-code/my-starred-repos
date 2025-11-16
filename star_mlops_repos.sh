#!/bin/bash

# MLOps GitHub Repositories Star Script
# MLOps Platforms, Hyperparameter Optimization, Model Serving

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

echo "🚀 Starting to star MLOps repositories..."
echo "============================================================"
echo ""

# Core MLOps Platforms
echo "📊 Core MLOps Platforms..."
star_repo "mlflow/mlflow"
star_repo "kubeflow/kubeflow"
star_repo "iterative/dvc"
star_repo "Netflix/metaflow"
star_repo "SeldonIO/seldon-core"
star_repo "allegroai/clearml"
star_repo "iterative/cml"
star_repo "jozu-ai/kitops"
star_repo "zenml-io/zenml"
star_repo "feast-dev/feast"
star_repo "bentoml/BentoML"
echo ""

# Hyperparameter Optimization
echo "🎯 Hyperparameter Optimization..."
star_repo "optuna/optuna"
star_repo "scikit-optimize/scikit-optimize"
star_repo "autonomio/talos"
star_repo "ray-project/ray"
echo ""

# Model Serving & Deployment
echo "🚀 Model Serving & Deployment..."
star_repo "vllm-project/vllm"
star_repo "pytorch/serve"
star_repo "kserve/kserve"
star_repo "onnx/onnx"
star_repo "tensorflow/serving"
echo ""

# Distributed Training
echo "⚡ Distributed Training..."
star_repo "microsoft/DeepSpeed"
star_repo "horovod/horovod"
star_repo "hpcaitech/ColossalAI"
echo ""

# Kubernetes ML
echo "☸️ Kubernetes ML..."
star_repo "kubeflow/pipelines"
star_repo "volcano-sh/volcano"
star_repo "kubedl-io/kubedl"
echo ""

# Model Fine-tuning
echo "🔧 Model Fine-tuning..."
star_repo "hiyouga/LLaMA-Factory"
star_repo "huggingface/peft"
echo ""

# RAG & Vector Databases
echo "🗄️ RAG & Vector Databases..."
star_repo "milvus-io/milvus"
star_repo "chroma-core/chroma"
star_repo "qdrant/qdrant"
star_repo "weaviate/weaviate"
star_repo "pgvector/pgvector"
echo ""

# Model Optimization
echo "⚙️ Model Optimization..."
star_repo "ggerganov/llama.cpp"
star_repo "IST-DASLab/gptq"
star_repo "TimDettmers/bitsandbytes"
echo ""

# Learning Resources
echo "📚 MLOps Learning Resources..."
star_repo "kelvins/awesome-mlops"
star_repo "awesome-mlops/awesome-mlops-platforms"
star_repo "visenger/awesome-mlops"
star_repo "GokuMohandas/Made-With-ML"
echo ""

echo "============================================================"
echo "✅ Done! MLOps repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   ✓ Core MLOps Platforms (11 repos)"
echo "   ✓ Hyperparameter Optimization (4 repos)"
echo "   ✓ Model Serving & Deployment (5 repos)"
echo "   ✓ Distributed Training (3 repos)"
echo "   ✓ Kubernetes ML (3 repos)"
echo "   ✓ Model Fine-tuning (2 repos)"
echo "   ✓ RAG & Vector Databases (5 repos)"
echo "   ✓ Model Optimization (3 repos)"
echo "   ✓ Learning Resources (4 repos)"
echo ""
