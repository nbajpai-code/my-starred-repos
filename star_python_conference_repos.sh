#!/bin/bash

# Script to star popular Python conference repositories for nbajpai-code
# Created: 2025-11-16

echo "Starting to star Python conference repositories..."

# Array of repositories to star
repos=(
    # PyCon US
    "PyCon/pycon.org"
    "PyCon/pycon-archive"
    "PyCon/pycon2019"
    "PyCon/2018-slides"
    "PyCon/2017-slides"
    "PyCon/2016-slides"
    "PyCon/2015-slides"
    "PyCon/2014-slides"
    "PyCon/2013-slides"
    "PyCon/symposion"
    "PyCon/pretalx"
    "PyCon/registrasion"

    # EuroPython
    "EuroPython/website"
    "EuroPython/programapi"
    "EuroPython/discord"
    "EuroPython/conference-stats"
    "EuroPython/docs"
    "EuroPython/tools"
    "EuroPython/previous.europython.eu"
    "EuroPython/EuroPython-Society-Knowledge-Base"
    "EuroPython/epcon"

    # SciPy Conference
    "scipy-conference/scipy-conference"
    "scipy-conference/scipy_proceedings"
    "scipy-conference/scipy_proceedings_archive"
    "scipy-conference/conference.scipy.org"
    "scipy-conference/scipy2025_sprints_first_PR"
    "scipy-conference/scipy2024_sprints_first_PR"
    "scipy-conference/procbuild"
    "scipy-conference/jhepc"

    # Python Organizers
    "python-organizers/conferences"
    "python-organizers/resources"

    # PyCon Italy
    "pythonitalia/pycon"

    # Popular PyCon Tutorial/Talk Repos
    "miguelgrinberg/flack"
    "brandon-rhodes/sphinx-tutorial"
    "miguelgrinberg/api-pycon2015"
    "miguelgrinberg/flask-pycon2014"
    "miguelgrinberg/api-pycon2014"
    "miguelgrinberg/flask-pycon2015"
    "sarguido/hands-on-analysis-python"
    "PJUllrich/Design-Patterns"
    "trallard/airflow-tutorial"
    "fluentpython/decorators-descriptors"
    "asvetlov/us-pycon-2019-tutorial"
    "julieqiu/pycon-2018-pyelasticsearch"

    # PyCon Educational/Tutorial Content
    "mechanicalgirl/young-coders-tutorial"
    "dabeaz/concurrencylive"
    "kastnerkyle/PyCon2015"
    "wiseaidev/awesome-python"

    # Regional PyCons
    "Aherontas/Pycon_Greece_2025_Presentation_Agents"
    "JustinSDK/PyConTW2013Tutorial"

    # GitHub PyCon Archive
    "github/pycon2011"
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
echo "Done!"
