#!/bin/bash

# Script to star Quality Engineering, Testing, and Database Conference repositories
# Created: 2025-11-16

echo "Starting to star Quality Engineering, Testing & Database repositories..."

# Array of repositories to star
repos=(
    # ========================================
    # Testing Awesome Lists & Resources - 10 repos
    # ========================================

    "atinfo/awesome-test-automation"
    "TheJambo/awesome-testing"
    "upgundecha/awesome-testing-courses"
    "ZoranPandovski/awesome-testing-tools"
    "ChristoWolf/awesome-testing-blogs"
    "AirtestProject/Poco"
    "maester365/maester"
    "reqnroll/Reqnroll"
    "atata-framework/atata"
    "qxf2/qxf2-page-object-model"

    # ========================================
    # Selenium - 10 repos
    # ========================================

    "SeleniumHQ/selenium"
    "SeleniumHQ/docker-selenium"
    "SeleniumHQ/selenium-ide"
    "SeleniumHQ/seleniumhq.github.io"
    "php-webdriver/php-webdriver"
    "bonigarcia/webdrivermanager"
    "tebeka/selenium"
    "vrtgs/thirtyfour"
    "cheezy/page-object"
    "titusfortner/webdrivers"

    # ========================================
    # Appium - 10 repos
    # ========================================

    "appium/appium"
    "appium/appium-desktop"
    "appium/python-client"
    "appium/appium-inspector"
    "appium/java-client"
    "appium/appium-xcuitest-driver"
    "appium/appium-uiautomator2-driver"
    "appium/appium-docker-android"
    "appium/appium-flutter-driver"
    "appium/dotnet-client"

    # ========================================
    # Cypress - 10 repos
    # ========================================

    "cypress-io/cypress"
    "cypress-io/cypress-realworld-app"
    "cypress-io/cypress-example-recipes"
    "cypress-io/github-action"
    "cypress-io/cypress-example-kitchensink"
    "cypress-io/cypress-docker-images"
    "cypress-io/cypress-documentation"
    "cypress-io/eslint-plugin-cypress"
    "cypress-io/testing-workshop-cypress"
    "testing-library/cypress-testing-library"

    # ========================================
    # Playwright (Microsoft) - 5 repos
    # ========================================

    "microsoft/playwright"
    "microsoft/playwright-python"
    "microsoft/playwright-dotnet"
    "microsoft/playwright-java"
    "microsoft/playwright-test"

    # ========================================
    # Testing Library - 10 repos
    # ========================================

    "testing-library/react-testing-library"
    "testing-library/react-hooks-testing-library"
    "testing-library/jest-dom"
    "testing-library/dom-testing-library"
    "testing-library/user-event"
    "testing-library/vue-testing-library"
    "testing-library/eslint-plugin-testing-library"
    "testing-library/testing-playground"
    "testing-library/angular-testing-library"
    "testing-library/cypress-testing-library"

    # ========================================
    # MongoDB - 15 repos
    # ========================================

    "mongodb/mongo"
    "mongodb/node-mongodb-native"
    "mongodb/mongo-go-driver"
    "mongodb/laravel-mongodb"
    "mongodb/mongo-python-driver"
    "mongodb/mongoid"
    "mongodb/mongo-csharp-driver"
    "mongodb/mongo-java-driver"
    "mongodb/motor"
    "mongodb/mongo-php-library"
    "mongodb/mongo-hadoop"
    "mongodb/mongo-rust-driver"
    "mongodb/mongo-ruby-driver"
    "mongodb/mongodb-kubernetes-operator"
    "mongodb/js-bson"

    # ========================================
    # PostgreSQL - 5 repos
    # ========================================

    "postgres/postgres"
    "postgres/pgweb"
    "postgres/pgarchives"
    "postgres/pgcommitfest"
    "timescale/timescaledb"

    # ========================================
    # Redis - 10 repos
    # ========================================

    "redis/redis"
    "redis/RedisDesktopManager"
    "redis/go-redis"
    "redis/node-redis"
    "redis/ioredis"
    "redis/redis-py"
    "redis/jedis"
    "redis/RedisInsight"
    "redis/hiredis"
    "redis/lettuce"

    # ========================================
    # MySQL - 10 repos
    # ========================================

    "mysql/mysql-server"
    "mysql/mysql-connector-j"
    "mysql/mysql-workbench"
    "mysql/mysql-connector-python"
    "mysql/mysql-operator"
    "mysql/mysql-sys"
    "mysql/mysql-connector-cpp"
    "mysql/mysql-proxy"
    "mysql/mysql-connector-net"
    "mysql/mysql-utilities"

    # ========================================
    # Elasticsearch & Elastic Stack - 10 repos
    # ========================================

    "elastic/elasticsearch"
    "elastic/kibana"
    "elastic/logstash"
    "elastic/beats"
    "elastic/eui"
    "elastic/go-elasticsearch"
    "elastic/elasticsearch-php"
    "elastic/elasticsearch-js"
    "elastic/elasticsearch-py"
    "elastic/elasticsearch-dsl-py"

    # ========================================
    # Apache Cassandra & ScyllaDB - 10 repos
    # ========================================

    "apache/cassandra"
    "apache/cassandra-gocql-driver"
    "apache/cassandra-spark-connector"
    "scylladb/scylladb"
    "scylladb/seastar"
    "scylladb/gocqlx"
    "scylladb/scylla-rust-driver"
    "scylladb/scylla-operator"
    "scylladb/scylla-monitoring"
    "scylladb/scylla-code-samples"

    # ========================================
    # DataStax - 10 repos
    # ========================================

    "datastax/jvector"
    "datastax/python-driver"
    "datastax/nodejs-driver"
    "datastax/csharp-driver"
    "datastax/php-driver"
    "datastax/cpp-driver"
    "datastax/cass-operator"
    "datastax/ruby-driver"
    "datastax/astra-assistants-api"
    "datastax/graph-book"

    # ========================================
    # CockroachDB - 10 repos
    # ========================================

    "cockroachdb/cockroach"
    "cockroachdb/pebble"
    "cockroachdb/errors"
    "cockroachdb/copyist"
    "cockroachdb/apd"
    "cockroachdb/swiss"
    "cockroachdb/cockroach-operator"
    "cockroachdb/docs"
    "cockroachdb/django-cockroachdb"
    "cockroachdb/cockroach-go"

    # ========================================
    # InfluxData (InfluxDB) - 10 repos
    # ========================================

    "influxdata/influxdb"
    "influxdata/telegraf"
    "influxdata/kapacitor"
    "influxdata/influxdb-python"
    "influxdata/chronograf"
    "influxdata/influxdb-java"
    "influxdata/influxdb-relay"
    "influxdata/flux"
    "influxdata/influxdb-client-python"
    "influxdata/influxdb-client-go"

    # ========================================
    # Neo4j - 10 repos
    # ========================================

    "neo4j/neo4j"
    "neo4j/NaLLM"
    "neo4j/neo4j-python-driver"
    "neo4j/neo4j-javascript-driver"
    "neo4j/neo4j-graphrag-python"
    "neo4j/neo4j-browser"
    "neo4j/graph-data-science"
    "neo4j/graphql"
    "neo4j/neo4j-go-driver"
    "neo4j/docker-neo4j"

    # ========================================
    # TimescaleDB & Other Time-Series - 10 repos
    # ========================================

    "timescale/timescaledb"
    "timescale/pgai"
    "timescale/pgvectorscale"
    "timescale/tsbs"
    "timescale/promscale"
    "timescale/tobs"
    "timescale/timescaledb-tune"
    "timescale/timescaledb-toolkit"
    "timescale/timescaledb-parallel-copy"
    "timescale/prometheus-postgresql-adapter"

    # ========================================
    # Couchbase - 10 repos
    # ========================================

    "couchbase/couchbase-lite-ios"
    "couchbase/forestdb"
    "couchbase/couchbase-lite-android"
    "couchbase/moss"
    "couchbase/geocouch"
    "couchbase/vellum"
    "couchbase/couchnode"
    "couchbase/sync_gateway"
    "couchbase/couchbase-lite-net"
    "couchbase/go-slab"

    # ========================================
    # YugabyteDB - 10 repos
    # ========================================

    "yugabyte/yugabyte-db"
    "yugabyte/yugabyte-operator"
    "yugabyte/yugastore"
    "yugabyte/yb-voyager"
    "yugabyte/charts"
    "yugabyte/yugabyte-k8s-operator"
    "yugabyte/yb-sample-apps"
    "yugabyte/tpcc"
    "yugabyte/terraform-aws-yugabyte"
    "yugabyte/yb-tools"
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
echo "  - Testing Awesome Lists: 10 repos"
echo "  - Selenium: 10 repos"
echo "  - Appium: 10 repos"
echo "  - Cypress: 10 repos"
echo "  - Playwright: 5 repos"
echo "  - Testing Library: 10 repos"
echo "  - MongoDB: 15 repos"
echo "  - PostgreSQL & TimescaleDB: 5 repos"
echo "  - Redis: 10 repos"
echo "  - MySQL: 10 repos"
echo "  - Elasticsearch: 10 repos"
echo "  - Cassandra & ScyllaDB: 10 repos"
echo "  - DataStax: 10 repos"
echo "  - CockroachDB: 10 repos"
echo "  - InfluxDB: 10 repos"
echo "  - Neo4j: 10 repos"
echo "  - TimescaleDB: 10 repos"
echo "  - Couchbase: 10 repos"
echo "  - YugabyteDB: 10 repos"
echo "========================================"
echo "Done!"
