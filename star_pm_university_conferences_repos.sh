#!/bin/bash

# Script to star Product Management & University Conference repositories
# Created: 2025-11-16

echo "Starting to star Product Management & University Conference repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Product Management Resources - 10 repos
    # ========================================

    "dend/awesome-product-management"
    "ProductHired/open-product-management"
    "Pediomo/product-management-resources"
    "prakashsellathurai/Awesome-Product-Management"
    "bjpcjp/awesome-product-management"
    "rajavijayach/awesome-product-management"
    "soumendra/awesome-product-management"
    "pcefulwarrior/awesome-product-management"
    "Zuojiangtao/awesome-product-management-zh"
    "taurusismysign/awesome-product-management"

    # ========================================
    # CMU ML/AI Conferences & Courses - 10 repos
    # ========================================

    # CMU ML in Production
    "ckaestne/seai"
    "mlip-cmu/awesome-ml-products"

    # CMU MLSP Group
    "cmu-mlsp/mlspcourse"
    "cmu-mlsp/cmu-mlsp.github.io"
    "cmu-mlsp/mlspcourse-2024"
    "cmu-mlsp/learning_from_weak_labels"
    "cmu-mlsp/11-775"
    "cmu-mlsp/interview_humanssum"
    "cmu-mlsp/mlsp-course-2023"

    # CMU Deep Learning
    "zhiranchen/CMU11785-Deep-Learning"

    # ========================================
    # Top ML/AI Conference Papers - 10 repos
    # ========================================

    "MLNLP-World/Top-AI-Conferences-Paper-with-Code"
    "Allenpandas/Reinforcement-Learning-Papers"
    "martenlienen/icml-neurips-iclr-dataset"
    "khairulislam/ML-conferences"
    "jiahaoli57/Call-for-Reviewers"
    "MedicalVisionGroup/ReadingGroup"
    "labmlai/annotated_deep_learning_paper_implementations"
    "hindupuravinash/the-gan-zoo"
    "terryum/awesome-deep-learning-papers"
    "floodsung/Deep-Learning-Papers-Reading-Roadmap"

    # ========================================
    # Stanford AI/ML Systems - 5 repos
    # ========================================

    "stanford-futuredata/FrugalGPT"
    "stanford-crfm/helm"
    "stanford-oval/WikiChat"
    "stanford-policylab/bhr-database"
    "stanfordnlp/dspy"

    # ========================================
    # MIT CSAIL & Research - 5 repos
    # ========================================

    "mit-han-lab/streaming-llm"
    "mit-han-lab/efficientvit"
    "mit-han-lab/torchsparse"
    "mitibmwatsonailab/GAN-Latent-Discovery"
    "mitmedialab/gobo"
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
echo "  - Product Management Resources: 10 repos"
echo "  - CMU ML/AI Conferences & Courses: 10 repos"
echo "  - Top ML/AI Conference Papers: 10 repos"
echo "  - Stanford AI/ML Systems: 5 repos"
echo "  - MIT CSAIL & Research: 5 repos"
echo "========================================"
echo "Done!"
