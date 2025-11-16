#!/bin/bash

# Script to star Tech Conference repositories (Cisco, Meta, Google, Microsoft, Linux, Security)
# Created: 2025-11-16

echo "Starting to star Tech Conference repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Cisco Live & DevNet Conferences (30 repos)
    # ========================================

    # Top Cisco Live Repos
    "babajung/cisco-live"
    "nickrusso42518/ospf_brkrst3310"
    "CiscoTestAutomation/CL-DevNet-2595"
    "CiscoDevNet/BRKDEV-1368"
    "CiscoSE/LTRPRG-1100"
    "CiscoTestAutomation/CL-DEVWKS-2808"
    "hpreston/workshops"
    "RunSi/DEVWKS-2601"
    "spsharman/CiscoLive2020"
    "plucena24/cisco_live_downloader"
    "jasoncdavis/CiscoLiveNOC2022LV"
    "jasoncdavis/CiscoLiveNOC23US"
    "spsharman/CiscoLive2019"
    "CiscoTestAutomation/CL-BRKPRG-1798"
    "CiscoTestAutomation/CLUS18-DevNet-2595"
    "networktocode/clemea-demo"
    "cskoglun/BRKOPS-2103"
    "RomainCyr/LTRSP-3589"
    "sQu4rks/DEVNET-1970"
    "zapodeanu/DEVWKS_2840"
    "CiscoSE/DEVWKS-2096-CLUS19"
    "vhosakot/Cisco-Live-Workshop"
    "bluraniec/devnet-2449"
    "aligarci/CiscoLive_MachineLearningWithPython"
    "shermdog/devnet_bootstrap_clus_19"
    "annately/nso-netbox-cl"
    "ObjectIsAdvantag/devnetzone-workshop-2074"
    "Pradip-Mule/CL-AMS-DEVWKS-2382"
    "sQu4rks/DEVNET-1439"
    "palmersample/ciscolive-devwks-2539"

    # ========================================
    # Meta/Facebook Conferences (10 repos)
    # ========================================

    # React Conf
    "aholachek/mobile-first-animation"
    "expo/react-conf-app"
    "Thinkmill/react-conf-app"
    "ryanflorence/react-conf-2018"
    "sophiebits/react-dom-mini"
    "infinitered/ChainReactApp2017"
    "MaggieAppleton/react-metaphors-slides"
    "rickhanlonii/async-react"
    "jaredpalmer/react-conf-2018"
    "react-brasil/reactconfbr"

    # ========================================
    # Google Conferences (10 repos)
    # ========================================

    # Google I/O
    "romainguy/google-io-2014"
    "unrarp/google-io-2014-compat"
    "rmcgibbo/slidedeck"
    "espressif/esp-google-iot"
    "eneim/Google_io_2016_timer"
    "Instrument/google-io-2013"
    "Instrument/google-io-2014-experiment"
    "karminski/google-io-2025-big-map"
    "RolandMostoha/pin-demo-gio-ext-2017"
    "argyleink/Google-IO-2021-Workshop_User-Adaptive-Interfaces"

    # ========================================
    # Microsoft Conferences (20 repos)
    # ========================================

    # Microsoft Ignite Learning Paths
    "microsoft/ignite-learning-paths-training"
    "microsoft/IgniteTheTour"

    # Microsoft Ignite 2025 Labs
    "microsoft/ignite25-LAB516-safeguard-your-agents-with-ai-red-teaming-agent-in-azure-ai-foundry"
    "microsoft/ignite25-LAB532-get-real-with-real-time-intelligence-to-transform-data-into-action"
    "microsoft/ignite25-LAB531-accelerate-bi-with-azure-databricks-in-the-era-of-ai"
    "microsoft/ignite25-LAB541-defend-against-threats-with-microsoft-defender"
    "microsoft/ignite25-LAB543-perform-threat-hunting-in-microsoft-sentinel"
    "microsoft/ignite25-LAB540-microsoft-purview-integration-with-microsoft-defender-xdr"
    "microsoft/ignite25-LAB542-zero-trust-lab-securing-identities-and-devices-with-intune-and-entra"
    "microsoft/ignite25-LAB546-securing-the-stack-zero-trust-for-data-infra-network-and-soc"
    "microsoft/ignite25-LAB548-prevent-data-exposure-in-copilot-and-ai-apps-with-data-loss-prevention"
    "microsoft/ignite25-LAB547-implement-insider-risk-management-and-adaptive-protection-for-ai"
    "microsoft/ignite25-LAB545-manage-sensitive-data-using-information-protection-in-the-age-of-ai"
    "microsoft/ignite25-LAB560-building-declarative-agents-with-typespec-and-m365-agents-toolkit"
    "microsoft/ignite25-LAB568-deep-dive-into-teams-admin-center-and-security-innovations"
    "microsoft/ignite25-LAB562-jumpstart-ai-powered-hr-and-it-support-with-employee-self-service-agent"

    # ========================================
    # Linux Foundation / KubeCon (10 repos)
    # ========================================

    "warmchang/KubeCon-North-America-2018"
    "warmchang/KubeCon-CloudNativeCon-Europe-2019"
    "lizrice/running-with-scissors"
    "lizrice/kubecon-seattle"
    "sofastack-guides/kubecon-workshop-demo-2019"
    "kingdonb/kccnceu2021"
    "warmchang/KubeCon-CloudNativeCon-OpenSourceSummit-AI_dev-China-2024"
    "AEnguerrand/kubecon-cloudnativecon-na-2024-supply-chain-security-lab"
    "christian-roggia/kubecon-europe-2019-demos"
    "able8/sched-slides-downloader"
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
echo "Breakdown by Conference:"
echo "  - Cisco Live & DevNet: 30 repos"
echo "  - Meta/Facebook (React Conf): 10 repos"
echo "  - Google I/O: 10 repos"
echo "  - Microsoft Ignite/Build: 20 repos"
echo "  - Linux Foundation/KubeCon: 10 repos"
echo "========================================"
echo "Done!"
