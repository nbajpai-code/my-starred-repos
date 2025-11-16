#!/bin/bash

# Networking Protocols & AI Infrastructure GitHub Repositories Star Script
# Covers: BGP, ISIS, OSPF, EVPN, EIGRP, L2VPN, L3VPN, SDN, IPsec, MPLS, 5G-Core, Cisco AI, META, Capital One

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

echo "🚀 Starting to star Networking Protocols & AI Infrastructure repositories..."
echo "============================================================================"
echo ""

# BGP (Border Gateway Protocol)
echo "🔀 BGP Routing Protocol..."
star_repo "osrg/gobgp"
star_repo "osrg/rustybgp"
star_repo "smartbgp/yabgp"
star_repo "rbieniek/BGP4J"
star_repo "usnistgov/NIST-BGP-SRx"
star_repo "yhchen-tsinghua/routing-anomaly-detection"
star_repo "bgp/bgp"

# OSPF & ISIS
echo ""
echo "🌐 OSPF & ISIS Routing Protocols..."
star_repo "FRRouting/frr"
star_repo "Vadims06/topolograph"
star_repo "USNavalResearchLaboratory/ospf-mdr"
star_repo "mshahriarinia/OSPF"
star_repo "baudm/ospf-sim"
star_repo "cesarghali/PWOSPF"
star_repo "pcyin/OSPF_Router"

# EVPN & VXLAN
echo ""
echo "🏢 EVPN & VXLAN Data Center Networking..."
star_repo "romanspb80/evpn-for-ovn"
star_repo "mlstyszynski/evpn"
star_repo "TEXNUG/eveng-lab-evpn-vxlan"
star_repo "mlstyszynski/techfest"

# SDN Controllers
echo ""
echo "🎛️  SDN Controllers..."
echo "   Fetching OpenDaylight repositories..."
opendaylight_repos=$(gh api "orgs/opendaylight/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null | head -20)

if [ -n "$opendaylight_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$opendaylight_repos"
    echo "   ✓ Starred $count top repositories from opendaylight"
else
    echo "   ⚠️  Could not fetch repositories from opendaylight"
fi

echo "   Fetching ONOS repositories..."
onos_repos=$(gh api "orgs/opennetworkinglab/repos?per_page=30&sort=stars" --jq '.[].full_name' 2>/dev/null | head -15)

if [ -n "$onos_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$onos_repos"
    echo "   ✓ Starred $count top repositories from opennetworkinglab (ONOS)"
else
    echo "   ⚠️  Could not fetch repositories from opennetworkinglab"
fi

star_repo "faucetsdn/ryu"
star_repo "noxrepo/pox"
star_repo "floodlight/floodlight"

# MPLS, L2VPN, L3VPN
echo ""
echo "🔗 MPLS, L2VPN & L3VPN..."
star_repo "nmaxi/mpls-vpns-all-in-one"
star_repo "martimy/clab_mpls_frr"
star_repo "MohamedShehta2000/MPLS_Protocol"
star_repo "ccollicutt/mpls-networking"

# IPsec VPN
echo ""
echo "🔐 IPsec VPN..."
star_repo "strongswan/strongswan"
star_repo "libreswan/libreswan"
star_repo "Ralph-Lee/VPN-IKEv2-LibreSWAN"

# 5G Core Network
echo ""
echo "📡 5G Core Network..."
star_repo "open5gs/open5gs"
star_repo "free5gc/free5gc"
star_repo "LENSS/5G-Core-Network"

echo "   Fetching additional free5gc repositories..."
free5gc_repos=$(gh api "orgs/free5gc/repos?per_page=30" --jq '.[].full_name' 2>/dev/null)

if [ -n "$free5gc_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$free5gc_repos"
    echo "   ✓ Starred $count repositories from free5gc org"
else
    echo "   ⚠️  Could not fetch repositories from free5gc"
fi

# Cisco AI Infrastructure
echo ""
echo "🤖 Cisco AI Infrastructure..."
echo "   Fetching Cisco AI repositories..."
cisco_ai_repos=$(gh api "orgs/CiscoAI/repos?per_page=50" --jq '.[].full_name' 2>/dev/null)

if [ -n "$cisco_ai_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$cisco_ai_repos"
    echo "   ✓ Starred $count repositories from CiscoAI"
else
    echo "   ⚠️  Could not fetch repositories from CiscoAI"
fi

star_repo "pl247/ai-toolkit"

# META / Facebook AI Research
echo ""
echo "🧠 META AI Research..."
star_repo "meta-llama/llama"
star_repo "meta-llama/llama3"
star_repo "meta-llama/llama-models"
star_repo "meta-llama/llama-recipes"
star_repo "meta-llama/codellama"
star_repo "meta-llama/PurpleLlama"

echo "   Fetching Meta LLaMA repositories..."
meta_llama_repos=$(gh api "orgs/meta-llama/repos?per_page=50" --jq '.[].full_name' 2>/dev/null)

if [ -n "$meta_llama_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$meta_llama_repos"
    echo "   ✓ Starred $count repositories from meta-llama"
else
    echo "   ⚠️  Could not fetch repositories from meta-llama"
fi

echo "   Fetching top Facebook Research repositories..."
fb_research_repos=$(gh api "orgs/facebookresearch/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$fb_research_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$fb_research_repos"
    echo "   ✓ Starred $count top repositories from facebookresearch"
else
    echo "   ⚠️  Could not fetch repositories from facebookresearch"
fi

# PyTorch (Meta)
star_repo "pytorch/pytorch"
star_repo "pytorch/torchtune"
star_repo "pytorch/torchchat"
star_repo "pytorch/executorch"

# Capital One AI/ML
echo ""
echo "💳 Capital One AI & Data Science..."
echo "   Fetching Capital One repositories..."
capital_one_repos=$(gh api "orgs/capitalone/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null)

if [ -n "$capital_one_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$capital_one_repos"
    echo "   ✓ Starred $count repositories from Capital One"
else
    echo "   ⚠️  Could not fetch repositories from capitalone"
fi

# Google Cloud
echo ""
echo "☁️  Google Cloud Platform..."
echo "   Fetching Google Cloud Platform repositories..."
gcp_repos=$(gh api "orgs/GoogleCloudPlatform/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$gcp_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$gcp_repos"
    echo "   ✓ Starred $count top repositories from GoogleCloudPlatform"
else
    echo "   ⚠️  Could not fetch repositories from GoogleCloudPlatform"
fi

# Google AI/ML
echo "   Fetching Google Research repositories..."
google_research_repos=$(gh api "orgs/google-research/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -30)

if [ -n "$google_research_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$google_research_repos"
    echo "   ✓ Starred $count top repositories from google-research"
else
    echo "   ⚠️  Could not fetch repositories from google-research"
fi

# Google DeepMind
echo "   Fetching Google DeepMind repositories..."
deepmind_repos=$(gh api "orgs/google-deepmind/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null)

if [ -n "$deepmind_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$deepmind_repos"
    echo "   ✓ Starred $count repositories from google-deepmind"
else
    echo "   ⚠️  Could not fetch repositories from google-deepmind"
fi

star_repo "google/generative-ai-docs"
star_repo "google/gemini-api"
star_repo "googleapis/googleapis"
star_repo "tensorflow/tensorflow"

# Oracle Cloud Infrastructure
echo ""
echo "🔶 Oracle Cloud Infrastructure..."
echo "   Fetching Oracle repositories..."
oracle_repos=$(gh api "orgs/oracle/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -40)

if [ -n "$oracle_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$oracle_repos"
    echo "   ✓ Starred $count top repositories from oracle"
else
    echo "   ⚠️  Could not fetch repositories from oracle"
fi

# OCI specific repos
star_repo "oracle/oci-cli"
star_repo "oracle/oci-python-sdk"
star_repo "oracle/terraform-provider-oci"

# Additional Network Automation
echo ""
echo "🔧 Network Automation & Testing..."
star_repo "network-automation/yang-explorer"
star_repo "CiscoTestAutomation/pyats"
star_repo "CiscoTestAutomation/genieparser"
star_repo "YangModels/yang"
star_repo "openconfig/public"

echo ""
echo "============================================================================"
echo "✅ Done! Networking Protocols & AI Infrastructure repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   🔀 BGP Routing Protocol (7 repos)"
echo "   🌐 OSPF & ISIS Routing (7 repos)"
echo "   🏢 EVPN & VXLAN (4 repos)"
echo "   🎛️  SDN Controllers (OpenDaylight, ONOS, Ryu, POX, Floodlight)"
echo "   🔗 MPLS, L2VPN, L3VPN (4 repos)"
echo "   🔐 IPsec VPN (3 repos)"
echo "   📡 5G Core Network (Open5GS, free5GC org)"
echo "   🤖 Cisco AI Infrastructure (CiscoAI org)"
echo "   🧠 META AI Research (LLaMA, PyTorch, FacebookResearch)"
echo "   💳 Capital One AI/ML & Data Science"
echo "   ☁️  Google Cloud Platform (GCP, Google Research, DeepMind)"
echo "   🔶 Oracle Cloud Infrastructure (OCI, SDKs, Terraform)"
echo "   🔧 Network Automation (pyATS, Genie, YANG)"
echo ""
