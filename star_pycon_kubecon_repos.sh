#!/bin/bash

# PyCon & KubeCon/CNCF Resources Star Script
# Conference materials, presentations, and CNCF projects

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

echo "🚀 Starting to star PyCon & KubeCon/CNCF repositories..."
echo "========================================================"
echo ""

# Python Software Foundation
echo "🐍 Python Software Foundation (PSF)..."
echo "   Fetching PSF repositories..."
psf_repos=$(gh api "orgs/psf/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null)

if [ -n "$psf_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$psf_repos"
    echo "   ✓ Starred $count repositories from PSF"
else
    echo "   ⚠️  Could not fetch repositories from psf"
fi

# PyCon Organization
echo ""
echo "🎤 PyCon Conference..."
echo "   Fetching PyCon repositories..."
pycon_repos=$(gh api "orgs/PyCon/repos?per_page=50" --jq '.[].full_name' 2>/dev/null)

if [ -n "$pycon_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$pycon_repos"
    echo "   ✓ Starred $count repositories from PyCon"
else
    echo "   ⚠️  Could not fetch repositories from PyCon"
fi

# Notable PyCon Tutorial Repositories
echo ""
echo "📚 PyCon Tutorial Materials..."
star_repo "rasbt/pycon2024"
star_repo "StefanUlbrich/PyCon2024"
star_repo "amyreese/pycon"

# Python India
echo ""
echo "🇮🇳 Python India..."
echo "   Fetching Python India repositories..."
pythonindia_repos=$(gh api "orgs/pythonindia/repos?per_page=30" --jq '.[].full_name' 2>/dev/null)

if [ -n "$pythonindia_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$pythonindia_repos"
    echo "   ✓ Starred $count repositories from Python India"
else
    echo "   ⚠️  Could not fetch repositories from pythonindia"
fi

# CNCF (Cloud Native Computing Foundation)
echo ""
echo "☁️  Cloud Native Computing Foundation (CNCF)..."
echo "   Fetching CNCF repositories..."
cncf_repos=$(gh api "orgs/cncf/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$cncf_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$cncf_repos"
    echo "   ✓ Starred $count top repositories from CNCF"
else
    echo "   ⚠️  Could not fetch repositories from cncf"
fi

# CNCF Graduated Projects
echo ""
echo "🎓 CNCF Graduated Projects..."

# Kubernetes
star_repo "kubernetes/kubernetes"
star_repo "kubernetes/minikube"
star_repo "kubernetes/dashboard"
star_repo "kubernetes/kubeadm"
star_repo "kubernetes/kops"
star_repo "kubernetes/kubectl"

# Prometheus
star_repo "prometheus/prometheus"
star_repo "prometheus/alertmanager"
star_repo "prometheus/node_exporter"
star_repo "prometheus/client_golang"
star_repo "prometheus/blackbox_exporter"

# Envoy
star_repo "envoyproxy/envoy"
star_repo "envoyproxy/gateway"
star_repo "envoyproxy/go-control-plane"

# CoreDNS
star_repo "coredns/coredns"

# containerd
star_repo "containerd/containerd"
star_repo "containerd/nerdctl"

# Fluentd
star_repo "fluent/fluentd"
star_repo "fluent/fluent-bit"

# Harbor
star_repo "goharbor/harbor"

# Helm
star_repo "helm/helm"
star_repo "helm/charts"

# Jaeger
star_repo "jaegertracing/jaeger"
star_repo "jaegertracing/jaeger-operator"

# Vitess
star_repo "vitessio/vitess"

# TUF (The Update Framework)
star_repo "theupdateframework/tuf"

# Argo
star_repo "argoproj/argo-workflows"
star_repo "argoproj/argo-cd"
star_repo "argoproj/argo-rollouts"
star_repo "argoproj/argo-events"

# Flux
star_repo "fluxcd/flux2"
star_repo "fluxcd/flagger"

# Linkerd
star_repo "linkerd/linkerd2"

# etcd
star_repo "etcd-io/etcd"

# Rook
star_repo "rook/rook"

# Vitess
star_repo "vitessio/vitess"

# CNCF Incubating Projects
echo ""
echo "🌱 CNCF Incubating Projects..."

# Cilium
star_repo "cilium/cilium"
star_repo "cilium/hubble"
star_repo "cilium/tetragon"

# Istio
star_repo "istio/istio"
star_repo "istio/proxy"

# Knative
star_repo "knative/serving"
star_repo "knative/eventing"

# Dapr
star_repo "dapr/dapr"

# KubeEdge
star_repo "kubeedge/kubeedge"

# Cert-Manager
star_repo "cert-manager/cert-manager"

# Crossplane
star_repo "crossplane/crossplane"

# Contour
star_repo "projectcontour/contour"

# Open Policy Agent (OPA)
star_repo "open-policy-agent/opa"
star_repo "open-policy-agent/gatekeeper"

# Falco
star_repo "falcosecurity/falco"

# Buildpacks
star_repo "buildpacks/pack"

# KubeVirt
star_repo "kubevirt/kubevirt"

# Longhorn
star_repo "longhorn/longhorn"

# NATS
star_repo "nats-io/nats-server"
star_repo "nats-io/nats.go"

# Notary
star_repo "notaryproject/notary"

# Operator Framework
star_repo "operator-framework/operator-sdk"
star_repo "operator-framework/operator-lifecycle-manager"

# Thanos
star_repo "thanos-io/thanos"

# Volcano
star_repo "volcano-sh/volcano"

# KubeVela
star_repo "kubevela/kubevela"

# Backstage
star_repo "backstage/backstage"

# Kyverno
star_repo "kyverno/kyverno"

# KubeCon Presentations
echo ""
echo "📊 KubeCon Presentations & Demos..."
star_repo "warmchang/KubeCon-CloudNativeCon-Europe-2019"
star_repo "warmchang/KubeCon-North-America-2018"

# CNCF Landscape
echo ""
echo "🗺️  CNCF Landscape & Documentation..."
star_repo "cncf/landscape"
star_repo "cncf/presentations"
star_repo "cncf/glossary"
star_repo "cncf/trailmap"

# CNCF TAG (Technical Advisory Groups)
echo ""
echo "🏷️  CNCF Technical Advisory Groups..."
star_repo "cncf/tag-security"
star_repo "cncf/tag-network"
star_repo "cncf/tag-storage"
star_repo "cncf/tag-app-delivery"
star_repo "cncf/tag-runtime"
star_repo "cncf/tag-observability"
star_repo "cncf/tag-contributor-strategy"

# Service Mesh Projects
echo ""
echo "🕸️  Service Mesh Projects..."
star_repo "servicemeshinterface/smi-spec"

# OpenTelemetry (already covered in observability but important for CNCF)
star_repo "open-telemetry/opentelemetry-collector"
star_repo "open-telemetry/opentelemetry-operator"

# Cloud Native Buildpacks
star_repo "buildpacks/lifecycle"

# Kubernetes SIGs (Special Interest Groups) - Important ones
echo ""
echo "🔬 Kubernetes SIGs..."
star_repo "kubernetes-sigs/kustomize"
star_repo "kubernetes-sigs/kind"
star_repo "kubernetes-sigs/cluster-api"
star_repo "kubernetes-sigs/external-dns"
star_repo "kubernetes-sigs/kubespray"
star_repo "kubernetes-sigs/metrics-server"
star_repo "kubernetes-sigs/gateway-api"

# CNCF Sandbox - Notable Projects
echo ""
echo "🧪 CNCF Sandbox (Notable Projects)..."
star_repo "kubescape/kubescape"
star_repo "pixie-io/pixie"
star_repo "openkruise/kruise"
star_repo "k3s-io/k3s"
star_repo "k8sgpt-ai/k8sgpt"
star_repo "paralus/paralus"

# Ray Summit / RayCon
echo ""
echo "🚀 Ray Summit & Anyscale..."
echo "   Fetching Anyscale repositories..."
anyscale_repos=$(gh api "orgs/anyscale/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null)

if [ -n "$anyscale_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$anyscale_repos"
    echo "   ✓ Starred $count repositories from Anyscale"
else
    echo "   ⚠️  Could not fetch repositories from anyscale"
fi

# Ray Project
echo "   Fetching Ray Project repositories..."
ray_repos=$(gh api "orgs/ray-project/repos?per_page=50&sort=stars" --jq '.[].full_name' 2>/dev/null | head -30)

if [ -n "$ray_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$ray_repos"
    echo "   ✓ Starred $count top repositories from ray-project"
else
    echo "   ⚠️  Could not fetch repositories from ray-project"
fi

# PyTorch Conference
echo ""
echo "🔥 PyTorch Conference & Community..."
echo "   Fetching PyTorch repositories..."
pytorch_repos=$(gh api "orgs/pytorch/repos?per_page=100&sort=stars" --jq '.[].full_name' 2>/dev/null | head -50)

if [ -n "$pytorch_repos" ]; then
    count=0
    while IFS= read -r repo; do
        star_repo "$repo"
        ((count++))
    done <<< "$pytorch_repos"
    echo "   ✓ Starred $count top repositories from PyTorch"
else
    echo "   ⚠️  Could not fetch repositories from pytorch"
fi

echo ""
echo "========================================================"
echo "✅ Done! PyCon, KubeCon/CNCF, Ray Summit & PyTorch repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Categories Covered:"
echo "   🐍 Python Software Foundation"
echo "   🎤 PyCon Conference & Tutorials"
echo "   🇮🇳 Python India Community"
echo "   ☁️  CNCF Organization"
echo "   🎓 CNCF Graduated Projects:"
echo "      • Kubernetes, Prometheus, Envoy, CoreDNS"
echo "      • containerd, Fluentd, Harbor, Helm"
echo "      • Jaeger, Vitess, TUF, Argo, Flux"
echo "      • Linkerd, etcd, Rook"
echo "   🌱 CNCF Incubating Projects:"
echo "      • Cilium, Istio, Knative, Dapr, KubeEdge"
echo "      • Cert-Manager, Crossplane, Contour, OPA"
echo "      • Falco, KubeVirt, Longhorn, NATS"
echo "      • Thanos, Volcano, KubeVela, Backstage, Kyverno"
echo "   📊 KubeCon Presentations"
echo "   🗺️  CNCF Landscape & Documentation"
echo "   🏷️  CNCF Technical Advisory Groups"
echo "   🕸️  Service Mesh & OpenTelemetry"
echo "   🔬 Kubernetes SIGs (Special Interest Groups)"
echo "   🧪 CNCF Sandbox Projects"
echo "   🚀 Ray Summit & Anyscale (Distributed AI/ML)"
echo "   🔥 PyTorch Conference & Community"
echo ""
