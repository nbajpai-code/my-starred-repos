#!/bin/bash

# Cisco Network Observability Stack GitHub Repositories Star Script
# Full-Stack Observability, Telemetry, DNA Center, NSO, AppDynamics

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

echo "🚀 Starting to star Cisco Network Observability Stack repositories..."
echo "===================================================================="
echo ""

# Cisco Open (Full-Stack Observability & Modern Tools)
echo "🔷 Cisco Open Organization..."
echo "   Fetching repositories from cisco-open..."
cisco_open_repos=$(gh api "orgs/cisco-open/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

if [ -n "$cisco_open_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$cisco_open_repos"
    echo "   ✓ Starred $count repositories from cisco-open"
else
    echo "   ⚠️  Could not fetch repositories from cisco-open"
fi

# Model-Driven Telemetry
echo ""
echo "📡 Model-Driven Telemetry (MDT)..."
star_repo "jeremycohoe/cisco-ios-xe-mdt"
star_repo "ios-xr/model-driven-telemetry"
star_repo "CiscoDevNet/nx-telemetry-proto"
star_repo "dmfigol/network-programmability-stream"

# DNA Center
echo ""
echo "🧬 Cisco DNA Center..."
star_repo "robertcsapo/awesome-cisco-dnac"
star_repo "CiscoDevNet/DNAC-Top5"
star_repo "CiscoDevNet/DNAC-AURA"
star_repo "CiscoDevNet/DNA_Analyzer"
star_repo "cisco-en-programmability/dnacenter_git_integrations"
star_repo "GShuttleworth/Cisco-DNA-Center-Device-Config-To-Git"
star_repo "daxm/CD-for-Cisco-DNA-Center-and-FMC-Programming-via-API"
star_repo "jabelk/import-dnac-nso"

# Cisco NSO (Network Services Orchestrator)
echo ""
echo "🎯 Cisco NSO..."
star_repo "NSO-developer/nso-docker"
star_repo "NSO-developer/nso-gitops"

# Cisco Innovation Edge
echo ""
echo "💡 Cisco Innovation Edge..."
echo "   Fetching repositories from cisco-ie..."
cisco_ie_repos=$(gh api "orgs/cisco-ie/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

if [ -n "$cisco_ie_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$cisco_ie_repos"
    echo "   ✓ Starred $count repositories from cisco-ie"
else
    echo "   ⚠️  Could not fetch repositories from cisco-ie"
fi

# Cisco Customer Experience (CX)
echo ""
echo "🤝 Cisco Customer Experience..."
star_repo "cisco-cx/of-docs"

# Cisco DevNet
echo ""
echo "👨‍💻 Cisco DevNet..."
star_repo "CiscoDevNet/ansible-aci"
star_repo "CiscoDevNet/ansible-nd"
star_repo "CiscoDevNet/terraform-provider-aci"
star_repo "CiscoDevNet/yang-suite"
star_repo "CiscoDevNet/yang-explorer"
star_repo "CiscoDevNet/netbox-cisco"

# Cisco Public Sector
echo ""
echo "🏛️  Cisco Public Sector (ciscops)..."
echo "   Fetching repositories from ciscops..."
ciscops_repos=$(gh api "orgs/ciscops/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

if [ -n "$ciscops_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$ciscops_repos"
    echo "   ✓ Starred $count repositories from ciscops"
else
    echo "   ⚠️  Could not fetch repositories from ciscops"
fi

# Cisco Systems Official
echo ""
echo "🔷 Cisco Systems (Additional Observability Tools)..."
star_repo "cisco/mercury"
star_repo "cisco/joy"
star_repo "cisco/openh264"
star_repo "cisco/ChezScheme"

# Cisco Learning (Integration Guides)
echo ""
echo "🎓 Cisco Learning..."
star_repo "CiscoLearning/ciscoLive-LTRCLD-2820"

# Network Programmability
echo ""
echo "🌐 Network Programmability & Automation..."
star_repo "network-automation/yang-explorer"
star_repo "CiscoTestAutomation/pyats"
star_repo "CiscoTestAutomation/genieparser"

# YANG Models
echo ""
echo "📋 YANG Data Models..."
star_repo "YangModels/yang"
star_repo "openconfig/public"

# Observability Integrations
echo ""
echo "🔗 Observability Integrations..."
star_repo "signalfx/splunk-opentelemetry-examples"

# Cisco Webex (if related to observability)
echo ""
echo "💬 Cisco Collaboration & Observability..."
star_repo "CiscoDevNet/webex-contact-center-api-samples"

echo ""
echo "===================================================================="
echo "✅ Done! Cisco Network Observability Stack repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   🔷 Cisco Open (Full-Stack Observability)"
echo "   📡 Model-Driven Telemetry (IOS XE, IOS XR, NX-OS)"
echo "   🧬 Cisco DNA Center (Automation, Git Integration, AURA)"
echo "   🎯 Cisco NSO (Network Services Orchestrator)"
echo "   💡 Cisco Innovation Edge"
echo "   🤝 Cisco Customer Experience"
echo "   👨‍💻 Cisco DevNet (Ansible, Terraform, YANG)"
echo "   🏛️  Cisco Public Sector"
echo "   🌐 Network Programmability (pyATS, Genie)"
echo "   📋 YANG Data Models"
echo "   🔗 Observability Integrations (Splunk, OpenTelemetry)"
echo ""
echo "🌟 Cisco Full-Stack Observability Components:"
echo "   ✓ ThousandEyes (Network Performance)"
echo "   ✓ AppDynamics (APM - now part of Splunk Observability)"
echo "   ✓ Intersight (Infrastructure Management)"
echo "   ✓ Model-Driven Telemetry (Streaming Telemetry)"
echo "   ✓ DNA Center (Network Automation)"
echo "   ✓ NSO (Service Orchestration)"
