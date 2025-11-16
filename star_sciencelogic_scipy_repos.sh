#!/bin/bash

# ScienceLogic & SciPy Conference GitHub Repositories Star Script
# Observability, Scientific Python Stack

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

echo "🚀 Starting to star ScienceLogic & SciPy repositories..."
echo "============================================================"
echo ""

# ScienceLogic Organization
echo "🔬 ScienceLogic Observability..."
echo "   Fetching repositories from ScienceLogic organization..."
repos=$(gh api "orgs/ScienceLogic/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

if [ -n "$repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$repos"
    echo "   ✓ Starred $count repositories from ScienceLogic"
else
    echo "   ⚠️  Could not fetch repositories from ScienceLogic"
fi
echo ""

# SciPy Conference Organization
echo "📊 SciPy Conference..."
echo "   Fetching repositories from scipy-conference organization..."
repos=$(gh api "orgs/scipy-conference/repos?per_page=100" --jq '.[].full_name' 2>/dev/null)

if [ -n "$repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$repos"
    echo "   ✓ Starred $count repositories from scipy-conference"
else
    echo "   ⚠️  Could not fetch repositories from scipy-conference"
fi
echo ""

# Core Scientific Python Stack
echo "🐍 Core Scientific Python Stack..."
star_repo "scipy/scipy"
star_repo "numpy/numpy"
star_repo "matplotlib/matplotlib"
star_repo "pandas-dev/pandas"
star_repo "scikit-learn/scikit-learn"
star_repo "jupyter/notebook"
star_repo "ipython/ipython"
echo ""

# Python Software Foundation
echo "🏛️ Python Software Foundation..."
star_repo "psf/requests"
star_repo "psf/black"
star_repo "psf/httpbin"
star_repo "python/peps"
star_repo "python/cpython"
echo ""

# Advanced Scientific Computing
echo "🔬 Advanced Scientific Computing Tools..."
star_repo "cupy/cupy"
star_repo "sympy/sympy"
star_repo "pydata/xarray"
star_repo "dask/dask"
star_repo "zarr-developers/zarr-python"
star_repo "holoviz/holoviews"
star_repo "pymc-devs/pymc"
star_repo "statsmodels/statsmodels"
star_repo "networkx/networkx"
star_repo "opencv/opencv-python"
echo ""

# Data Visualization & Analysis
echo "📊 Data Visualization & Analysis..."
star_repo "plotly/plotly.py"
star_repo "mwaskom/seaborn"
star_repo "bokeh/bokeh"
star_repo "altair-viz/altair"
echo ""

# Jupyter Ecosystem
echo "📓 Jupyter Ecosystem..."
star_repo "jupyter/jupyter"
star_repo "jupyterlab/jupyterlab"
star_repo "voila-dashboards/voila"
star_repo "jupyter-widgets/ipywidgets"
echo ""

echo "============================================================"
echo "✅ Done! ScienceLogic & SciPy repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "🔬 Categories Covered:"
echo "   ✓ ScienceLogic Observability (OpenTelemetry, infrastructure)"
echo "   ✓ SciPy Conference Organization (~33 repos)"
echo "   ✓ Core Scientific Python Stack (7 repos)"
echo "   ✓ Python Software Foundation (5 repos)"
echo "   ✓ Advanced Scientific Computing (10 repos)"
echo "   ✓ Data Visualization (4 repos)"
echo "   ✓ Jupyter Ecosystem (4 repos)"
echo ""
echo "💡 Featured:"
echo "   • NumPy 2.0 (released 2024)"
echo "   • SciPy 2024 Conference (July 8-14, Tacoma)"
echo "   • ScienceLogic OpenTelemetry components"
echo ""
