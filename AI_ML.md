# 🤖 Artificial Intelligence & Machine Learning

[← Back to Main](README.md)

## Leading AI Companies (~360 repos)

| Company | Focus Areas | Key Repositories |
|---------|-------------|------------------|
| **💚 NVIDIA** | GPU Computing, CUDA, AI Infrastructure | [Megatron-LM](https://github.com/NVIDIA/Megatron-LM), [NeMo](https://github.com/NVIDIA/NeMo), [TensorRT-LLM](https://github.com/NVIDIA/TensorRT-LLM), [DeepLearningExamples](https://github.com/NVIDIA/DeepLearningExamples) |
| **🟣 Anthropic** | Claude AI, SDKs, Tools | [anthropic-sdk-python](https://github.com/anthropics/anthropic-sdk-python), [claude-code](https://github.com/anthropics/claude-code), [anthropic-cookbook](https://github.com/anthropics/anthropic-cookbook), [courses](https://github.com/anthropics/courses) |
| **🔵 OpenAI** | GPT, Whisper, CLIP | [openai-python](https://github.com/openai/openai-python), [whisper](https://github.com/openai/whisper), [CLIP](https://github.com/openai/CLIP), [swarm](https://github.com/openai/swarm) |
| **🟦 Perplexity** | Search AI, MCP | [api-cookbook](https://github.com/perplexityai/api-cookbook), [modelcontextprotocol](https://github.com/perplexityai/modelcontextprotocol) |
| **🔵 META** | LLaMA, PyTorch, Research | [llama](https://github.com/meta-llama/llama), [llama3](https://github.com/meta-llama/llama3), [pytorch](https://github.com/pytorch/pytorch), [facebookresearch](https://github.com/facebookresearch) |
| **🔴 Google** | Gemini, TensorFlow, Research | [generative-ai-docs](https://github.com/google/generative-ai-docs), [tensorflow](https://github.com/tensorflow/tensorflow), [DeepMind](https://github.com/google-deepmind) |
| **💳 Capital One** | Federated Learning, Data Science | [federated-model-aggregation](https://github.com/capitalone/federated-model-aggregation), [datacompy](https://github.com/capitalone/datacompy), [rubicon-ml](https://github.com/capitalone/rubicon-ml) |

## NVIDIA Research (~13 repos)

- **Generative Models:** StyleGAN series, instant-ngp, Neuralangelo, Sana
- **3D Vision:** eg3d, kaolin, nvdiffrast
- **Frameworks:** tiny-cuda-nn, sionna

## AI Infrastructure & MLOps (~115 repos)

### Core MLOps Platforms (~19 repos)

| Platform | Purpose | Key Features |
|----------|---------|--------------|
| **MLflow** | End-to-end ML lifecycle | Experiment tracking, versioning, deployment |
| **Kubeflow** | ML workflows on K8s | Pipeline orchestration, scalability |
| **DVC** | Data Version Control | Git-like versioning for datasets/models |
| **Metaflow** (Netflix) | Human-centric ML workflows | Real-world use cases focus |
| **Seldon Core** | K8s ML deployment | Monitoring, scaling, A/B testing |
| **ClearML** | Auto-Magical CI/CD | ML workflow automation |
| **CML** | CI/CD for ML | Machine learning project automation |
| **KitOps** | MLOps handoffs | Data scientists to DevOps integration |
| **ZenML** | Extensible MLOps | Framework for ML pipelines |
| **Feast** | Feature store | ML feature management |
| **BentoML** | Production ML services | Model serving framework |

### Hyperparameter Optimization (~4 repos)

- **Optuna** - Hyperparameter optimization framework (TPE, grid search)
- **scikit-optimize** - Minimize expensive black-box functions
- **Talos** - Hyperparameter optimization for TensorFlow, Keras, PyTorch
- **Ray Tune** - Experiment execution and hyperparameter tuning at scale

### Model Serving & Deployment (~11 repos)

- vLLM, BentoML, TensorRT, TorchServe, KServe, Seldon Core
- Model optimization: ONNX, TensorFlow Serving

### Distributed Training (~8 repos)

- Ray, DeepSpeed, Horovod, ColossalAI

### Kubernetes ML (~6 repos)

- Kubeflow, Volcano, KubeDL

### Model Fine-tuning (~7 repos)

- LLaMA-Factory, PEFT, LoRA, QLoRA

### RAG & Vector DBs (~7 repos)

- Milvus, Chroma, Qdrant, Weaviate, pgvector

### Model Optimization (~8 repos)

- llama.cpp, GPTQ, ONNX, bitsandbytes

### Learning Resources

- **awesome-mlops** (kelvins) - Curated list of MLOps tools
- **awesome-mlops-platforms** - Open source & commercial platforms
- **Made-With-ML** (GokuMohandas) - Production ML best practices

## AI Frameworks & General (~48 repos)

- **Frameworks:** LangChain, LlamaIndex, Dify, CrewAI, AutoGen
- **Protocols:** Model Context Protocol (MCP), Agent2Agent (A2A)
- **Tools:** Awesome LLM Apps, Awesome Agents, Best AI Knowledge Repos

## AIOps - AI for IT Operations

### Open Source AIOps Platforms (~10 repos)

| Platform | Description | Key Features |
|----------|-------------|--------------|
| **Keep** (keephq/keep) | Open-source AIOps & alert management | GitHub Actions for monitoring, YAML workflows |
| **AIOpsLab** (microsoft) | Autonomous AIOps agents framework | MLSys'25, microservice environments, fault injection |
| **awesome-AIOps** (OpsPAI) | Curated academic & industrial materials | Research papers, tools, best practices |

### Anomaly Detection & Root Cause Analysis

- **Loglizer** (logpai) - Machine learning toolkit for log-based anomaly detection
- **SREWorks** (alibaba) - Cloud-native data platform for AIOps
- **Luminol** (linkedin) - Anomaly detection and correlation library
- **NuPIC** (numenta) - Numenta Platform for Intelligent Computing
- **Skyline** (earthgecko) - Real-time anomaly detection system

### Key Features & Integrations

- **Observability Integration:** Prometheus, Grafana, Datadog, ELK stack
- **AI Anomaly Detection:** Direct integration into CI/CD pipelines
- **Commercial Platforms:** Datadog, Dynatrace (Davis AI), Moogsoft, BigPanda
- **Use Cases:** Automatic problem detection, root cause analysis, alert correlation
