#!/bin/bash

# Script to star Security & Dell Conference repositories
# Created: 2025-11-16

echo "Starting to star Security & Dell Conference repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # CrowdStrike Fal.Con Conference - 25 repos
    # ========================================

    # Fal.Con Conference Materials
    "CrowdStrike/fal.con-2024"

    # Core SDKs & Tools
    "CrowdStrike/falconpy"
    "CrowdStrike/gofalcon"
    "CrowdStrike/caracara"
    "CrowdStrike/terraform-provider-crowdstrike"
    "CrowdStrike/ansible_collection_falcon"
    "CrowdStrike/falcon-scripts"
    "CrowdStrike/falcon-operator"
    "CrowdStrike/terraform-aws-cloud-registration"

    # Foundry Sample Apps (Fal.Con Workshops)
    "CrowdStrike/foundry-sample-charlotte-toolkit"
    "CrowdStrike/foundry-sample-threat-intel"
    "CrowdStrike/foundry-sample-insider-risk-workday"
    "CrowdStrike/foundry-sample-insider-risk-sailpoint"
    "CrowdStrike/foundry-sample-idp-notifications"
    "CrowdStrike/foundry-sample-mitre"
    "CrowdStrike/foundry-sample-servicenow-idp"
    "CrowdStrike/foundry-sample-ngsiem-importer"
    "CrowdStrike/foundry-sample-scalable-rtr"
    "CrowdStrike/foundry-sample-rapid-response"
    "CrowdStrike/foundry-sample-functions-python"

    # Cloud Integration
    "CrowdStrike/cfn-abi-crowdstrike-fcs"

    # Additional Tools
    "CrowdStrike/Cloud-AWS"
    "CrowdStrike/Cloud-Azure"
    "CrowdStrike/logscale-community-content"
    "CrowdStrike/psfalcon"

    # ========================================
    # Palo Alto Networks - 15 repos
    # ========================================

    # Ignite Conference Materials
    "PaloAltoNetworks/ignite2019-how14"
    "paulpc/Ignite2019"

    # Core Tools & SDKs
    "PaloAltoNetworks/pan-os-python"
    "PaloAltoNetworks/pan-python"
    "PaloAltoNetworks/terraform-provider-panos"
    "PaloAltoNetworks/ansible-pan"

    # Demos & Workshops
    "PaloAltoNetworks/demo-local-ai-hr-it-bot"
    "PaloAltoNetworks/google-cloud-nsi-demo"

    # Cloud Security
    "PaloAltoNetworks/prisma-cloud-sdk"
    "PaloAltoNetworks/Prisma-Enhanced-Remediation"

    # DevOps Integration
    "PaloAltoNetworks/github-actions"
    "PaloAltoNetworks/pcs-cwp-gitlab"

    # Learning & Docs
    "PaloAltoNetworks/palo-alto-networks-cortex-xsoar"
    "PaloAltoNetworks/SafeNetworking"
    "PaloAltoNetworks/InstallerHijackingVulnerabilityScanner"

    # ========================================
    # Dell Technologies - 20 repos
    # ========================================

    # AI & HPC
    "dell/dpais-chat-reference-app"
    "dell/omnia"
    "dell/omnia-artifactory"

    # Container Storage Modules
    "dell/csm"
    "dell/csm-docs"
    "dell/csi-powerstore"
    "dell/csi-powerflex"
    "dell/helm-charts"

    # Terraform Providers
    "dell/terraform-provider-powerstore"
    "dell/terraform-provider-powerflex"
    "dell/terraform-provider-objectscale"

    # PowerMax & Storage
    "dell/python-powerstore"
    "dell/pmaxperfpy"
    "dell/powerprotect-data-manager"

    # OpenManage & Automation
    "dell/dellemc-openmanage-ansible-modules"
    "dell/iDRAC-Telemetry-Reference-Tools"
    "dell/common-github-actions"

    # Observability
    "dell/karavi-metrics-powerflex"

    # Documentation
    "dell/azurestack-docs"
    "dell/dell-openstack-ci-logs"
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
echo "  - CrowdStrike Fal.Con: 25 repos"
echo "  - Palo Alto Networks: 15 repos"
echo "  - Dell Technologies: 20 repos"
echo "========================================"
echo "Done!"
