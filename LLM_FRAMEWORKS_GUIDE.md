# 🤖 LLM Frameworks & Orchestration Guide

A comprehensive guide to the 153 LLM framework repositories now tracked in this collection.

## 🎯 Quick Reference

Run the automation script to star all frameworks:
```bash
./star_llm_frameworks_repos.sh
```

## 📚 Framework Categories

### 🔷 Core LLM Frameworks (15 repos)

The foundational frameworks for building LLM applications:

| Framework | Language | Best For | GitHub |
|-----------|----------|----------|--------|
| **LangChain** | Python/JS/Java | General-purpose LLM apps | [langchain-ai/langchain](https://github.com/langchain-ai/langchain) |
| **LangGraph** | Python | Stateful multi-agent systems | [langchain-ai/langgraph](https://github.com/langchain-ai/langgraph) |
| **LlamaIndex** | Python | RAG and data-centric apps | [run-llama/llama_index](https://github.com/run-llama/llama_index) |
| **Haystack** | Python | Production NLP pipelines | [deepset-ai/haystack](https://github.com/deepset-ai/haystack) |
| **Semantic Kernel** | C#/Python/Java | Enterprise .NET integration | [microsoft/semantic-kernel](https://github.com/microsoft/semantic-kernel) |
| **Pydantic-AI** | Python | Type-safe agents | [pydantic/pydantic-ai](https://github.com/pydantic/pydantic-ai) |
| **DSPy** | Python | Programming LLMs, not prompting | [stanfordnlp/dspy](https://github.com/stanfordnlp/dspy) |
| **LiteLLM** | Python | Unified API for 100+ LLMs | [BerriAI/litellm](https://github.com/BerriAI/litellm) |

**LangChain Ecosystem:**
- `langchain` - Core framework
- `langgraph` - Stateful agent graphs
- `langsmith-sdk` - Observability
- `langserve` - Deploy as REST APIs

**LlamaIndex Ecosystem:**
- `llama_index` - Core data framework
- `llama-hub` - Data loaders library
- `llama_deploy` - Deploy workflows as services

**Multi-Language Support:**
- `langchainjs` - TypeScript/JavaScript
- `langchain4j` - Java

### 🤖 Agent Frameworks (20 repos)

Multi-agent systems and autonomous AI:

| Framework | Type | Description |
|-----------|------|-------------|
| **AutoGen** | Multi-agent | Microsoft's conversation framework |
| **CrewAI** | Multi-agent | Orchestrate autonomous agents |
| **MetaGPT** | Multi-agent | Software company simulation |
| **SuperAGI** | Autonomous | Dev-first agent framework |
| **BabyAGI** | Task Management | AI-powered task system |
| **AutoGPT** | Autonomous | Original autonomous GPT-4 |
| **AgentGPT** | Web-based | Browser-based agent deployment |
| **TaskWeaver** | Code-first | Microsoft's planning/execution |
| **Voyager** | Embodied | LLM-powered lifelong learning |
| **ChatDev** | Collaborative | AI software development team |

**Notable Repos:**
- `microsoft/JARVIS` - Connect LLMs with ML community
- `OpenBMB/XAgent` - Autonomous complex tasks
- `aiwaves-cn/agents` - Open-source agent framework
- `modelscope/agentscope` - Multi-agent platform
- `langchain-ai/open-canvas` - Collaborative AI canvas
- `ysymyth/ReAct` - Reasoning and Acting with LLMs

### 📚 RAG Frameworks (18 repos)

Retrieval-Augmented Generation systems:

| Framework | Focus | Key Feature |
|-----------|-------|-------------|
| **RAGFlow** | Deep Understanding | Open-source RAG engine |
| **Embedchain** | Quick Setup | Framework for RAG apps |
| **PrivateGPT** | Privacy | Chat with docs locally |
| **LocalGPT** | Local-first | No internet required |
| **Quivr** | Second Brain | GenAI knowledge base |
| **RAGatouille** | ColBERT | Easy RAG with reranking |
| **RAGAS** | Evaluation | RAG pipeline testing |

**Essential Tools:**
- `langchain-ai/rag-from-scratch` - RAG tutorials
- `neuml/txtai` - All-in-one embeddings DB
- `mem0` (Embedchain) - Memory layer for AI
- `aurelio-labs/semantic-router` - Semantic routing
- `jina-ai/jina` - Multimodal AI services

### 🔒 Structured Output & Type Safety (12 repos)

Type-safe LLM interactions:

| Tool | Approach | Use Case |
|------|----------|----------|
| **Instructor** | Pydantic models | Structured LLM outputs |
| **Outlines** | Constrained generation | Guaranteed valid outputs |
| **Guidance** | Control language | Interleave logic/generation |
| **TypeChat** | TypeScript types | Typed JSON responses |
| **Mirascope** | Type hints | Structured prompting |
| **Marvin** | Python decorators | AI-powered functions |
| **Guardrails** | Validators | Output safety checks |

### 💻 LLM Programming Languages (8 repos)

Specialized languages for LLM control:

- **LMQL** - Query language for LLMs with constraints
- **Guidance** - Microsoft's control language
- **Prompty** - Prompt engineering asset class
- **AICI** - Control generation with WebAssembly
- **Guardrails** - Validator/corrector framework

### 👁️ LLM Observability (15 repos)

Production monitoring and debugging:

| Platform | Type | Features |
|----------|------|----------|
| **LangFuse** | Open-source | Prompt versioning, tracing, analytics |
| **Phoenix** | ML Observability | Embeddings, LLM monitoring |
| **DeepEval** | Testing | Unit tests for LLM outputs |
| **UpTrain** | Evaluation | Open-source eval tool |
| **TruLens** | Tracking | LLM app evaluation |
| **Helicone** | Open-source | LLM observability platform |
| **OpenLIT** | OpenTelemetry | Native LLM observability |
| **Lunary** | Production | LLM toolkit |

**Also includes:** WhyLogs, MLflow, Weights & Biases

### 🧪 Testing & Evaluation (15 repos)

Frameworks for LLM quality assurance:

- **OpenAI Evals** - Official evaluation framework
- **Anthropic Evals** - Claude evaluation tools
- **DeepEval** - Unit testing for LLMs
- **RAGAS** - RAG pipeline evaluation
- **PromptBench** - Unified LLM benchmarks
- **EleutherAI/lm-evaluation-harness** - Language model eval
- **Hugging Face Evaluate** - Evaluation library
- **Vectara Hallucination Leaderboard** - Hallucination benchmarks

### 🎼 Workflow Orchestration (12 repos)

Visual and code-based workflow builders:

| Platform | Type | Description |
|----------|------|-------------|
| **LangFlow** | Visual | Drag-and-drop LLM workflows |
| **Flowise** | Visual | Open-source workflow builder |
| **Dify** | Platform | LLM app development platform |
| **AnythingLLM** | Workspace | All-in-one LLM workspace |
| **n8n** | Automation | Workflow automation with LLMs |

**Also includes:** Prefect, DeepLake, Cheshire Cat AI, Vercel AI

### 🔧 Tool Use & Function Calling (10 repos)

Enable LLMs to use external tools:

- **OpenAI SDK** - Official tools/function calling
- **Anthropic SDK** - Claude tools
- **E2B** - Secure sandboxes for agents
- **OpenHands** - Software development agents
- **Composio** - Integration platform for agents
- **Toolhouse** - Universal tool infrastructure

### 🧠 Memory & Context (8 repos)

Long-term memory for AI assistants:

- **Mem0** - Memory layer for applications
- **Zep** - Long-term memory store
- **MemGPT** - Self-editing memory
- **Langroid** - Multi-agent framework with memory
- **LlamaAgents** - Agent orchestration

### ⭐ Awesome Lists (12 repos)

Curated collections and learning resources:

- `Shubhamsaboo/awesome-llm-apps` - LLM applications
- `kyrolabs/awesome-langchain` - LangChain resources
- `steven2358/awesome-generative-ai` - Generative AI
- `f/awesome-chatgpt-prompts` - Prompt examples
- `e2b-dev/awesome-ai-agents` - AI agents
- `tensorchord/Awesome-LLMOps` - LLMOps resources
- `krishnaik06/Complete-LangChain-Tutorials` - Tutorials
- `gkamradt/langchain-tutorials` - LangChain guides
- `pinecone-io/examples` - Vector DB examples

### 🎨 Low-Code / No-Code (8 repos)

Platforms for building LLM apps without extensive coding:

- **LangFlow** - Visual workflow builder
- **Flowise** - Open-source alternative
- **Dify** - Full platform
- **AnythingLLM** - Private workspace
- **Griptape** - Python workflows
- **FastGPT** - Knowledge base platform

## 🚀 Getting Started

### For Beginners
1. Start with **LangChain** tutorials
2. Explore **LangFlow** for visual building
3. Try **AnythingLLM** for a complete workspace

### For RAG Applications
1. **LlamaIndex** - Data-centric approach
2. **RAGFlow** - Deep understanding
3. **RAGAS** - Evaluate your RAG pipeline

### For Multi-Agent Systems
1. **LangGraph** - Stateful agent graphs
2. **AutoGen** - Multi-agent conversations
3. **CrewAI** - Orchestrate agent teams

### For Type Safety
1. **Instructor** - Pydantic models
2. **Outlines** - Constrained generation
3. **Pydantic-AI** - Type-safe agents

### For Production
1. **LangFuse** - Observability
2. **DeepEval** - Testing
3. **LiteLLM** - Unified API

## 📊 Framework Comparison

### When to Use What?

| Use Case | Recommended Framework | Why? |
|----------|----------------------|------|
| General LLM apps | LangChain | Most comprehensive, largest community |
| Stateful agents | LangGraph | Built for complex agent workflows |
| RAG/search | LlamaIndex | Best data connectors & indexing |
| Enterprise .NET | Semantic Kernel | Native Microsoft integration |
| Type safety | Instructor/Pydantic-AI | Guaranteed structured outputs |
| Production NLP | Haystack | Enterprise-grade features |
| Research/experiments | DSPy | Programming over prompting |
| Multi-model | LiteLLM | 100+ LLM providers |

### Performance Benchmarks

From industry research:
- **Lowest overhead:** DSPy (~3.5ms), Haystack (~5.9ms), LlamaIndex (~6ms)
- **Higher overhead:** LangChain (~10ms), LangGraph (~14ms)
- **Token efficiency:** Haystack (~1.57k), LlamaIndex (~1.60k), LangChain (~2.40k)

## 🎓 Learning Path

### Week 1: Foundations
- [ ] Star all repos with `./star_llm_frameworks_repos.sh`
- [ ] Complete LangChain tutorials
- [ ] Build a simple chatbot

### Week 2: RAG
- [ ] Study LlamaIndex documentation
- [ ] Build a RAG application
- [ ] Evaluate with RAGAS

### Week 3: Agents
- [ ] Learn LangGraph for stateful agents
- [ ] Try AutoGen multi-agent conversations
- [ ] Experiment with CrewAI

### Week 4: Production
- [ ] Set up LangFuse for observability
- [ ] Add DeepEval tests
- [ ] Deploy with LangServe or BentoML

## 🔗 Key Resources

### Official Documentation
- [LangChain Docs](https://python.langchain.com/docs/get_started/introduction)
- [LlamaIndex Docs](https://docs.llamaindex.ai/en/stable/)
- [Haystack Docs](https://docs.haystack.deepset.ai/)
- [Semantic Kernel Docs](https://learn.microsoft.com/en-us/semantic-kernel/)
- [DSPy Docs](https://dspy-docs.vercel.app/)

### Comparison Resources
- [RAG Frameworks Comparison](https://research.aimultiple.com/rag-frameworks/)
- [AI Agent Frameworks 2025](https://www.turing.com/resources/ai-agent-frameworks)
- [LangChain vs LlamaIndex](https://xenoss.io/blog/langchain-langgraph-llamaindex-llm-frameworks)

### Tutorials & Courses
- `krishnaik06/Complete-LangChain-Tutorials`
- `gkamradt/langchain-tutorials`
- `deepset-ai/haystack-tutorials`
- `langchain-ai/rag-from-scratch`

## 💡 Best Practices

### Framework Selection
1. **Start simple** - Use high-level frameworks first (LangChain, LlamaIndex)
2. **Prototype fast** - Try visual builders (LangFlow, Flowise)
3. **Type safety** - Add Instructor/Outlines for production
4. **Observe everything** - Set up LangFuse from day one
5. **Test early** - Use DeepEval for unit testing

### Production Checklist
- [ ] Observability (LangFuse/Phoenix)
- [ ] Testing framework (DeepEval)
- [ ] Type safety (Instructor/Pydantic-AI)
- [ ] Error handling (Guardrails)
- [ ] Cost tracking (LiteLLM)
- [ ] Evaluation (RAGAS for RAG)

### Common Patterns

**Simple Chatbot:**
```
LangChain + OpenAI/Anthropic SDK + LangServe
```

**RAG Application:**
```
LlamaIndex + Vector DB + RAGAS (evaluation)
```

**Multi-Agent System:**
```
LangGraph + LangSmith (observability) + DeepEval (testing)
```

**Type-Safe Production App:**
```
Instructor + Pydantic-AI + LangFuse + Guardrails
```

## 🎯 Next Steps

1. **Run the script:** `./star_llm_frameworks_repos.sh`
2. **Pick a framework** based on your use case
3. **Build a simple project** to learn
4. **Add observability** with LangFuse
5. **Share your learnings** with the community

## 📈 Repository Stats

- **Total Frameworks:** 153 repositories
- **Core Frameworks:** 15 repos
- **Agent Systems:** 20 repos
- **RAG Tools:** 18 repos
- **Type Safety:** 12 repos
- **Observability:** 15 repos
- **Testing/Eval:** 15 repos
- **Workflow Tools:** 12 repos
- **Learning Resources:** 12 repos

---

**Last Updated:** November 18, 2025
**Automation Script:** `star_llm_frameworks_repos.sh`
**See Also:** [PROMPT_LINTING_GUIDE.md](PROMPT_LINTING_GUIDE.md) for prompt engineering best practices
