#!/bin/bash

# Security, Cloud & API GitHub Repositories Star Script
# Based on LinkedIn profile: Cybersecurity, DevSecOps, Cloud (Azure/AWS), API Security

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

echo "🚀 Starting to star Security, Cloud & API repositories..."
echo "============================================================"
echo ""

# OWASP Security Tools
echo "🔒 OWASP Security Tools..."
star_repo "OWASP/owasp-mstg"
star_repo "OWASP/CheatSheetSeries"
star_repo "OWASP/Top10"
star_repo "OWASP/ASVS"
star_repo "OWASP/wstg"
star_repo "OWASP/Nettacker"
star_repo "OWASP/ASST"
star_repo "zaproxy/zaproxy"
star_repo "OWASP/Amass"
star_repo "OWASP/threat-dragon"
star_repo "OWASP/NodeGoat"
star_repo "OWASP/DevSecOpsGuideline"

# SAST (Static Application Security Testing)
echo ""
echo "🔍 SAST Tools..."
star_repo "github/codeql"
star_repo "github/codeql-action"
star_repo "semgrep/semgrep"
star_repo "SonarSource/sonarqube"
star_repo "checkmarx-ts/checkmarx-python-sdk"
star_repo "returntocorp/semgrep-rules"
star_repo "uber/piranha"
star_repo "trufflesecurity/trufflehog"
star_repo "gitleaks/gitleaks"

# DAST (Dynamic Application Security Testing)
echo ""
echo "🎯 DAST Tools..."
star_repo "StackHawk/hawkscan-action"
star_repo "zaproxy/zaproxy"
star_repo "projectdiscovery/nuclei"
star_repo "projectdiscovery/httpx"
star_repo "projectdiscovery/subfinder"
star_repo "OWASP/wapiti"

# Container & Image Security
echo ""
echo "📦 Container & Image Security..."
star_repo "aquasecurity/trivy"
star_repo "anchore/grype"
star_repo "anchore/syft"
star_repo "goodwithtech/dockle"
star_repo "aquasecurity/tfsec"
star_repo "bridgecrewio/checkov"
star_repo "tenable/terrascan"
star_repo "snyk/snyk"

# DevSecOps & CI/CD Security
echo ""
echo "🔐 DevSecOps & CI/CD Security..."
star_repo "GitGuardian/ggshield"
star_repo "aquasecurity/chain-bench"
star_repo "slsa-framework/slsa"
star_repo "sigstore/cosign"
star_repo "sigstore/rekor"
star_repo "in-toto/in-toto"

# Secrets Management
echo ""
echo "🔑 Secrets Management..."
star_repo "hashicorp/vault"
star_repo "mozilla/sops"
star_repo "bitnami-labs/sealed-secrets"
star_repo "external-secrets/external-secrets"
star_repo "aws/secrets-store-csi-driver-provider-aws"
star_repo "Azure/secrets-store-csi-driver-provider-azure"

# Cloud Security - AWS
echo ""
echo "☁️  Cloud Security - AWS..."
star_repo "aws/aws-cli"
star_repo "aws/aws-cdk"
star_repo "aws-samples/aws-security-reference-architecture-examples"
star_repo "prowler-cloud/prowler"
star_repo "toniblyx/prowler"
star_repo "aquasecurity/cloudsploit"
star_repo "nccgroup/ScoutSuite"
star_repo "RhinoSecurityLabs/pacu"
star_repo "salesforce/cloudsplaining"

# Cloud Security - Azure
echo ""
echo "☁️  Cloud Security - Azure..."
star_repo "Azure/azure-cli"
star_repo "Azure/azure-sdk-for-python"
star_repo "Azure/bicep"
star_repo "Azure/azure-policy"
star_repo "azsk/DevOpsKit"
star_repo "Azure/terraform-azurerm-caf"

# Infrastructure as Code (IaC)
echo ""
echo "🏗️  Infrastructure as Code..."
star_repo "hashicorp/terraform"
star_repo "terraform-linters/tflint"
star_repo "gruntwork-io/terratest"
star_repo "gruntwork-io/terragrunt"
star_repo "pulumi/pulumi"
star_repo "pulumi/pulumi-aws"
star_repo "pulumi/pulumi-azure"
star_repo "pulumi/pulumi-kubernetes"

# API Security & Management
echo ""
echo "🌐 API Gateways & Management..."
star_repo "Kong/kong"
star_repo "TykTechnologies/tyk"
star_repo "wso2/product-apim"
star_repo "apache/apisix"
star_repo "gravitee-io/gravitee-api-management"
star_repo "krakend/krakend-ce"

# API Security Tools
echo ""
echo "🔐 API Security Tools..."
star_repo "OWASP/API-Security"
star_repo "assetnote/kiterunner"
star_repo "projectdiscovery/katana"
star_repo "roottusk/vapi"
star_repo "cerberauth/vulnapi"
star_repo "wallarm/api-firewall"
star_repo "42Crunch/api-security-audit-action"

# Kubernetes Security
echo ""
echo "☸️  Kubernetes Security..."
star_repo "aquasecurity/kube-bench"
star_repo "aquasecurity/kube-hunter"
star_repo "controlplaneio/kubesec"
star_repo "armosec/kubescape"
star_repo "zegl/kube-score"
star_repo "kubernetes/kops"
star_repo "kubernetes-sigs/kustomize"

# Policy & Compliance
echo ""
echo "📜 Policy & Compliance..."
star_repo "open-policy-agent/opa"
star_repo "open-policy-agent/gatekeeper"
star_repo "kyverno/kyverno"
star_repo "falcosecurity/falco"
star_repo "aquasecurity/tracee"

# Cloud Native Security
echo ""
echo "🛡️  Cloud Native Security..."
star_repo "falcosecurity/falco"
star_repo "cilium/tetragon"
star_repo "deepfence/ThreatMapper"
star_repo "deepfence/SecretScanner"

# Penetration Testing & Red Team
echo ""
echo "🎯 Penetration Testing..."
star_repo "projectdiscovery/nuclei-templates"
star_repo "sqlmapproject/sqlmap"
star_repo "commixproject/commix"
star_repo "rapid7/metasploit-framework"
star_repo "carlospolop/PEASS-ng"
star_repo "bettercap/bettercap"

# Web Application Security
echo ""
echo "🌐 Web Application Security..."
star_repo "swisskyrepo/PayloadsAllTheThings"
star_repo "danielmiessler/SecLists"
star_repo "wireghoul/doona"
star_repo "EnableSecurity/wafw00f"

# Security Automation & Orchestration
echo ""
echo "🤖 Security Automation..."
star_repo "TheHive-Project/TheHive"
star_repo "MISP/MISP"
star_repo "demisto/content"
star_repo "Netflix/security_monkey"
star_repo "airbnb/streamalert"

# Monitoring & Threat Detection
echo ""
echo "👁️  Monitoring & Threat Detection..."
star_repo "ossec/ossec-hids"
star_repo "wazuh/wazuh"
star_repo "elastic/detection-rules"
star_repo "SigmaHQ/sigma"
star_repo "Neo23x0/sigma"

# Microsoft Security (Copilot for Security related)
echo ""
echo "🔷 Microsoft Security..."
star_repo "microsoft/Microsoft-365-Defender-Hunting-Queries"
star_repo "Azure/Azure-Sentinel"
star_repo "microsoft/WindowsDefenderATP-Hunting-Queries"
star_repo "Azure/Microsoft-Defender-for-Cloud"

# Service Mesh Security
echo ""
echo "🕸️  Service Mesh Security..."
star_repo "istio/istio"
star_repo "linkerd/linkerd2"
star_repo "servicemeshinterface/smi-spec"

# Cloud Cost Management (AWS Solutions Architect)
echo ""
echo "💰 Cloud Cost Management..."
star_repo "opencost/opencost"
star_repo "infracost/infracost"
star_repo "aws/aws-cost-explorer-report"

# Awesome Lists
echo ""
echo "⭐ Awesome Security Lists..."
star_repo "sbilly/awesome-security"
star_repo "qazbnm456/awesome-web-security"
star_repo "enaqx/awesome-pentest"
star_repo "Hack-with-Github/Awesome-Hacking"
star_repo "trimstray/the-book-of-secret-knowledge"
star_repo "jivoi/awesome-osint"

echo ""
echo "============================================================"
echo "✅ Done! All Security, Cloud & API repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - OWASP Security Tools: 12 repos"
echo "   - SAST Tools: 9 repos"
echo "   - DAST Tools: 6 repos"
echo "   - Container & Image Security: 8 repos"
echo "   - DevSecOps & CI/CD Security: 6 repos"
echo "   - Secrets Management: 6 repos"
echo "   - Cloud Security (AWS): 9 repos"
echo "   - Cloud Security (Azure): 6 repos"
echo "   - Infrastructure as Code: 8 repos"
echo "   - API Gateways & Management: 6 repos"
echo "   - API Security Tools: 7 repos"
echo "   - Kubernetes Security: 7 repos"
echo "   - Policy & Compliance: 5 repos"
echo "   - Cloud Native Security: 4 repos"
echo "   - Penetration Testing: 6 repos"
echo "   - Web Application Security: 4 repos"
echo "   - Security Automation: 5 repos"
echo "   - Monitoring & Threat Detection: 5 repos"
echo "   - Microsoft Security: 4 repos"
echo "   - Service Mesh Security: 3 repos"
echo "   - Cloud Cost Management: 3 repos"
echo "   - Awesome Security Lists: 6 repos"
echo ""
echo "🎉 Total: ~135 Security, Cloud & API repositories starred!"
