#!/bin/bash

# AIOps GitHub Repositories Star Script
# AI for IT Operations, Anomaly Detection, Alert Management

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

echo "🚀 Starting to star AIOps repositories..."
echo "============================================================"
echo ""

# Core AIOps Platforms
echo "🤖 Core AIOps Platforms..."
star_repo "keephq/keep"
star_repo "microsoft/AIOpsLab"
star_repo "OpsPAI/awesome-AIOps"
echo ""

# Anomaly Detection & Root Cause Analysis
echo "🔍 Anomaly Detection & Root Cause Analysis..."
star_repo "logpai/loglizer"
star_repo "alibaba/SREWorks"
star_repo "linkedin/luminol"
star_repo "numenta/nupic"
star_repo "earthgecko/skyline"
echo ""

# Additional AIOps Tools
echo "🛠️ Additional AIOps Tools..."
star_repo "NetManAIOps/OmniAnomaly"
star_repo "NetManAIOps/DeepTraLog"
star_repo "logpai/loghub"
echo ""

echo "============================================================"
echo "✅ Done! AIOps repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "🤖 Categories Covered:"
echo "   ✓ Core AIOps Platforms (3 repos)"
echo "   ✓ Anomaly Detection & Root Cause Analysis (5 repos)"
echo "   ✓ Additional AIOps Tools (3 repos)"
echo ""
echo "💡 Key Features:"
echo "   • AI-powered IT operations and automation"
echo "   • Anomaly detection and root cause analysis"
echo "   • Alert management and correlation"
echo "   • Integration with Prometheus, Grafana, Datadog, ELK"
echo ""
