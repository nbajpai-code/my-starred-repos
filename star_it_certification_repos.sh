#!/bin/bash

# Script to star IT/Tech Certification Resources repositories
# Created: 2025-11-16

echo "Starting to star IT/Tech Certification Resources repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Kubernetes Certifications (CKA/CKAD/CKS) - 20 repos
    # ========================================

    "dgkanatsios/CKAD-exercises"
    "walidshaari/Kubernetes-Certified-Administrator"
    "alexellis/arkade"
    "ViktorUJ/cks"
    "techiescamp/linux-foundation-coupon"
    "arush-sal/cka-practice-environment"
    "piyushsachdeva/CKA-2024"
    "techiescamp/vagrant-kubeadm-kubernetes"
    "leandrocostam/cka-preparation-guide"
    "sailor-sh/CK-X"
    "bmuschko/ckad-prep"
    "bmuschko/cka-crash-course"
    "bmuschko/ckad-crash-course"
    "bmuschko/cka-study-guide"
    "bmuschko/ckad-study-guide"
    "ismet55555/Certified-Kubernetes-Administrator-Notes"
    "krzko/awesome-cka"
    "reetasingh/CKAD-Bookmarks"
    "jayendrapatil/kubernetes-exercises"
    "jamesbuckett/ckad-questions"

    # ========================================
    # AWS Certifications - 20 repos
    # ========================================

    "ptcodes/awesome-aws-certifications"
    "Furkan-Gulsen/AWS-Certified-Cloud-Practitioner-Certification-My-Notes"
    "mikeroyal/AWS-Guide"
    "notcuder/aws-mindmap"
    "Ditectrev/Amazon-Web-Services-AWS-Developer-Associate-DVA-C02-Practice-Tests-Exams-Questions-Answers"
    "agasthik/aws-csa-2017"
    "ExamProCo/AWS-Examples"
    "AlessioCasco/AWS-CSA-2019-study-notes"
    "kasukur/AWS_CCP_Notes"
    "gustavofreze/aws-certified-cloud-practitioner"
    "pietheinstrengholt/aws-certified-solutions-architect-associate-exam-tips"
    "jangroth/aws-certification-notes"
    "JeffreyMFarley/aws-flash"
    "bishopsmove/Certification-Study-Guides"
    "jlimadev/aws-certification-cloud-practitioner-notes"
    "theNicelander/AWS-Certified-Machine-Learning-Study-Notes"
    "asifvora/aws-solutions-architect-associate-notes"
    "NebulaTris/aws-saa-c03-crash-course"
    "AUSG/aws-certification-study"
    "Reybolt/aws-certified-developer-associate-udemy-notes"

    # ========================================
    # Azure Certifications - 10 repos
    # ========================================

    "MicrosoftLearning/AZ-900T0x-MicrosoftAzureFundamentals"
    "MicrosoftLearning/AZ-104-MicrosoftAzureAdministrator"
    "MicrosoftLearning/AZ-204-DevelopingSolutionsforMicrosoftAzure"
    "MicrosoftLearning/AZ-305-DesigningMicrosoftAzureInfrastructureSolutions"
    "MicrosoftLearning/AZ-400-DesigningandImplementingMicrosoftDevOpsSolutions"
    "MicrosoftLearning/AI-900-AIFundamentals"
    "MicrosoftLearning/DP-900T00A-Azure-Data-Fundamentals"
    "MicrosoftLearning/SC-900-Microsoft-Security-Compliance-and-Identity-Fundamentals"
    "MicrosoftLearning/AZ-700-Designing-and-Implementing-Microsoft-Azure-Networking-Solutions"
    "MicrosoftLearning/AZ-500-AzureSecurityTechnologies"

    # ========================================
    # Google Cloud Certifications - 10 repos
    # ========================================

    "sathishvj/awesome-gcp-certifications"
    "Leverege/gcp-security-engineer-study-guide"
    "GoogleCloudPlatform/generative-ai"
    "GoogleCloudPlatform/python-docs-samples"
    "GoogleCloudPlatform/terraform-google-examples"
    "GoogleCloudPlatform/cloud-foundation-fabric"
    "GoogleCloudPlatform/professional-services"
    "GoogleCloudPlatform/kubernetes-engine-samples"
    "GoogleCloudPlatform/ai-platform-samples"
    "GoogleCloudPlatform/DataflowTemplates"

    # ========================================
    # HashiCorp Terraform Certification - 10 repos
    # ========================================

    "bradmccoydev/terraform-cert-practice-questions"
    "hashicorp/terraform"
    "hashicorp/terraform-provider-aws"
    "hashicorp/terraform-provider-azurerm"
    "hashicorp/terraform-provider-google"
    "hashicorp/learn-terraform-provision-eks-cluster"
    "hashicorp/learn-terraform-provision-aks-cluster"
    "hashicorp/learn-terraform-deploy-nginx-kubernetes-provider"
    "hashicorp/learn-terraform-modules"
    "hashicorp/terraform-provider-kubernetes"

    # ========================================
    # General Cloud & DevOps Certifications - 10 repos
    # ========================================

    "cloudcommunity/Free-Certifications"
    "CloudNativeStudyGroup/Linux-Foundation-Coupons"
    "mikeroyal/DevSecOps-Guide"
    "mikeroyal/Cloud-Native-Guide"
    "bregman-arie/devops-exercises"
    "bregman-arie/devops-resources"
    "kamranahmedse/developer-roadmap"
    "prakhar1989/awesome-courses"
    "ossu/computer-science"
    "mtdvio/every-programmer-should-know"

    # ========================================
    # Linux & System Administration - 10 repos
    # ========================================

    "LukeSmithxyz/based.cooking"
    "imthenachoman/How-To-Secure-A-Linux-Server"
    "kahun/awesome-sysadmin"
    "n1trux/awesome-sysadmin"
    "awesome-foss/awesome-sysadmin"
    "trimstray/the-book-of-secret-knowledge"
    "jlevy/the-art-of-command-line"
    "alebcay/awesome-shell"
    "unixorn/awesome-zsh-plugins"
    "rothgar/awesome-tuis"

    # ========================================
    # CompTIA & Security Certifications - 10 repos
    # ========================================

    "fkie-cad/awesome-embedded-and-iot-security"
    "sbilly/awesome-security"
    "Hack-with-Github/Awesome-Hacking"
    "paragonie/awesome-appsec"
    "enaqx/awesome-pentest"
    "qazbnm456/awesome-web-security"
    "hslatman/awesome-threat-intelligence"
    "analysis-tools-dev/static-analysis"
    "meirwah/awesome-incident-response"
    "onlurking/awesome-infosec"
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
echo "  - Kubernetes Certifications (CKA/CKAD/CKS): 20 repos"
echo "  - AWS Certifications: 20 repos"
echo "  - Azure Certifications: 10 repos"
echo "  - Google Cloud Certifications: 10 repos"
echo "  - HashiCorp Terraform Certification: 10 repos"
echo "  - General Cloud & DevOps Certifications: 10 repos"
echo "  - Linux & System Administration: 10 repos"
echo "  - CompTIA & Security Certifications: 10 repos"
echo "========================================"
echo ""
echo "📚 TOP CERTIFICATION RESOURCES:"
echo ""
echo "🔷 Kubernetes (CKA/CKAD/CKS):"
echo "  - Linux Foundation Coupons & Discounts"
echo "  - Practice exercises, crash courses, study guides"
echo "  - Hands-on labs and exam prep environments"
echo ""
echo "☁️ AWS Certifications:"
echo "  - Cloud Practitioner, Solutions Architect, Developer"
echo "  - SysOps Administrator, DevOps Engineer, Security"
echo "  - Machine Learning, Database, Networking"
echo ""
echo "🔵 Azure Certifications:"
echo "  - AZ-900 (Fundamentals), AZ-104 (Administrator)"
echo "  - AZ-204 (Developer), AZ-305 (Solutions Architect)"
echo "  - AZ-400 (DevOps), AZ-500 (Security), AZ-700 (Networking)"
echo "  - AI-900, DP-900 (Data), SC-900 (Security/Compliance)"
echo ""
echo "🔴 Google Cloud Certifications:"
echo "  - Associate Cloud Engineer"
echo "  - Professional Cloud Architect, DevOps Engineer"
echo "  - Security Engineer, Data Engineer, ML Engineer"
echo ""
echo "🟣 HashiCorp Terraform:"
echo "  - Terraform Associate Certification"
echo "  - Practice questions, exam guides"
echo "  - Official Terraform providers (AWS, Azure, GCP, K8s)"
echo ""
echo "🔧 DevOps & Cloud Native:"
echo "  - Free certification resources"
echo "  - DevOps exercises & best practices"
echo "  - Developer roadmaps & learning paths"
echo ""
echo "🐧 Linux & SysAdmin:"
echo "  - Linux security hardening guides"
echo "  - Command-line mastery resources"
echo "  - System administration best practices"
echo ""
echo "🔒 Security Certifications (CompTIA, CISSP, CEH):"
echo "  - Application security, penetration testing"
echo "  - Web security, incident response"
echo "  - Threat intelligence, embedded/IoT security"
echo "========================================"
echo "Done!"
