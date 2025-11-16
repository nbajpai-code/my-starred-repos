#!/bin/bash

# Enterprise Conferences & Splunk Star Script
# AWS re:Invent, NVIDIA GTC, Google Cloud Next, Cisco Live, Splunk .conf

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

echo "🚀 Starting to star Enterprise Conferences & Splunk repositories..."
echo "===================================================================="
echo ""

# AWS Samples (AWS re:Invent, AWS Summit samples)
echo "☁️  AWS Conference Samples (re:Invent, AWS Summit)..."
echo "   Fetching AWS Samples repositories..."
aws_samples=$(gh api "orgs/aws-samples/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$aws_samples" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$aws_samples"
    echo "   ✓ Starred $count top repositories from aws-samples"
else
    echo "   ⚠️  Could not fetch repositories from aws-samples"
fi

# AWS Labs
echo ""
echo "🧪 AWS Labs..."
echo "   Fetching AWS Labs repositories..."
aws_labs=$(gh api "orgs/awslabs/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$aws_labs" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$aws_labs"
    echo "   ✓ Starred $count top repositories from awslabs"
else
    echo "   ⚠️  Could not fetch repositories from awslabs"
fi

# NVIDIA GTC (GPU Technology Conference)
echo ""
echo "🟩 NVIDIA GTC & Developer Resources..."
star_repo "NVIDIA/gpu-feature-discovery"
star_repo "NVIDIA/dcgm-exporter"
star_repo "NVIDIA/cuda-samples"
star_repo "NVIDIA/nvidia-docker"
star_repo "NVIDIA/nvidia-container-toolkit"
star_repo "NVIDIA/k8s-device-plugin"
star_repo "NVIDIA/gpu-operator"

echo "   Fetching NVIDIA-AI-IOT repositories..."
nvidia_aiiot=$(gh api "orgs/NVIDIA-AI-IOT/repos?per_page=30" --jq '.[].full_name' 2>/dev/null)

if [ -n "$nvidia_aiiot" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$nvidia_aiiot"
    echo "   ✓ Starred $count repositories from NVIDIA-AI-IOT"
else
    echo "   ⚠️  Could not fetch repositories from NVIDIA-AI-IOT"
fi

# Google Cloud Next
echo ""
echo "🔵 Google Cloud Next & Developer Resources..."
echo "   Fetching GoogleCloudPlatform samples..."
# Already covered in previous script, but let's add more specific ones
star_repo "GoogleCloudPlatform/microservices-demo"
star_repo "GoogleCloudPlatform/kubernetes-engine-samples"
star_repo "GoogleCloudPlatform/cloud-run-samples"
star_repo "GoogleCloudPlatform/ai-on-gke"
star_repo "GoogleCloudPlatform/generative-ai"
star_repo "GoogleCloudPlatform/vertex-ai-samples"
star_repo "GoogleCloudPlatform/terraform-google-examples"

# Google Developer Groups
echo "   Fetching Google Developer Groups resources..."
star_repo "gdg-cloud-montreal/serverless-workshop-2022"

# Cisco Live
echo ""
echo "🔷 Cisco Live & Developer Resources..."
star_repo "CiscoDevNet/code-exchange-repo-template"
star_repo "CiscoDevNet/cisco-live"

echo "   Fetching additional CiscoDevNet repositories..."
ciscodevnet_more=$(gh api "orgs/CiscoDevNet/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -30)

if [ -n "$ciscodevnet_more" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$ciscodevnet_more"
    echo "   ✓ Starred $count top repositories from CiscoDevNet"
else
    echo "   ⚠️  Could not fetch repositories from CiscoDevNet"
fi

# Cisco Learning (Cisco Live content)
echo "   Fetching Cisco Learning repositories..."
ciscolearning_repos=$(gh api "orgs/CiscoLearning/repos?per_page=30" --jq '.[].full_name' 2>/dev/null)

if [ -n "$ciscolearning_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$ciscolearning_repos"
    echo "   ✓ Starred $count repositories from CiscoLearning"
else
    echo "   ⚠️  Could not fetch repositories from CiscoLearning"
fi

# Splunk
echo ""
echo "💫 Splunk (.conf & Observability)..."
echo "   Fetching Splunk repositories..."
splunk_repos=$(gh api "orgs/splunk/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$splunk_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$splunk_repos"
    echo "   ✓ Starred $count top repositories from splunk"
else
    echo "   ⚠️  Could not fetch repositories from splunk"
fi

# Splunk OpenTelemetry
star_repo "signalfx/splunk-otel-collector"
star_repo "signalfx/splunk-otel-collector-chart"
star_repo "signalfx/splunk-otel-js"
star_repo "signalfx/splunk-otel-python"
star_repo "signalfx/splunk-otel-java"

# Additional Enterprise Conference Resources
echo ""
echo "🏢 Additional Enterprise Resources..."

# HashiCorp (HashiConf)
echo "   Fetching HashiCorp repositories..."
hashicorp_repos=$(gh api "orgs/hashicorp/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -30)

if [ -n "$hashicorp_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$hashicorp_repos"
    echo "   ✓ Starred $count top repositories from hashicorp"
else
    echo "   ⚠️  Could not fetch repositories from hashicorp"
fi

# Red Hat (Red Hat Summit)
echo "   Fetching Red Hat repositories..."
redhat_repos=$(gh api "orgs/redhat-developer/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null | head -25)

if [ -n "$redhat_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$redhat_repos"
    echo "   ✓ Starred $count top repositories from redhat-developer"
else
    echo "   ⚠️  Could not fetch repositories from redhat-developer"
fi

echo ""
echo "===================================================================="
echo "✅ Done! Enterprise Conferences & Splunk repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   ☁️  AWS re:Invent & Summit (aws-samples, awslabs)"
echo "   🟩 NVIDIA GTC (GPU Technology Conference samples)"
echo "   🔵 Google Cloud Next (GCP samples, AI/ML, Vertex AI)"
echo "   🔷 Cisco Live (CiscoDevNet, CiscoLearning)"
echo "   💫 Splunk .conf (Observability, OpenTelemetry)"
echo "   🏢 HashiConf (HashiCorp ecosystem)"
echo "   🎩 Red Hat Summit (Red Hat Developer)"
echo ""
