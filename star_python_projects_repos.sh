#!/bin/bash

# Top Python Projects for Code Browsing & Learning
# Focus on well-written, clean code with great architecture

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

echo "🚀 Starting to star Top Python Projects..."
echo "========================================================"
echo ""

# Clean Code & Best Practices
echo "✨ Clean Code & Best Practices..."
star_repo "zedr/clean-code-python"
star_repo "claudiosw/python-best-practices"
star_repo "PacktPublishing/Clean-Code-in-Python"
star_repo "claudiosw/python-clean-architecture-example"
star_repo "realpython/python-guide"
star_repo "cosmicpython/book"

# Web Frameworks - Well-Architected
echo ""
echo "🌐 Web Frameworks..."
star_repo "django/django"
star_repo "pallets/flask"
star_repo "tiangolo/fastapi"
star_repo "encode/starlette"
star_repo "sanic-org/sanic"
star_repo "bottlepy/bottle"
star_repo "tornadoweb/tornado"
star_repo "falconry/falcon"

# REST Framework & API Development
echo ""
echo "🔌 REST Framework & API Development..."
star_repo "encode/django-rest-framework"
star_repo "tiangolo/full-stack-fastapi-template"
star_repo "fastapi-users/fastapi-users"
star_repo "flask-restful/flask-restful"
star_repo "marshmallow-code/marshmallow"

# ORM & Database
echo ""
echo "💾 ORM & Database..."
star_repo "sqlalchemy/sqlalchemy"
star_repo "tortoise/tortoise-orm"
star_repo "encode/orm"
star_repo "ponyorm/pony"
star_repo "sqlmodel/sqlmodel"

# HTTP & Networking
echo ""
echo "🌍 HTTP & Networking Libraries..."
star_repo "psf/requests"
star_repo "aio-libs/aiohttp"
star_repo "httpie/httpie"
star_repo "encode/httpx"
star_repo "urllib3/urllib3"

# CLI Tools & Terminal UI
echo ""
echo "💻 CLI Tools & Terminal UI..."
star_repo "Textualize/rich"
star_repo "fastapi/typer"
star_repo "pallets/click"
star_repo "ewels/rich-click"
star_repo "Textualize/textual"
star_repo "prompt-toolkit/python-prompt-toolkit"
star_repo "google/python-fire"
star_repo "tiangolo/typer-cli"

# Async & Concurrency
echo ""
echo "⚡ Async & Concurrency..."
star_repo "python/cpython"
star_repo "aio-libs/asyncio"
star_repo "MagicStack/uvloop"
star_repo "python-trio/trio"
star_repo "dabeaz/curio"

# Testing Frameworks
echo ""
echo "🧪 Testing Frameworks..."
star_repo "pytest-dev/pytest"
star_repo "HypothesisWorks/hypothesis"
star_repo "robotframework/robotframework"
star_repo "spulec/freezegun"
star_repo "pytest-dev/pytest-asyncio"
star_repo "pytest-dev/pytest-cov"
star_repo "tox-dev/tox"

# Code Quality & Linting
echo ""
echo "🔍 Code Quality & Linting..."
star_repo "PyCQA/pylint"
star_repo "astral-sh/ruff"
star_repo "PyCQA/flake8"
star_repo "google/yapf"
star_repo "psf/black"
star_repo "PyCQA/isort"
star_repo "python/mypy"
star_repo "charliermarsh/ruff"
star_repo "pre-commit/pre-commit"

# Data Science & ML Libraries
echo ""
echo "📊 Data Science & ML..."
star_repo "numpy/numpy"
star_repo "pandas-dev/pandas"
star_repo "pola-rs/polars"
star_repo "scikit-learn/scikit-learn"
star_repo "matplotlib/matplotlib"
star_repo "mwaskom/seaborn"
star_repo "plotly/plotly.py"

# Data Validation & Serialization
echo ""
echo "✅ Data Validation & Serialization..."
star_repo "pydantic/pydantic"
star_repo "python-attrs/attrs"
star_repo "python-jsonschema/jsonschema"
star_repo "keleshev/schema"

# Task Queues & Job Processing
echo ""
echo "📬 Task Queues & Job Processing..."
star_repo "celery/celery"
star_repo "rq/rq"
star_repo "taskiq-python/taskiq"
star_repo "encode/broadcaster"

# Algorithms & Data Structures
echo ""
echo "🧮 Algorithms & Data Structures..."
star_repo "TheAlgorithms/Python"
star_repo "keon/algorithms"
star_repo "OmkarPathak/pygorithm"

# Design Patterns
echo ""
echo "🏗️  Design Patterns..."
star_repo "faif/python-patterns"
star_repo "tylerlaberge/PyPattyrn"

# Web Scraping & Automation
echo ""
echo "🕷️  Web Scraping & Automation..."
star_repo "scrapy/scrapy"
star_repo "cobrateam/splinter"
star_repo "microsoft/playwright-python"
star_repo "seleniumbase/SeleniumBase"

# Configuration Management
echo ""
echo "⚙️  Configuration Management..."
star_repo "theskumar/python-dotenv"
star_repo "rochacbruno/dynaconf"
star_repo "henriquebastos/python-decouple"
star_repo "omry/omegaconf"

# Logging & Monitoring
echo ""
echo "📝 Logging & Monitoring..."
star_repo "Delgan/loguru"
star_repo "hynek/structlog"
star_repo "getsentry/sentry-python"

# Date & Time
echo ""
echo "⏰ Date & Time..."
star_repo "arrow-py/arrow"
star_repo "sdispater/pendulum"
star_repo "dateutil/dateutil"

# Caching
echo ""
echo "💾 Caching..."
star_repo "python-cachier/cachier"
star_repo "tkem/cachetools"

# Template Engines
echo ""
echo "📄 Template Engines..."
star_repo "pallets/jinja"
star_repo "akesterson/dpath-python"

# Message Brokers & Streaming
echo ""
echo "📨 Message Brokers..."
star_repo "pika/pika"
star_repo "dpkp/kafka-python"
star_repo "python-amqp/amqp"

# Image Processing
echo ""
echo "🖼️  Image Processing..."
star_repo "python-pillow/Pillow"
star_repo "imageio/imageio"

# File Processing
echo ""
echo "📁 File Processing..."
star_repo "jazzband/tablib"
star_repo "wireservice/csvkit"

# Security & Cryptography
echo ""
echo "🔐 Security & Cryptography..."
star_repo "pyca/cryptography"
star_repo "paramiko/paramiko"
star_repo "Legrandin/pycryptodome"

# Documentation
echo ""
echo "📚 Documentation..."
star_repo "sphinx-doc/sphinx"
star_repo "mkdocs/mkdocs"
star_repo "squidfunk/mkdocs-material"

# Package Management
echo ""
echo "📦 Package Management..."
star_repo "pypa/pip"
star_repo "python-poetry/poetry"
star_repo "pypa/pipenv"
star_repo "pdm-project/pdm"
star_repo "astral-sh/uv"

# Build Tools
echo ""
echo "🔨 Build Tools..."
star_repo "pypa/setuptools"
star_repo "pypa/build"
star_repo "pypa/hatch"

# Project Templates & Cookiecutters
echo ""
echo "🍪 Project Templates..."
star_repo "cookiecutter/cookiecutter"
star_repo "audreyfeldroy/cookiecutter-pypackage"

# Learning Resources
echo ""
echo "📖 Learning Resources..."
star_repo "trekhleb/learn-python"
star_repo "Asabeneh/30-Days-Of-Python"
star_repo "practical-tutorials/project-based-learning"
star_repo "vinta/awesome-python"
star_repo "trananhkma/fucking-awesome-python"

# Python Applications - Well-Written Examples
echo ""
echo "💎 Well-Written Python Applications..."
star_repo "ansible/ansible"
star_repo "certbot/certbot"
star_repo "donnemartin/system-design-primer"
star_repo "yt-dlp/yt-dlp"
star_repo "pallets/werkzeug"
star_repo "tornadoweb/tornado"

# Best Practices & Standards
echo ""
echo "📐 Best Practices & Standards..."
star_repo "google/styleguide"
star_repo "python/peps"
star_repo "abiodunjames/Awesome-Clean-Code-Resources"

# Curated Lists
echo ""
echo "⭐ Curated Awesome Lists..."
star_repo "lukasmasuch/best-of-python"
star_repo "ml-tooling/best-of-ml-python"
star_repo "awesome-python/awesome-python-blogs"

# Python Internals & Advanced
echo ""
echo "🔬 Python Internals & Advanced..."
star_repo "satwikkansal/wtfpython"
star_repo "rasbt/python_reference"
star_repo "dabeaz-course/practical-python"

echo ""
echo "========================================================"
echo "✅ Done! All Python project repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - Clean Code & Best Practices: 6 repos"
echo "   - Web Frameworks: 8 repos"
echo "   - REST Framework & API: 5 repos"
echo "   - ORM & Database: 5 repos"
echo "   - HTTP & Networking: 5 repos"
echo "   - CLI Tools & Terminal UI: 8 repos"
echo "   - Async & Concurrency: 5 repos"
echo "   - Testing Frameworks: 7 repos"
echo "   - Code Quality & Linting: 9 repos"
echo "   - Data Science & ML: 7 repos"
echo "   - Data Validation: 4 repos"
echo "   - Task Queues: 4 repos"
echo "   - Algorithms & Data Structures: 3 repos"
echo "   - Design Patterns: 2 repos"
echo "   - Web Scraping: 4 repos"
echo "   - Configuration Management: 4 repos"
echo "   - Logging & Monitoring: 3 repos"
echo "   - Date & Time: 3 repos"
echo "   - Caching: 2 repos"
echo "   - Template Engines: 2 repos"
echo "   - Message Brokers: 3 repos"
echo "   - Image Processing: 2 repos"
echo "   - File Processing: 2 repos"
echo "   - Security & Cryptography: 3 repos"
echo "   - Documentation: 3 repos"
echo "   - Package Management: 5 repos"
echo "   - Build Tools: 3 repos"
echo "   - Project Templates: 2 repos"
echo "   - Learning Resources: 5 repos"
echo "   - Well-Written Applications: 6 repos"
echo "   - Best Practices: 3 repos"
echo "   - Curated Lists: 3 repos"
echo "   - Python Internals: 3 repos"
echo ""
echo "🎉 Total: ~140 Python project repositories starred!"
echo ""
echo "💡 These repositories feature:"
echo "   ✓ Clean, well-documented code"
echo "   ✓ Industry-standard architecture patterns"
echo "   ✓ Active maintenance & community"
echo "   ✓ Educational value for learning best practices"
