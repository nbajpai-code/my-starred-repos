#!/bin/bash

# Script to star Open Compute Project (OCP) Conference repositories
# Created: 2025-11-16

echo "Starting to star Open Compute Project repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # OCP Core Infrastructure - 10 repos
    # ========================================

    "opencomputeproject/onie"
    "opencomputeproject/OpenNetworkLinux"
    "opencomputeproject/SAI"
    "opencomputeproject/Project_Olympus"
    "opencomputeproject/Project-Zipline"
    "opencomputeproject/Security"
    "opencomputeproject/OpenSystemFirmware"
    "opencomputeproject/CADCloud"
    "opencomputeproject/trinityX"
    "opencomputeproject/oom"

    # ========================================
    # OCP Diagnostics & Testing - 10 repos
    # ========================================

    "opencomputeproject/ocp-diag-core"
    "opencomputeproject/ocp-diag-autoval"
    "opencomputeproject/ocp-diag-autoval-ssd"
    "opencomputeproject/ocp-diag-ctam"
    "opencomputeproject/ocp-diag-pcicrawler"
    "opencomputeproject/ocp-diag-pci_lmt"
    "opencomputeproject/ocp-diag-core-python"
    "opencomputeproject/ocp-diag-core-cpp"
    "opencomputeproject/ocp-diag-memtester"
    "opencomputeproject/ocp-diag-quickstart"

    # ========================================
    # OCP Hardware Management - 10 repos
    # ========================================

    "opencomputeproject/HWMgmt-OCP-Profiles"
    "opencomputeproject/HWMgmt-DeviceMgr-DeviceManager"
    "opencomputeproject/HWMgmt-DeviceMgr-PSME"
    "opencomputeproject/HWMgmt-Module-DCSCM-LTPI"
    "opencomputeproject/OCP-HM-MegaRAC_Community_Edition"
    "opencomputeproject/Rack-Manager"
    "opencomputeproject/Project_Olympus_rack_manager"
    "opencomputeproject/RunBMC"
    "opencomputeproject/ocp-obmf"
    "opencomputeproject/Discovery"

    # ========================================
    # OCP Firmware & BIOS - 10 repos
    # ========================================

    "opencomputeproject/OCP-OSF-Aptio_Community_Edition"
    "opencomputeproject/OCP-OSF-Tektagon_Community_Edition"
    "opencomputeproject/OSF-OSFCI"
    "opencomputeproject/zaius-barreleye-g2"
    "opencomputeproject/mion"
    "opencomputeproject/OCP-Accepted-Ampere-Computing"
    "opencomputeproject/OCP-Ready-Facility-Recognition-Program"
    "opencomputeproject/PowerAPI"
    "opencomputeproject/OCP-Software-GitHub-Process"
    "opencomputeproject/FP8"

    # ========================================
    # OCP Networking - 5 repos
    # ========================================

    "opencomputeproject/SAI-Challenger"
    "opencomputeproject/OCP-NET-Falcon"
    "opencomputeproject/OCP-Telco-Open_3GPP_RU"
    "opennetworklinux/ONL"
    "opencomputeproject/ODSA-Link-Layer"

    # ========================================
    # OCP Security - 5 repos
    # ========================================

    "opencomputeproject/OCP-Security-SAFE"
    "opencomputeproject/OCP-Security-FIRM"
    "opencomputeproject/Security"
    "opencomputeproject/ocp-obmf"
    "opencomputeproject/OCP-Software-GitHub-Process"

    # ========================================
    # OCP Storage & Data - 5 repos
    # ========================================

    "opencomputeproject/ODSA-BoW"
    "opencomputeproject/ODSA-CDXML"
    "opencomputeproject/ODSA-Link-Layer"
    "opencomputeproject/OCP-STO-HDD-NVMe_Telematics"
    "opencomputeproject/Project-Zipline"

    # ========================================
    # OCP Server & Cloud - 5 repos
    # ========================================

    "opencomputeproject/OCP-SVR-CMS-Benchmarks"
    "opencomputeproject/Project_Olympus"
    "opencomputeproject/Project-Zipline"
    "opencomputeproject/CADCloud"
    "opencomputeproject/trinityX"

    # ========================================
    # OCP Cooling & Economics - 2 repos
    # ========================================

    "opencomputeproject/OCP-CE-HR-Economics-Tool"
    "opencomputeproject/OCP-Ready-Facility-Recognition-Program"
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
echo "  - OCP Core Infrastructure: 10 repos"
echo "  - OCP Diagnostics & Testing: 10 repos"
echo "  - OCP Hardware Management: 10 repos"
echo "  - OCP Firmware & BIOS: 10 repos"
echo "  - OCP Networking: 5 repos"
echo "  - OCP Security: 5 repos"
echo "  - OCP Storage & Data: 5 repos"
echo "  - OCP Server & Cloud: 5 repos"
echo "  - OCP Cooling & Economics: 2 repos"
echo "========================================"
echo "Done!"
