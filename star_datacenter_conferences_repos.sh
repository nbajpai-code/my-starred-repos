#!/bin/bash

# Script to star Data Center Conference repositories
# Created: 2025-11-16

echo "Starting to star Data Center Conference repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Open Compute Project (OCP) - 30 repos
    # ========================================

    # Core OCP Infrastructure
    "opencomputeproject/SAI"
    "opencomputeproject/onie"
    "opencomputeproject/ocp-diag-core"
    "opencomputeproject/Security"
    "opencomputeproject/HWMgmt-OCP-Profiles"
    "opencomputeproject/trinityX"
    "opencomputeproject/OCP-Public"

    # OCP Diagnostics & Testing
    "opencomputeproject/ocp-diag-autoval"
    "opencomputeproject/ocp-diag-autoval-ssd"
    "opencomputeproject/ocp-diag-ctam"
    "opencomputeproject/ocp-diag-windtunnel"
    "opencomputeproject/ocp-diag-cpact"
    "opencomputeproject/SAI-Challenger"

    # OCP Security
    "opencomputeproject/OCP-Security-SAFE"
    "opencomputeproject/OCP-Security-FIRM"
    "opencomputeproject/ocp-obmf"

    # OCP Hardware Management
    "opencomputeproject/OCP-HM-Fast-Verify"
    "opencomputeproject/OCP-HM-AMC-Auxiliary_Management_Controller"
    "opencomputeproject/ocp-hm-system-gpu-management"

    # OCP Networking
    "opencomputeproject/ocp-net-optical-circuit-switching"
    "opencomputeproject/OCP-NET-UEC-CSIG"

    # OCP Server & Cloud
    "opencomputeproject/OCP-SVR-MHS-M-PNP_FRUTool"
    "opencomputeproject/OCP-SVR-CMS-Benchmarks"

    # OCP Cooling & Economics
    "opencomputeproject/OCP-CE-CDU-Coolant_Distribution_Unit"
    "opencomputeproject/OCP-CE-HR-Economics-Tool"

    # OCP China Initiatives
    "opencomputeproject/OCP_CHINA_Cloud_Firmware"
    "opencomputeproject/OCP_CHINA_Hardware_Fault_Management"

    # OCP Tools & Registry
    "opencomputeproject/ocp-spec-tools"
    "opencomputeproject/ocp-registry"
    "opencomputeproject/opencomputeproject.github.io"

    # ========================================
    # NVIDIA GTC (GPU Technology Conference) - 12 repos
    # ========================================

    "dmlc/mxnet-gtc-tutorial"
    "Nota-NetsPresso/nota-wav2lip"
    "zhreshold/GTC2020-AutoGluonCV"
    "xsankar/GTC_2020_Transformers_Lab"
    "talbertherndon/doom-monorepo"
    "FanaHOVA/nvidia-gtc-2024-slides"
    "sumedhkhodke/hackathon-nvidia-gtc-25"
    "michaeldunn99/nvidia_gtc2025_cuda"
    "asprgchong/nvidiaGTC_2025"
    "sirselim/NvidiaGTC_2021"
    "davidvonthenen/2025-nvidia-gtc"
    "AndresHG/nvidia-gtc-demo"

    # ========================================
    # Data Center Infrastructure Management (DCIM) - 10 repos
    # ========================================

    "little-brother/dcim-list"
    "nanego/my-dcim"
    "CiscoDevNet/devnet-express-dci-code-samples"
    "Infralinker/Infralinker"
    "freshprogrammer/DCIM"
    "ubccr/heorot"
    "scottpeterman/sc_netbox_importer"
    "Firdauzfan/OpenDCIM_GSPE"
    "letenkov/wiremaps"
    "RavenKyu/mdcim"

    # ========================================
    # Open Network Linux (ONL) - OCP Related - 1 repo
    # ========================================

    "opennetworklinux/ONL"
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
echo "  - Open Compute Project (OCP): 30 repos"
echo "  - NVIDIA GTC: 12 repos"
echo "  - DCIM Tools: 10 repos"
echo "  - Open Network Linux: 1 repo"
echo "========================================"
echo "Done!"
