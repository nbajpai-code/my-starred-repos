#!/bin/bash

################################################################################
# DP-600 Microsoft Fabric Analytics Engineer Exam Preparation Repositories
################################################################################
# This script stars GitHub repositories related to DP-600 certification exam
# preparation, Microsoft Fabric learning resources, and analytics engineering.
#
# Exam: DP-600 - Implementing Analytics Solutions Using Microsoft Fabric
# Certification: Microsoft Certified: Fabric Analytics Engineer Associate
#
# Categories:
# 1. Official DP-600 Study Guides & Exam Prep
# 2. Microsoft Fabric Official Resources
# 3. Community Study Materials & Notes
# 4. Hands-on Labs & Practice Projects
# 5. Microsoft Fabric Samples & Examples
# 6. Deployment Guides & Best Practices
# 7. Power BI & Analytics Resources
# 8. Data Engineering & ETL with Fabric
#
# Created: 2025-01-17
# Updated: 2025-01-17
################################################################################

echo "🎓 Starting DP-600 Microsoft Fabric Analytics Engineer Exam Prep repository starring..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Array of repositories to star
repos=(
    # ═══════════════════════════════════════════════════════════════════════
    # 📚 Official DP-600 Study Guides & Exam Prep
    # ═══════════════════════════════════════════════════════════════════════
    "PacktPublishing/Implementing-Analytics-Solutions-Using-Microsoft-Fabric-DP-600-Exam-Study-Guide"
    "SubhMSFT/DP600-CertificationMaterial"
    "ndamulelonemakh/azure-dp600-fabrics-analytics-engineer-study-guide"
    "DonFrancis1/DP-600-and-DP-700-Exam-Preparation-Materials"
    "DidaCloud/dp-600"

    # ═══════════════════════════════════════════════════════════════════════
    # 🏢 Microsoft Official Fabric Resources
    # ═══════════════════════════════════════════════════════════════════════
    "microsoft/fabric-samples"
    "microsoft/fabric-toolbox"
    "MicrosoftLearning/mslearn-fabric"
    "microsoft/fabric-sdk-python"
    "microsoft/semantic-kernel"

    # ═══════════════════════════════════════════════════════════════════════
    # 📖 Community Study Materials & Notes
    # ═══════════════════════════════════════════════════════════════════════
    "Akbarsait/powertools-data"
    "weslbo/dp-600"
    "MicrosoftCloudEssentials-LearningHub/Fabric-EnterpriseFramework"
    "DataGems/Fabric-Notes"
    "fabricnotes/fabric-learning-path"

    # ═══════════════════════════════════════════════════════════════════════
    # 🧪 Hands-on Labs & Practice Projects
    # ═══════════════════════════════════════════════════════════════════════
    "dereknguyenio/microsoft-fabric-deployment-guide"
    "datahai/microsoft-fabric-deployment-guide"
    "Azure-Samples/modern-data-warehouse-dataops"
    "Azure-Samples/analytics-engineering-on-azure"
    "microsoft/azure-data-services-go-fast-codebase"

    # ═══════════════════════════════════════════════════════════════════════
    # 💼 Microsoft Fabric Architecture & Best Practices
    # ═══════════════════════════════════════════════════════════════════════
    "Azure/azure-synapse-analytics-end2end"
    "Azure/fabric-industry-solutions"
    "microsoft/Fabric-workload-development-sample"
    "Azure/FabricRealTimeWorkshop"
    "Azure/Azure-Synapse-Retail-Recommender"

    # ═══════════════════════════════════════════════════════════════════════
    # 📊 Power BI & Semantic Models
    # ═══════════════════════════════════════════════════════════════════════
    "microsoft/powerbi-client-react"
    "microsoft/powerbi-visuals-tools"
    "microsoft/powerbi-visuals-api"
    "microsoft/DataConnectors"
    "PowerBI-tips/PowerBI-Tips-Tricks"
    "m-kovalsky/fabric_cat_tools"
    "sql-bi/Bravo"
    "TabularEditor/TabularEditor"

    # ═══════════════════════════════════════════════════════════════════════
    # 🔄 Data Engineering & ETL with Fabric
    # ═══════════════════════════════════════════════════════════════════════
    "Azure-Samples/azure-sql-db-sync-fabric-and-adx"
    "Azure/Azure-DataFactory"
    "Azure-Samples/Synapse"
    "microsoft/semantic-link-labs"
    "Azure/DP-203-Data-Engineer"

    # ═══════════════════════════════════════════════════════════════════════
    # 🚀 CI/CD & DevOps for Fabric
    # ═══════════════════════════════════════════════════════════════════════
    "Azure/azure-pipelines-fabric"
    "microsoft/azure-pipelines-tasks"
    "Azure-Samples/fabric-cicd-sample"
    "Azure/terraform-azurerm-fabric"

    # ═══════════════════════════════════════════════════════════════════════
    # 📈 Analytics & Data Science with Fabric
    # ═══════════════════════════════════════════════════════════════════════
    "Azure-Samples/fabric-dataengineering-samples"
    "Azure/MachineLearningNotebooks"
    "microsoft/ML-For-Beginners"
    "microsoft/Data-Science-For-Beginners"
    "Azure-Samples/azure-machine-learning-mlops-workshop"

    # ═══════════════════════════════════════════════════════════════════════
    # 🏗️ Reference Architectures & Templates
    # ═══════════════════════════════════════════════════════════════════════
    "Azure/AnalyticsinaBox"
    "Azure-Samples/analytics-all-in-one"
    "Azure/Azure-Analytics-and-AI-Engagement"
    "Azure-Samples/modern-data-warehouse"
    "Azure/data-landing-zone"

    # ═══════════════════════════════════════════════════════════════════════
    # 🛠️ Monitoring & Governance
    # ═══════════════════════════════════════════════════════════════════════
    "Azure/fabric-monitoring"
    "microsoft/Purview-Catalog-API-Examples"
    "Azure-Samples/purview-lab"
    "Azure/data-governance"

    # ═══════════════════════════════════════════════════════════════════════
    # 📚 Related Microsoft Certifications & Study Materials
    # ═══════════════════════════════════════════════════════════════════════
    "Azure/DP-900-DataFundamentals"
    "Azure/DP-203-Data-Engineer"
    "Azure/DP-500-Azure-Data-Analyst"
    "Azure/PL-300-Microsoft-Power-BI-Data-Analyst"
    "Azure/AZ-104-MicrosoftAzureAdministrator"

    # ═══════════════════════════════════════════════════════════════════════
    # 🎯 Community Tools & Utilities
    # ═══════════════════════════════════════════════════════════════════════
    "sqlbi/DaxFormatter"
    "TabularEditor/TabularEditor3"
    "microsoft/Analysis-Services"
    "microsoft/powerquery-parser"
    "microsoft/powerquery-language-services"
)

# Counter for statistics
total_repos=${#repos[@]}
successful_stars=0
already_starred=0
failed_stars=0

echo "📊 Total repositories to process: $total_repos"
echo ""

# Star each repository
for repo in "${repos[@]}"; do
    echo "⭐ Attempting to star: $repo"

    # Try to star the repository
    if gh repo view "$repo" >/dev/null 2>&1; then
        if gh api --silent --method PUT "user/starred/$repo" 2>/dev/null; then
            echo "   ✅ Successfully starred: $repo"
            ((successful_stars++))
        else
            # Check if already starred
            if gh api --silent "user/starred/$repo" 2>/dev/null; then
                echo "   ⚠️  Already starred: $repo"
                ((already_starred++))
            else
                echo "   ❌ Failed to star: $repo"
                ((failed_stars++))
            fi
        fi
    else
        echo "   ⚠️  Repository not found or not accessible: $repo"
        ((failed_stars++))
    fi

    # Small delay to avoid rate limiting
    sleep 0.5
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Summary Statistics:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   Total repositories: $total_repos"
echo "   ✅ Newly starred: $successful_stars"
echo "   ⚠️  Already starred: $already_starred"
echo "   ❌ Failed/Not found: $failed_stars"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🎓 DP-600 Microsoft Fabric Analytics Engineer exam prep repositories processed!"
echo ""
echo "📚 Study Resources:"
echo "   • Official Microsoft Learn: https://learn.microsoft.com/credentials/certifications/fabric-analytics-engineer-associate/"
echo "   • Study Guide: https://learn.microsoft.com/credentials/certifications/resources/study-guides/dp-600"
echo "   • Practice Assessment: https://learn.microsoft.com/credentials/certifications/practice-assessments-for-microsoft-certifications"
echo "   • Microsoft Fabric Docs: https://learn.microsoft.com/fabric/"
echo ""
echo "💡 Exam Coverage:"
echo "   • Plan, implement, and manage a solution for data analytics (25-30%)"
echo "   • Prepare and serve data (40-45%)"
echo "   • Implement and manage semantic models (20-25%)"
echo "   • Explore and analyze data (10-15%)"
echo ""
echo "✨ Next Steps:"
echo "   1. Review official Microsoft Learn paths"
echo "   2. Complete hands-on labs from microsoft/fabric-samples"
echo "   3. Practice with real Fabric workspace scenarios"
echo "   4. Study semantic models and DAX formulas"
echo "   5. Understand data pipelines and dataflows"
echo "   6. Practice with Power BI report creation"
echo "   7. Review Git integration and CI/CD practices"
echo ""
echo "🎯 Good luck with your DP-600 certification! 🚀"
