#!/bin/bash

# Script to star Coding Agents, Benchmarks, and Red Hat/Linux Conference repositories
# Created: 2025-11-16

echo "Starting to star Coding Agents, Benchmarks & Conference repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # AI Coding Agents - 20 repos
    # ========================================

    "cline/cline"
    "Mintplex-Labs/anything-llm"
    "openai/codex"
    "sst/opencode"
    "continuedev/continue"
    "oraios/serena"
    "QwenLM/qwen-code"
    "charmbracelet/crush"
    "ChromeDevTools/chrome-devtools-mcp"
    "plandex-ai/plandex"
    "GLips/Figma-Context-MCP"
    "shareAI-lab/analysis_claude_code"
    "opencode-ai/opencode"
    "openai/agents.md"
    "humanlayer/humanlayer"
    "stagewise-io/stagewise"
    "BloopAI/vibe-kanban"
    "kodu-ai/claude-coder"
    "github/copilot-cli"
    "langchain-ai/open-swe"

    # ========================================
    # Code Generation Benchmarks - 15 repos
    # ========================================

    # BigCode Project
    "bigcode-project/bigcodebench"
    "bigcode-project/bigcodearena"
    "bigcode-project/bigcode-evaluation-harness"
    "bigcode-project/selfcodealign"
    "bigcode-project/octopack"
    "bigcode-project/starcoder2"
    "bigcode-project/the-stack-v2"
    "bigcode-project/bigcode-analysis"
    "bigcode-project/astraios"
    "bigcode-project/bigcodebench-annotation"
    "bigcode-project/bigcode-website"

    # Benchmarks & Evaluation
    "abhaymundhara/llm-benchmark-suite"
    "openai/human-eval"
    "google-research/google-research"
    "EleutherAI/lm-evaluation-harness"

    # ========================================
    # GitHub Universe & AI Dev Tools - 5 repos
    # ========================================

    "github/copilot-docs"
    "github/github-models-examples"
    "github/universe"
    "microsoft/ai-edu"
    "microsoft/vscode-ai-toolkit"

    # ========================================
    # Red Hat & Linux Conferences - 10 repos
    # ========================================

    "pslucas0212/Red-Hat-Summit-2025"
    "redhat-developer/redhat-developer-hub"
    "redhat-developer/devspaces-images"
    "redhat-developer/vscode-java"
    "redhat-developer/vscode-openshift-tools"
    "redhat-cop/openshift-playbooks"
    "redhat-cop/agnosticd"
    "redhat-cop/container-pipelines"
    "devconf-archive/devconf"
    "ansible/workshops"
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
echo "  - AI Coding Agents: 20 repos"
echo "  - Code Generation Benchmarks: 15 repos"
echo "  - GitHub Universe & AI Dev Tools: 5 repos"
echo "  - Red Hat & Linux Conferences: 10 repos"
echo "========================================"
echo "Done!"
