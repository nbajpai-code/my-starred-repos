#!/bin/bash

# Script to star Prompt Engineering, Linting & Testing Tools repositories
# Created: 2025-11-16

echo "Starting to star Prompt Engineering & Linting Tools repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Prompt Linting & Validation - 10 repos
    # ========================================

    "alexmavr/promptsage"                           # LLM prompt builder, linter and sanitizer with built-in guardrails
    "promptfoo/promptfoo"                           # Test prompts, agents, RAGs. AI Red teaming & vulnerability scanning
    "gptlint/gptlint"                               # A linter with superpowers using LLMs
    "eth-sri/lmql"                                  # Language for constraint-guided LLM programming
    "guidance-ai/guidance"                          # Guidance language for controlling LLMs
    "BerriAI/litellm"                               # Call all LLM APIs using the OpenAI format
    "hegelai/prompttools"                           # Test and experiment with prompts, models
    "openai/evals"                                  # Framework for evaluating LLMs and LLM systems
    "anthropics/anthropic-sdk-python"               # Official Python SDK for Anthropic's Claude API
    "microsoft/prompt-engine"                       # Library for helping developers craft prompts

    # ========================================
    # Prompt Injection Detection & Security - 15 repos
    # ========================================

    "protectai/rebuff"                              # LLM Prompt Injection Detector
    "utkusen/promptmap"                             # Security scanner for custom LLM applications
    "tldrsec/prompt-injection-defenses"             # Every defense against prompt injection
    "LostRuins/koboldcpp"                           # Self-contained distributable for running LLMs
    "guardrails-ai/guardrails"                      # Adding guardrails to LLMs
    "nvidia/NeMo-Guardrails"                        # Toolkit for controllable and safe LLM applications
    "deadbits/vigil"                                # Security scanner for LLM prompts
    "microsoft/promptbench"                         # Unified evaluation framework for LLMs
    "epivolis/promptarmor"                          # Prompt injection detection
    "FonduAI/awesome-prompt-injection"              # Curated list of prompt injection resources
    "corca-ai/awesome-llm-security"                 # Awesome LLM Security resources
    "Kaykeks1/Prompt-Injection-Playground"          # Playground for prompt injection testing
    "mik0w/defendai"                                # LLM prompt injection detection
    "laiyer-ai/llm-guard"                           # Security toolkit for LLM interactions
    "anthropics/prompt-injection-paper"             # Research on prompt injection

    # ========================================
    # Prompt Engineering Frameworks - 20 repos
    # ========================================

    "langchain-ai/langchain"                        # Build LLM applications with composability
    "langchain-ai/langgraph"                        # Build stateful, multi-actor LLM applications
    "run-llama/llama_index"                         # LlamaIndex: Data framework for LLM applications
    "Significant-Gravitas/AutoGPT"                  # Autonomous GPT-4 experiment
    "microsoft/semantic-kernel"                     # Integrate LLMs into your apps
    "microsoft/autogen"                             # Multi-agent conversation framework
    "Mirascope/mirascope"                           # Prompt engineering with structured outputs
    "PrefectHQ/marvin"                              # Build AI-powered software
    "jxnl/instructor"                               # Structured outputs for LLMs
    "outlines-dev/outlines"                         # Structured text generation
    "pydantic/pydantic-ai"                          # Agent framework with type safety
    "stanfordnlp/dspy"                              # Programming foundation models
    "microsoft/TypeChat"                            # Make LLMs return typed JSON
    "deepset-ai/haystack"                           # LLM orchestration framework
    "hwchase17/langchainjs"                         # LangChain for JavaScript/TypeScript
    "neuml/txtai"                                   # AI-powered search engine
    "embedchain/embedchain"                         # Framework to create LLM-powered bots
    "MineDojo/Voyager"                              # LLM-powered embodied agent
    "TransformerOptimus/SuperAGI"                   # Dev-first open-source autonomous AI framework
    "PromtEngineer/localGPT"                        # Chat with documents privately

    # ========================================
    # Prompt Testing & Evaluation - 15 repos
    # ========================================

    "confident-ai/deepeval"                         # LLM evaluation framework
    "uptrain-ai/uptrain"                            # Open-source LLM evaluation tool
    "mlflow/mlflow"                                 # Platform for ML lifecycle including LLMs
    "wandb/wandb"                                   # Weights & Biases for ML experiment tracking
    "explodinggradients/ragas"                      # Evaluation framework for RAG pipelines
    "truera/trulens"                                # Evaluation and tracking for LLM apps
    "lastmile-ai/aiconfig"                          # Config-driven, source control-friendly AI app development
    "langfuse/langfuse"                             # Open-source LLM engineering platform
    "whylabs/langkit"                               # LLM monitoring toolkit
    "helicone-ai/helicone"                          # Open-source observability platform for LLMs
    "gantian127/OpenAI-Evals-Chinese"               # Chinese version of OpenAI Evals
    "openai/simple-evals"                           # Lightweight evaluation framework
    "anthropics/evals"                              # Anthropic's evaluation suite
    "ArthurAI/bench"                                # Framework for evaluating LLMs
    "context-labs/autodoc"                          # Experimental code documentation tool

    # ========================================
    # Prompt Optimization & Research - 10 repos
    # ========================================

    "microsoft/promptflow"                          # Build high-quality LLM apps
    "microsoft/LMOps"                               # General tech for enabling AI w/ LLMs
    "promptslab/Awesome-Prompt-Engineering"         # Curated prompt engineering resources
    "dair-ai/Prompt-Engineering-Guide"              # Guides, papers, lectures for prompt engineering
    "f/awesome-chatgpt-prompts"                     # ChatGPT prompt curation
    "openai/openai-cookbook"                        # Examples and guides for OpenAI API
    "anthropics/anthropic-cookbook"                 # Collection of notebooks for Claude
    "brexhq/prompt-engineering"                     # Prompt engineering tips and tricks
    "microsoft/AI-For-Beginners"                    # AI curriculum for everyone
    "microsoft/generative-ai-for-beginners"         # Generative AI learning path

    # ========================================
    # LLM Observability & Debugging - 10 repos
    # ========================================

    "phospho-app/phospho"                           # Text analytics for LLM apps
    "lunary-ai/lunary"                              # Production toolkit for LLMs
    "traceloop/openllmetry"                         # OpenTelemetry for LLMs
    "Scale3-Labs/langtrace"                         # Observability for LLM apps
    "AgentOps-AI/agentops"                          # Observability for AI agents
    "portkey-ai/gateway"                            # Blazing fast AI gateway
    "BerriAI/litellm-proxy"                         # Proxy server for 100+ LLMs
    "langwatch/langwatch"                           # LLM quality monitoring
    "agenta-ai/agenta"                              # LLMOps platform
    "parea-ai/parea-sdk-py"                         # LLM observability and testing

    # ========================================
    # Prompt Libraries & Templates - 10 repos
    # ========================================

    "linexjlin/GPTs"                                # Leaked GPTs prompts
    "friuns2/BlackFriday-GPTs-Prompts"              # Free GPT prompts
    "ai-boost/awesome-prompts"                      # Curated list of ChatGPT prompts
    "PlexPt/awesome-chatgpt-prompts-zh"             # ChatGPT prompts (Chinese)
    "rockbenben/ChatGPT-Shortcut"                   # ChatGPT shortcuts and prompts
    "LouisShark/chatgpt_system_prompt"              # Collection of GPT system prompts
    "0xeb/TheBigPromptLibrary"                      # Collection of prompts for LLMs
    "snwfdhmp/awesome-gpt-prompt-engineering"       # Curated list of GPT prompt engineering
    "abilzerian/LLM-Prompt-Library"                 # Prompt library for various tasks
    "mattnigh/ChatGPT3-Free-Prompt-List"            # Free prompt list

    # ========================================
    # Advanced Prompting Techniques - 10 repos
    # ========================================

    "anthropics/courses"                            # Anthropic prompt engineering courses
    "openai/prm800k"                                # Process reward model dataset
    "openai/human-eval"                             # Evaluating large language models
    "google-deepmind/alphacode"                     # Code generation model
    "reasoning-machines/pal"                        # Program-aided language models
    "microsoft/guidance"                            # Language for guiding LLM generation
    "openai/tiktoken"                               # Fast tokenizer for OpenAI models
    "ggerganov/llama.cpp"                           # Port of LLaMA to C/C++
    "Mozilla-Ocho/llamafile"                        # Distribute LLMs with a single file
    "Hannibal046/Awesome-LLM"                       # Curated list of LLM resources
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
echo "  - Prompt Linting & Validation: 10 repos"
echo "  - Prompt Injection Detection & Security: 15 repos"
echo "  - Prompt Engineering Frameworks: 20 repos"
echo "  - Prompt Testing & Evaluation: 15 repos"
echo "  - Prompt Optimization & Research: 10 repos"
echo "  - LLM Observability & Debugging: 10 repos"
echo "  - Prompt Libraries & Templates: 10 repos"
echo "  - Advanced Prompting Techniques: 10 repos"
echo "========================================"
echo ""
echo "🎯 KEY PROMPT LINTING TOOLS:"
echo ""
echo "📋 Linting & Validation:"
echo "  - Promptsage: LLM prompt builder, linter and sanitizer"
echo "  - Promptfoo: Test prompts, agents, RAGs with vulnerability scanning"
echo "  - LMQL: Constraint-guided LLM programming language"
echo "  - Guidance: Control LLM generation with structure"
echo ""
echo "🔒 Security & Injection Detection:"
echo "  - Rebuff: LLM prompt injection detector (ProtectAI)"
echo "  - Promptmap: Security scanner for custom LLM apps"
echo "  - Guardrails AI: Add guardrails to LLM applications"
echo "  - NeMo-Guardrails: NVIDIA toolkit for safe LLMs"
echo "  - LLM Guard: Security toolkit for LLM interactions"
echo ""
echo "🧪 Testing & Evaluation:"
echo "  - DeepEval: LLM evaluation framework"
echo "  - UpTrain: Open-source LLM evaluation"
echo "  - RAGAS: RAG evaluation framework"
echo "  - TruLens: LLM app evaluation and tracking"
echo ""
echo "🔍 Observability & Debugging:"
echo "  - Langfuse: Open-source LLM engineering platform"
echo "  - Helicone: Observability platform for LLMs"
echo "  - Lunary: Production toolkit for LLMs"
echo "  - AgentOps: Observability for AI agents"
echo ""
echo "📚 Learning Resources:"
echo "  - Prompt Engineering Guide (DAIR.AI)"
echo "  - Awesome Prompt Engineering (PromptsLab)"
echo "  - OpenAI Cookbook"
echo "  - Anthropic Courses & Cookbook"
echo "========================================"
echo "Done!"
