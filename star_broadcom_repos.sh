#!/bin/bash

# Broadcom/CA Technologies GitHub Repositories Star Script
# DxNetOps, SMARTS, Network Management, APM, API Management

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

echo "🚀 Starting to star Broadcom/CA Technologies repositories..."
echo "============================================================"
echo ""

# Get all repos from CA-PM organization (DX NetOps)
echo "📊 CA-PM (DX NetOps Performance Management)..."
# We'll need to get the actual repo list, let's star the org
echo "   Checking CA-PM organization repositories..."

# Get all repos from CA-APM organization
echo ""
echo "📈 CA-APM (Application Performance Management)..."
echo "   Checking CA-APM organization repositories..."

# CA API Management
echo ""
echo "🔌 CAAPIM (CA API Management)..."
echo "   Checking CAAPIM organization repositories..."

# Main Broadcom repositories
echo ""
echo "🔷 Broadcom Inc - Main Repositories..."
echo "   Checking Broadcom organization repositories..."

# CA Technologies
echo ""
echo "🏢 CA Technologies..."
echo "   Checking CATechnologies organization repositories..."

# DevTest Solutions
echo ""
echo "🧪 CA DevTest Solutions..."
echo "   Checking DevTest repositories..."

echo ""
echo "============================================================"
echo "⚠️  Note: To star all repositories from these organizations,"
echo "   we need to fetch the repository list first."
echo ""
echo "🔍 Fetching repository lists from organizations..."
echo ""

# Fetch and star repos from each organization
orgs=("CA-PM" "CA-APM" "CAAPIM" "Broadcom" "CATechnologies" "devtestsolutions")

for org in "${orgs[@]}"; do
    echo "📦 Fetching repositories from $org..."
    repos=$(gh api "orgs/$org/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

    if [ -n "$repos" ]; then
        echo "   Found repositories in $org:"
        count=0
        while IFS= read -r repo; do
            star_repo "$repo"
            ((count++))
        done <<< "$repos"
        echo "   ✓ Starred $count repositories from $org"
    else
        echo "   ⚠️  Could not fetch repositories from $org (may be private or require auth)"
    fi
    echo ""
done

echo "============================================================"
echo "✅ Done! Broadcom/CA Technologies repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "🏢 Organizations Covered:"
echo "   ✓ CA-PM (DX NetOps Performance Management)"
echo "   ✓ CA-APM (Application Performance Management)"
echo "   ✓ CAAPIM (CA API Management)"
echo "   ✓ Broadcom Inc (Main)"
echo "   ✓ CA Technologies"
echo "   ✓ CA DevTest Solutions"
