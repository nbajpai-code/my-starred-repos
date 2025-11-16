#!/bin/bash

# AI Infrastructure GitHub Repositories Star Script
# Focus on model training, deployment, serving, and orchestration

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

echo "🚀 Starting to star AI Infrastructure repositories..."
echo "========================================================"
echo ""

# Model Serving & Inference Engines
echo "🚄 Model Serving & Inference Engines..."
star_repo "vllm-project/vllm"
star_repo "bentoml/BentoML"
star_repo "bentoml/BentoVLLM"
star_repo "triton-inference-server/server"
star_repo "pytorch/serve"
star_repo "tensorflow/serving"
star_repo "SeldonIO/seldon-core"
star_repo "kserve/kserve"
star_repo "ray-project/ray-llm"
star_repo "skypilot-org/skypilot"
star_repo "vllm-project/vllm-frontend"

# MLOps Platforms & Lifecycle Management
echo ""
echo "🔄 MLOps Platforms & Lifecycle Management..."
star_repo "mlflow/mlflow"
star_repo "iterative/dvc"
star_repo "wandb/wandb"
star_repo "allegroai/clearml"
star_repo "zenml-io/zenml"
star_repo "dagster-io/dagster"
star_repo "Netflix/metaflow"
star_repo "flyteorg/flyte"
star_repo "prefecthq/prefect"
star_repo "apache/airflow"

# Distributed Training & Compute
echo ""
echo "⚡ Distributed Training & Compute..."
star_repo "ray-project/ray"
star_repo "microsoft/DeepSpeed"
star_repo "horovod/horovod"
star_repo "hpcaitech/ColossalAI"
star_repo "Lightning-AI/pytorch-lightning"
star_repo "alpa-projects/alpa"
star_repo "determined-ai/determined"
star_repo "facebookresearch/fairscale"

# Kubernetes ML Platforms
echo ""
echo "☸️  Kubernetes ML Platforms..."
star_repo "kubeflow/kubeflow"
star_repo "kubeflow/pipelines"
star_repo "kubeflow/katib"
star_repo "kubeflow/training-operator"
star_repo "volcano-sh/volcano"
star_repo "kubedl-io/kubedl"

# Model Fine-tuning & Training
echo ""
echo "🎯 Model Fine-tuning & Training..."
star_repo "hiyouga/LLaMA-Factory"
star_repo "huggingface/peft"
star_repo "huggingface/accelerate"
star_repo "microsoft/LoRA"
star_repo "artidoro/qlora"
star_repo "guidance-ai/guidance"
star_repo "unslothai/unsloth"

# AI Orchestration & Workflow
echo ""
echo "🎼 AI Orchestration & Workflow..."
star_repo "kestra-io/kestra"
star_repo "argoproj/argo-workflows"
star_repo "argoproj/argo-cd"
star_repo "mage-ai/mage-ai"
star_repo "PrefectHQ/marvin"

# Model Optimization & Quantization
echo ""
echo "🔧 Model Optimization & Quantization..."
star_repo "ggerganov/llama.cpp"
star_repo "IST-DASLab/gptq"
star_repo "AutoGPTQ/AutoGPTQ"
star_repo "TimDettmers/bitsandbytes"
star_repo "intel/neural-compressor"
star_repo "neuralmagic/sparseml"
star_repo "onnx/onnx"
star_repo "microsoft/onnxruntime"

# GPU & Hardware Acceleration
echo ""
echo "🎮 GPU & Hardware Acceleration..."
star_repo "NVIDIA/cuda-samples"
star_repo "NVIDIA/nvidia-docker"
star_repo "NVIDIA/gpu-operator"
star_repo "NVIDIA/k8s-device-plugin"
star_repo "ROCm/ROCm"
star_repo "intel/intel-device-plugins-for-kubernetes"

# Model Registry & Versioning
echo ""
echo "📦 Model Registry & Versioning..."
star_repo "mlflow/mlflow"
star_repo "iterative/dvc"
star_repo "VertaAI/modeldb"
star_repo "allegroai/clearml"

# RAG & Vector Databases
echo ""
echo "🗄️  RAG & Vector Databases..."
star_repo "infiniflow/ragflow"
star_repo "milvus-io/milvus"
star_repo "chroma-core/chroma"
star_repo "qdrant/qdrant"
star_repo "weaviate/weaviate"
star_repo "pgvector/pgvector"
star_repo "facebookresearch/faiss"

# Monitoring & Observability for AI
echo ""
echo "👁️  Monitoring & Observability for AI..."
star_repo "whylabs/whylogs"
star_repo "evidentlyai/evidently"
star_repo "Arize-ai/phoenix"
star_repo "gantry-ml/gantry"

# Data Processing & Feature Stores
echo ""
echo "🏪 Data Processing & Feature Stores..."
star_repo "feast-dev/feast"
star_repo "tecton-ai/tecton-http-client-java"
star_repo "linkedin/feathr"
star_repo "apache/spark"
star_repo "dask/dask"
star_repo "ray-project/ray-data"

# AI Development Frameworks
echo ""
echo "🛠️  AI Development Frameworks..."
star_repo "pytorch/pytorch"
star_repo "tensorflow/tensorflow"
star_repo "google/jax"
star_repo "keras-team/keras"
star_repo "PaddlePaddle/Paddle"

# Experiment Tracking
echo ""
echo "📊 Experiment Tracking..."
star_repo "wandb/wandb"
star_repo "neptune-ai/neptune-client"
star_repo "aimhubio/aim"
star_repo "allegroai/clearml"

# Infrastructure as Code for AI
echo ""
echo "📜 Infrastructure as Code for AI..."
star_repo "pulumi/pulumi"
star_repo "hashicorp/terraform"
star_repo "terraform-aws-modules/terraform-aws-eks"

# Awesome Lists
echo ""
echo "⭐ Awesome Lists..."
star_repo "1duo/awesome-ai-infrastructures"
star_repo "awesomelistsio/awesome-ai-infrastructure"
star_repo "EthicalML/awesome-production-machine-learning"
star_repo "tensorchord/Awesome-LLMOps"

echo ""
echo "========================================================"
echo "✅ Done! All AI Infrastructure repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - Model Serving & Inference: 11 repos"
echo "   - MLOps Platforms: 10 repos"
echo "   - Distributed Training: 8 repos"
echo "   - Kubernetes ML Platforms: 6 repos"
echo "   - Model Fine-tuning: 7 repos"
echo "   - AI Orchestration: 5 repos"
echo "   - Model Optimization: 8 repos"
echo "   - GPU & Hardware: 6 repos"
echo "   - Model Registry: 4 repos"
echo "   - RAG & Vector DBs: 7 repos"
echo "   - Monitoring & Observability: 4 repos"
echo "   - Data Processing & Feature Stores: 6 repos"
echo "   - AI Development Frameworks: 5 repos"
echo "   - Experiment Tracking: 4 repos"
echo "   - Infrastructure as Code: 3 repos"
echo "   - Awesome Lists: 4 repos"
echo ""
echo "🎉 Total: ~98 AI Infrastructure repositories starred!"
