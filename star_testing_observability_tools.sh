#!/bin/bash

# Testing & Observability Tools Star Script
# JMeter, Postman, Grafana, ELK Stack

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

echo "🚀 Starting to star Testing & Observability Tools repositories..."
echo "=================================================================="
echo ""

# Apache JMeter
echo "⚡ Apache JMeter (Performance Testing)..."
star_repo "apache/jmeter"
star_repo "justb4/jmeter-kubernetes"
star_repo "flood-io/jmeter"
star_repo "abstracta/jmeter-java-dsl"
star_repo "grafana/jmeter-to-k6"

# Postman
echo ""
echo "📮 Postman (API Development)..."
star_repo "postmanlabs/newman"
star_repo "postmanlabs/postman-code-generators"
star_repo "postmanlabs/postman-collection"
star_repo "postmanlabs/postman-runtime"
star_repo "postmanlabs/postman-docs"
star_repo "postmanlabs/openapi-to-postman"
star_repo "postmanlabs/postman-app-support"

echo "   Fetching Postman Labs repositories..."
postman_repos=$(gh api "orgs/postmanlabs/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null | head -20)

if [ -n "$postman_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$postman_repos"
    echo "   ✓ Starred $count repositories from postmanlabs"
else
    echo "   ⚠️  Could not fetch repositories from postmanlabs"
fi

# Grafana
echo ""
echo "📊 Grafana (Visualization & Observability)..."
echo "   Fetching Grafana repositories..."
grafana_repos=$(gh api "orgs/grafana/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -40)

if [ -n "$grafana_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$grafana_repos"
    echo "   ✓ Starred $count repositories from grafana"
else
    echo "   ⚠️  Could not fetch repositories from grafana"
fi

# Elastic (ELK Stack)
echo ""
echo "🔍 Elastic (ELK Stack - Elasticsearch, Logstash, Kibana)..."
echo "   Fetching Elastic repositories..."
elastic_repos=$(gh api "orgs/elastic/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$elastic_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$elastic_repos"
    echo "   ✓ Starred $count repositories from elastic"
else
    echo "   ⚠️  Could not fetch repositories from elastic"
fi

# Additional Observability Tools
echo ""
echo "🔭 Additional Observability Tools..."
star_repo "grafana/loki"
star_repo "grafana/tempo"
star_repo "grafana/mimir"
star_repo "grafana/k6"
star_repo "grafana/pyroscope"
star_repo "grafana/agent"
star_repo "grafana/grafana-operator"
star_repo "grafana/grafana-ansible-collection"

# ELK-related community tools
echo ""
echo "🛠️  ELK Community Tools..."
star_repo "elastic/elasticsearch"
star_repo "elastic/logstash"
star_repo "elastic/kibana"
star_repo "elastic/beats"
star_repo "elastic/apm-server"
star_repo "elastic/go-elasticsearch"
star_repo "elastic/elasticsearch-py"
star_repo "elastic/helm-charts"
star_repo "elastic/cloud-on-k8s"

# Performance Testing Tools
echo ""
echo "🚦 Performance Testing Tools..."
star_repo "locustio/locust"
star_repo "gatling/gatling"
star_repo "tsenart/vegeta"
star_repo "rakyll/hey"
star_repo "JoeDog/siege"
star_repo "giltene/wrk2"
star_repo "grafana/k6"
star_repo "flood-io/element"

# API Testing Tools
echo ""
echo "🧪 API Testing Tools..."
star_repo "Kong/insomnia"
star_repo "hoppscotch/hoppscotch"
star_repo "Orange-OpenSource/hurl"
star_repo "usebruno/bruno"
star_repo "httpie/httpie"
star_repo "rest-assured/rest-assured"

echo ""
echo "=================================================================="
echo "✅ Done! Testing & Observability Tools repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   ⚡ Apache JMeter (Performance Testing)"
echo "   📮 Postman Labs (API Development & Testing)"
echo "   📊 Grafana (Visualization & Observability)"
echo "   🔍 Elastic (ELK Stack - Elasticsearch, Logstash, Kibana)"
echo "   🔭 Grafana Ecosystem (Loki, Tempo, Mimir, k6, Pyroscope)"
echo "   🚦 Performance Testing (Locust, Gatling, Vegeta, Hey, Siege)"
echo "   🧪 API Testing (Insomnia, Hoppscotch, Bruno, HTTPie)"
echo ""
