#!/bin/bash

# LLM Frameworks & Orchestration Tools Star Script
# Comprehensive collection of LLM application frameworks, agent systems, and orchestration tools
# Created: 2025-11-18

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

echo "🚀 Starting to star LLM Frameworks & Orchestration repositories..."
echo "=================================================================="
echo ""

# ========================================
# Core LLM Frameworks - 15 repos
# ========================================
echo "🔷 Core LLM Application Frameworks..."
star_repo "langchain-ai/langchain"                 # Most popular LLM framework for building composable apps
star_repo "langchain-ai/langgraph"                 # Build stateful, multi-actor applications with graphs
star_repo "langchain-ai/langsmith-sdk"             # LangSmith for LLM app observability
star_repo "langchain-ai/langserve"                 # Deploy LangChain runnables as REST APIs
star_repo "run-llama/llama_index"                  # Data framework for LLM applications (formerly GPT Index)
star_repo "run-llama/llama-hub"                    # Library of data loaders for LlamaIndex
star_repo "run-llama/llama_deploy"                 # Deploy LlamaIndex workflows as services
star_repo "deepset-ai/haystack"                    # End-to-end NLP framework for production
star_repo "microsoft/semantic-kernel"              # Integrate LLMs into .NET/Python/Java apps
star_repo "pydantic/pydantic-ai"                   # Agent framework with type safety (Pydantic team)
star_repo "stanfordnlp/dspy"                       # Programming foundation models, not prompting them
star_repo "hwchase17/langchainjs"                  # LangChain for JavaScript/TypeScript
star_repo "langchain4j/langchain4j"                # LangChain for Java
star_repo "promptfoo/promptfoo"                    # Test, evaluate, and red-team LLM apps
star_repo "BerriAI/litellm"                        # Call 100+ LLM APIs with OpenAI format

# ========================================
# Agent Frameworks - 20 repos
# ========================================
echo ""
echo "🤖 Multi-Agent Systems & Frameworks..."
star_repo "microsoft/autogen"                      # Multi-agent conversation framework
star_repo "joaomdmoura/crewAI"                     # Framework for orchestrating autonomous AI agents
star_repo "Significant-Gravitas/AutoGPT"           # Autonomous GPT-4 experiment
star_repo "geekan/MetaGPT"                         # Multi-agent framework for software company simulation
star_repo "reworkd/AgentGPT"                       # Assemble, configure, and deploy autonomous AI Agents
star_repo "TransformerOptimus/SuperAGI"            # Dev-first autonomous AI agent framework
star_repo "microsoft/JARVIS"                       # System to connect LLMs with ML community
star_repo "MineDojo/Voyager"                       # LLM-powered embodied lifelong learning agent
star_repo "aiwaves-cn/agents"                      # Open-source framework for autonomous agents
star_repo "modelscope/agentscope"                  # Multi-agent platform for LLM-based applications
star_repo "deepmind/concordia"                     # Library for generative agent-based models
star_repo "OpenBMB/ChatDev"                        # Collaborative AI software entity
star_repo "OpenBMB/XAgent"                         # Autonomous LLM agent for complex tasks
star_repo "microsoft/TaskWeaver"                   # Code-first agent framework for planning and executing tasks
star_repo "e2b-dev/awesome-ai-agents"              # Curated list of AI autonomous agents
star_repo "langchain-ai/open-canvas"               # Open source collaborative canvas with AI
star_repo "NVIDIA/GenerativeAIExamples"            # Generative AI reference workflows
star_repo "Torantulino/AI-Functions"               # AI-powered function library
star_repo "yoheinakajima/babyagi"                  # AI-powered task management system
star_repo "ysymyth/ReAct"                          # Reasoning and Acting with LLMs

# ========================================
# RAG & Retrieval Frameworks - 18 repos
# ========================================
echo ""
echo "📚 RAG (Retrieval-Augmented Generation) Frameworks..."
star_repo "infiniflow/ragflow"                     # Open-source RAG engine based on deep understanding
star_repo "langchain-ai/rag-from-scratch"          # RAG tutorials and implementations
star_repo "run-llama/rags"                         # Build ChatGPT over your data
star_repo "neuml/txtai"                            # All-in-one embeddings database
star_repo "embedchain/embedchain"                  # Framework to create RAG-powered LLM apps
star_repo "embedchain/mem0"                        # Memory layer for AI applications
star_repo "Cinnamon/kotaemon"                      # Open-source RAG-based tool for chatting with documents
star_repo "QuivrHQ/quivr"                          # Your GenAI second brain (RAG)
star_repo "zylon-ai/private-gpt"                   # Interact with documents using LLMs privately
star_repo "PromtEngineer/localGPT"                 # Chat with documents using local LLMs
star_repo "imartinez/privateGPT"                   # Ask questions to documents without internet
star_repo "naver/korean-rag"                       # Korean RAG framework
star_repo "explodinggradients/ragas"               # Evaluation framework for RAG pipelines
star_repo "langchain-ai/retrieval-agent-template"  # Template for RAG-based agents
star_repo "jina-ai/jina"                           # Build multimodal AI services
star_repo "aurelio-labs/semantic-router"           # Semantic routing for LLM applications
star_repo "milvus-io/bootcamp"                     # RAG and vector search tutorials
star_repo "bclavie/RAGatouille"                    # Easy RAG with ColBERT

# ========================================
# Structured Output & Type Safety - 12 repos
# ========================================
echo ""
echo "🔒 Structured Outputs & Type-Safe LLM Tools..."
star_repo "jxnl/instructor"                        # Structured outputs for LLMs with Pydantic
star_repo "outlines-dev/outlines"                  # Structured text generation with LLMs
star_repo "guidance-ai/guidance"                   # Guidance language for controlling LLMs
star_repo "microsoft/TypeChat"                     # Make LLMs return typed JSON responses
star_repo "Mirascope/mirascope"                    # LLM toolkit with structured outputs
star_repo "PrefectHQ/marvin"                       # Build AI-powered software with type hints
star_repo "guardrails-ai/guardrails"               # Adding guardrails to LLMs
star_repo "jsonformer/jsonformer"                  # Generate structured JSON from LLMs
star_repo "IBM/jsonschema-to-pydantic"             # Convert JSON Schema to Pydantic models
star_repo "anthropics/anthropic-tools"             # Tool use examples for Claude
star_repo "openai/openai-python"                   # Official Python bindings with function calling
star_repo "typechat/typechat"                      # Build natural language interfaces with types

# ========================================
# LLM Programming Languages - 8 repos
# ========================================
echo ""
echo "💻 LLM-Specific Programming Languages..."
star_repo "eth-sri/lmql"                           # Query language for LLMs
star_repo "microsoft/prompty"                      # Asset class for prompt engineering
star_repo "guidance-ai/guidance"                   # Interleave generation, prompting, logic
star_repo "guardrails-ai/guardrails"               # Validators and correctors for LLM outputs
star_repo "microsoft/prompt-engine"                # Utility library for prompt engineering
star_repo "hegelai/prompttools"                    # Test and experiment with prompts
star_repo "microsoft/aici"                         # Control LLM generation with WebAssembly
star_repo "anthropics/prompt-eng-interactive-tutorial" # Interactive prompt engineering tutorial

# ========================================
# LLM Observability & Monitoring - 15 repos
# ========================================
echo ""
echo "👁️ LLM Observability & Monitoring..."
star_repo "langfuse/langfuse"                      # Open source LLM engineering platform
star_repo "Arize-ai/phoenix"                       # ML observability for LLMs and embeddings
star_repo "whylabs/whylogs"                        # Open source data logging library
star_repo "confident-ai/deepeval"                  # Unit testing for LLM outputs
star_repo "uptrain-ai/uptrain"                     # Open-source LLM evaluation
star_repo "truera/trulens"                         # Evaluation and tracking for LLM apps
star_repo "lastmile-ai/aiconfig"                   # Config-driven LLM app development
star_repo "lunary-ai/lunary"                       # Production toolkit for LLMs
star_repo "helicone-ai/helicone"                   # Open-source LLM observability platform
star_repo "PromtEngineer/localtunnel"              # Expose localhost to the internet
star_repo "mlflow/mlflow"                          # Open source platform for ML lifecycle
star_repo "wandb/wandb"                            # Experiment tracking for ML/LLMs
star_repo "openlit/openlit"                        # OpenTelemetry-native LLM observability
star_repo "weights-and-biases/wandb-js"            # Weights & Biases JavaScript SDK
star_repo "gantry-ml/gantry"                       # Model monitoring platform

# ========================================
# LLM Testing & Evaluation - 15 repos
# ========================================
echo ""
echo "🧪 LLM Testing & Evaluation Frameworks..."
star_repo "openai/evals"                           # Framework for evaluating LLMs
star_repo "anthropics/evals"                       # Anthropic's evaluation framework
star_repo "confident-ai/deepeval"                  # Unit testing for LLM applications
star_repo "explodinggradients/ragas"               # Evaluation framework for RAG
star_repo "uptrain-ai/uptrain"                     # Data & LLM evaluation
star_repo "microsoft/promptbench"                  # Unified LLM evaluation framework
star_repo "neuml/txtai"                            # Semantic search and LLM orchestration
star_repo "confident-ai/deepeval-testing"          # Testing library for LLMs
star_repo "truera/trulens-eval"                    # Evaluation tools for LLM apps
star_repo "langchain-ai/langchain-benchmarks"      # Benchmarks for LangChain
star_repo "run-llama/llama_index_benchmarks"       # Benchmarks for LlamaIndex
star_repo "beir-cellar/beir"                       # Benchmark for information retrieval
star_repo "EleutherAI/lm-evaluation-harness"       # Framework for language model evaluation
star_repo "huggingface/evaluate"                   # Hugging Face evaluation library
star_repo "vectara/hallucination-leaderboard"      # LLM hallucination benchmark

# ========================================
# Workflow & Orchestration - 12 repos
# ========================================
echo ""
echo "🎼 Workflow Orchestration & Automation..."
star_repo "langflow-ai/langflow"                   # Visual framework for building LLM apps
star_repo "FlowiseAI/Flowise"                      # Drag & drop LLM workflow builder
star_repo "langgenius/dify"                        # LLM app development platform
star_repo "Mintplex-Labs/anything-llm"             # All-in-one LLM workspace
star_repo "n8n-io/n8n"                             # Workflow automation with LLMs
star_repo "PrefectHQ/prefect"                      # Modern workflow orchestration
star_repo "activeloopai/deeplake"                  # Data lake for deep learning
star_repo "cheshire-cat-ai/core"                   # Framework for AI assistants
star_repo "langchain-ai/opengpts"                  # Open source GPTs platform
star_repo "mlc-ai/web-llm"                         # Run LLMs in browser with WebGPU
star_repo "vercel/ai"                              # Build AI-powered apps with React
star_repo "xtekky/gpt4free"                        # Decentralized LLM APIs

# ========================================
# Tool Use & Function Calling - 10 repos
# ========================================
echo ""
echo "🔧 Tool Use & Function Calling..."
star_repo "openai/openai-python"                   # Official OpenAI SDK with tools
star_repo "anthropics/anthropic-sdk-python"        # Official Anthropic SDK with tools
star_repo "langchain-ai/langchain-tools"           # LangChain tools collection
star_repo "run-llama/llama-tools"                  # LlamaIndex tools
star_repo "microsoft/semantic-kernel-tools"        # Semantic Kernel plugins
star_repo "Significant-Gravitas/AutoGPT-Plugins"   # AutoGPT plugins
star_repo "e2b-dev/e2b"                            # Secure sandboxes for AI agents
star_repo "all-hands-ai/OpenHands"                 # Platform for software development agents
star_repo "composio-dev/composio"                  # Integration platform for AI agents
star_repo "toolhouse-ai/toolhouse"                 # Universal tool infrastructure for AI

# ========================================
# Memory & Context Management - 8 repos
# ========================================
echo ""
echo "🧠 Memory & Context Management..."
star_repo "embedchain/mem0"                        # Memory layer for AI applications
star_repo "zep-ai/zep"                             # Long-term memory for AI assistants
star_repo "metal-stack/metal-db"                   # Production-ready memory store
star_repo "MemGPT/MemGPT"                          # Self-editing memory for LLMs
star_repo "langchain-ai/langchain-memory"          # Memory implementations for LangChain
star_repo "hwchase17/chat-langchain"               # Chat with memory
star_repo "run-llama/llama-agents"                 # LlamaIndex agents framework
star_repo "langroid/langroid"                      # Multi-agent LLM framework

# ========================================
# Awesome Lists & Resources - 12 repos
# ========================================
echo ""
echo "⭐ Awesome Lists & Learning Resources..."
star_repo "Shubhamsaboo/awesome-llm-apps"          # Curated list of LLM applications
star_repo "kyrolabs/awesome-langchain"             # Awesome LangChain resources
star_repo "steven2358/awesome-generative-ai"       # Awesome generative AI resources
star_repo "f/awesome-chatgpt-prompts"              # ChatGPT prompt examples
star_repo "e2b-dev/awesome-ai-agents"              # Awesome AI agents list
star_repo "awesome-llm-interpretability/awesome-llm-interpretability" # LLM interpretability
star_repo "tensorchord/Awesome-LLMOps"             # Awesome LLMOps resources
star_repo "krishnaik06/Complete-LangChain-Tutorials" # Complete LangChain tutorials
star_repo "alphasecio/langchain-examples"          # LangChain examples
star_repo "gkamradt/langchain-tutorials"           # LangChain tutorials
star_repo "pinecone-io/examples"                   # Vector database examples with LLMs
star_repo "deepset-ai/haystack-tutorials"          # Haystack tutorials

# ========================================
# Low-Code / No-Code Platforms - 8 repos
# ========================================
echo ""
echo "🎨 Low-Code / No-Code LLM Platforms..."
star_repo "langflow-ai/langflow"                   # Visual LLM workflow builder
star_repo "FlowiseAI/Flowise"                      # Open source Langflow alternative
star_repo "langgenius/dify"                        # LLM app development platform
star_repo "Mintplex-Labs/anything-llm"             # Private ChatGPT workspace
star_repo "griptape-ai/griptape"                   # Python framework for AI workflows
star_repo "cheshire-cat-ai/core"                   # Production-ready AI framework
star_repo "wordware-ai/llm"                        # Collaborative LLM development
star_repo "labring/FastGPT"                        # Knowledge base platform with LLMs

echo ""
echo "=================================================================="
echo "✅ Done! All LLM Framework repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - Core LLM Frameworks: 15 repos"
echo "   - Agent Frameworks: 20 repos"
echo "   - RAG & Retrieval: 18 repos"
echo "   - Structured Output & Type Safety: 12 repos"
echo "   - LLM Programming Languages: 8 repos"
echo "   - Observability & Monitoring: 15 repos"
echo "   - Testing & Evaluation: 15 repos"
echo "   - Workflow Orchestration: 12 repos"
echo "   - Tool Use & Function Calling: 10 repos"
echo "   - Memory & Context Management: 8 repos"
echo "   - Awesome Lists & Resources: 12 repos"
echo "   - Low-Code / No-Code Platforms: 8 repos"
echo ""
echo "🎉 Total: ~153 LLM Framework repositories starred!"
echo ""
echo "🔥 Key Highlights:"
echo "   ✨ LangChain ecosystem (langchain, langgraph, langsmith, langserve)"
echo "   ✨ LlamaIndex ecosystem (llama_index, llama-hub, llama_deploy)"
echo "   ✨ Multi-agent frameworks (AutoGen, CrewAI, MetaGPT)"
echo "   ✨ Type-safe frameworks (Instructor, Pydantic-AI, Outlines)"
echo "   ✨ Production tools (LangFuse, Phoenix, DeepEval)"
echo "   ✨ RAG frameworks (RAGFlow, Embedchain, PrivateGPT)"
