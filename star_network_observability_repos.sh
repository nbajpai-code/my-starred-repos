#!/bin/bash

# Network Observability GitHub Repositories Star Script
# This script will star all the top network observability repositories using GitHub CLI API

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

echo "🚀 Starting to star Network Observability repositories..."
echo "========================================================"
echo ""

# Observability Platforms & APM
echo "📊 Observability Platforms & APM..."
star_repo "netdata/netdata"
star_repo "SigNoz/signoz"
star_repo "grafana/grafana"
star_repo "uptrace/uptrace"
star_repo "openobserve/openobserve"
star_repo "apache/skywalking"

# Metrics & Time-Series Databases
echo ""
echo "📈 Metrics & Time-Series Databases..."
star_repo "prometheus/prometheus"
star_repo "VictoriaMetrics/VictoriaMetrics"
star_repo "grafana/mimir"
star_repo "thanos-io/thanos"
star_repo "cortexproject/cortex"
star_repo "influxdata/influxdb"
star_repo "timescale/timescaledb"

# Logging & Log Management
echo ""
echo "📝 Logging & Log Management..."
star_repo "grafana/loki"
star_repo "elastic/elasticsearch"
star_repo "elastic/logstash"
star_repo "elastic/kibana"
star_repo "fluent/fluentd"
star_repo "fluent/fluent-bit"
star_repo "vectordotdev/vector"

# Distributed Tracing
echo ""
echo "🔍 Distributed Tracing..."
star_repo "open-telemetry/opentelemetry-collector"
star_repo "open-telemetry/opentelemetry-go"
star_repo "open-telemetry/opentelemetry-python"
star_repo "open-telemetry/opentelemetry-js"
star_repo "jaegertracing/jaeger"
star_repo "openzipkin/zipkin"
star_repo "grafana/tempo"

# Network Monitoring & eBPF
echo ""
echo "🌐 Network Monitoring & eBPF..."
star_repo "cilium/cilium"
star_repo "cilium/hubble"
star_repo "pixie-io/pixie"
star_repo "iovisor/bcc"
star_repo "iovisor/bpftrace"
star_repo "libbpf/libbpf"
star_repo "cilium/ebpf"
star_repo "isovalent/cilium-grafana-observability-demo"

# Kubernetes Observability
echo ""
echo "☸️  Kubernetes Observability..."
star_repo "kubernetes/kube-state-metrics"
star_repo "prometheus-operator/prometheus-operator"
star_repo "kubernetes-sigs/metrics-server"
star_repo "kubeshark/kubeshark"
star_repo "groundcover-com/caretta"

# Alerting & Incident Management
echo ""
echo "🚨 Alerting & Incident Management..."
star_repo "prometheus/alertmanager"
star_repo "grafana/oncall"
star_repo "apache/flink"

# Visualization & Dashboards
echo ""
echo "📉 Visualization & Dashboards..."
star_repo "grafana/grafana"
star_repo "metabase/metabase"
star_repo "apache/superset"

# Service Mesh Observability
echo ""
echo "🕸️  Service Mesh Observability..."
star_repo "istio/istio"
star_repo "linkerd/linkerd2"
star_repo "kiali/kiali"

# Synthetic Monitoring & Testing
echo ""
echo "🧪 Synthetic Monitoring & Testing..."
star_repo "grafana/k6"
star_repo "gatling/gatling"
star_repo "locustio/locust"

# Profiling & Performance
echo ""
echo "⚡ Profiling & Performance..."
star_repo "grafana/pyroscope"
star_repo "google/pprof"
star_repo "brendangregg/FlameGraph"

# Kentik Open Source Projects
echo ""
echo "🔬 Kentik Labs Projects..."
star_repo "kentik/ktranslate"
star_repo "kentik/convis"

# Awesome Lists & Resources
echo ""
echo "⭐ Awesome Lists & Resources..."
star_repo "adriannovegil/awesome-observability"
star_repo "crazy-canux/awesome-monitoring"
star_repo "substrate-system/observability"

# Cloud Native Computing Foundation (CNCF) Projects
echo ""
echo "☁️  CNCF Observability Projects..."
star_repo "open-telemetry/opentelemetry-specification"
star_repo "open-telemetry/opentelemetry-demo"
star_repo "OpenObservability/OpenMetrics"

# Additional Notable Tools
echo ""
echo "🛠️  Additional Notable Tools..."
star_repo "Netflix/atlas"
star_repo "Netflix/vector"
star_repo "statsd/statsd"
star_repo "etsy/statsd"
star_repo "collectd/collectd"
star_repo "telegraf/telegraf"
star_repo "influxdata/telegraf"

echo ""
echo "========================================================"
echo "✅ Done! All network observability repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - Observability Platforms & APM: 6 repos"
echo "   - Metrics & Time-Series DBs: 7 repos"
echo "   - Logging & Log Management: 7 repos"
echo "   - Distributed Tracing: 7 repos"
echo "   - Network Monitoring & eBPF: 8 repos"
echo "   - Kubernetes Observability: 5 repos"
echo "   - Alerting & Incident Management: 3 repos"
echo "   - Visualization: 3 repos"
echo "   - Service Mesh: 3 repos"
echo "   - Synthetic Monitoring: 3 repos"
echo "   - Profiling & Performance: 3 repos"
echo "   - Kentik Labs: 2 repos"
echo "   - Awesome Lists: 3 repos"
echo "   - CNCF Projects: 3 repos"
echo "   - Additional Tools: 7 repos"
echo ""
echo "🎉 Total: ~70 network observability repositories starred!"
