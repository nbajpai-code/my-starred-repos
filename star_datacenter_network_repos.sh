#!/bin/bash

# Data Center Network GitHub Repositories Star Script
# Focus on Cisco and general data center networking projects

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

echo "🚀 Starting to star Data Center Network repositories..."
echo "========================================================"
echo ""

# Cisco Official Organizations & Projects
echo "🔷 Cisco Official Projects..."
star_repo "datacenter/nexus9000"
star_repo "datacenter/ansible-recipes-for-aci"
star_repo "datacenter/iserver"
star_repo "datacenter/nexus-data-broker"
star_repo "datacenter/aci-tac-scripts"
star_repo "datacenter/terraform-aci-hyperfabric"
star_repo "datacenter/ansible-hyperfabric"
star_repo "datacenter/aci-monitoring-stack"
star_repo "datacenter/aci-k8s-visualiser"
star_repo "CiscoDevNet/data-center-development"
star_repo "CiscoDevNet/ansible-aci"
star_repo "CiscoDevNet/terraform-aci-fabric-deploy"
star_repo "CiscoDevNet/ACI-Learning-Labs"

# Cisco DevNet & Automation
echo ""
echo "🤖 Cisco DevNet & Automation..."
star_repo "CiscoDevNet/ansible-nd"
star_repo "CiscoDevNet/ansible-dcnm"
star_repo "CiscoDevNet/terraform-provider-aci"
star_repo "CiscoDevNet/terraform-provider-mso"
star_repo "CiscoDevNet/intersight-python"
star_repo "CiscoDevNet/pyaci"
star_repo "CiscoDevNet/cisco-network-puppet-module"
star_repo "CiscoDevNet/yang-explorer"
star_repo "CiscoDevNet/yang-suite"
star_repo "CiscoDevNet/nxos-ansible"

# Network Automation Frameworks
echo ""
echo "⚙️  Network Automation Frameworks..."
star_repo "napalm-automation/napalm"
star_repo "nornir-automation/nornir"
star_repo "ansible/ansible"
star_repo "netmiko/netmiko"
star_repo "networktocode/ntc-templates"
star_repo "networktocode/pyntc"
star_repo "networktocode/network-importer"

# Source of Truth & IPAM
echo ""
echo "📚 Network Source of Truth & IPAM..."
star_repo "nautobot/nautobot"
star_repo "nautobot/nautobot-ansible"
star_repo "nautobot/pynautobot"
star_repo "nautobot/nautobot-app-golden-config"
star_repo "netbox-community/netbox"
star_repo "netbox-community/netbox-docker"
star_repo "netbox-community/ansible_modules"
star_repo "netbox-community/devicetype-library"

# SDN & Network Virtualization
echo ""
echo "🌐 SDN & Network Virtualization..."
star_repo "freeflow/vpp"
star_repo "openvswitch/ovs"
star_repo "sonic-net/SONiC"
star_repo "openconfig/public"
star_repo "openconfig/gnmi"
star_repo "openconfig/featureprofiles"

# Container Networking
echo ""
echo "📦 Container & Cloud Networking..."
star_repo "containernetworking/cni"
star_repo "containernetworking/plugins"
star_repo "projectcalico/calico"
star_repo "antrea-io/antrea"
star_repo "flannel-io/flannel"
star_repo "weaveworks/weave"

# Network Testing & Validation
echo ""
echo "🧪 Network Testing & Validation..."
star_repo "networktocode/pytest-recode"
star_repo "batfish/batfish"
star_repo "batfish/pybatfish"
star_repo "networktocode/netutils"

# Cisco Open Source Contributions
echo ""
echo "🔓 Cisco Open Source Contributions..."
star_repo "cisco/openh264"
star_repo "cisco/ChezScheme"
star_repo "cisco/joy"
star_repo "cisco/mercury"
star_repo "cisco/mindmeld"

# Network to Code Community
echo ""
echo "👥 Network to Code Community..."
star_repo "networktocode/awesome-network-automation"
star_repo "networktocode/network-automation-forum"
star_repo "networktocode/circuit-maintenance-parser"
star_repo "networktocode/schema-enforcer"

# EVPN, VXLAN, and Fabric Automation
echo ""
echo "🏗️  EVPN, VXLAN & Fabric Automation..."
star_repo "aristanetworks/ansible-avd"
star_repo "aristanetworks/ansible-cvp"
star_repo "srl-labs/containerlab"

# Data Center OS & Switch OS
echo ""
echo "💻 Data Center & Switch OS..."
star_repo "Azure/SONiC"
star_repo "opencomputeproject/SAI"
star_repo "p4lang/p4c"
star_repo "p4lang/behavioral-model"

# Network Monitoring for DC
echo ""
echo "📊 Network Monitoring for Data Centers..."
star_repo "prometheus/snmp_exporter"
star_repo "prometheus-community/cisco_exporter"

# Awesome Lists
echo ""
echo "⭐ Awesome Lists..."
star_repo "networktocode/awesome-network-automation"
star_repo "osism/awesome-netbox"

echo ""
echo "========================================================"
echo "✅ Done! All Data Center Network repositories have been starred."
echo "🔗 View your stars at: https://github.com/nbajpai-code?tab=stars"
echo ""
echo "📊 Summary:"
echo "   - Cisco Official Projects: 13 repos"
echo "   - Cisco DevNet & Automation: 10 repos"
echo "   - Network Automation Frameworks: 7 repos"
echo "   - Source of Truth & IPAM: 8 repos"
echo "   - SDN & Network Virtualization: 6 repos"
echo "   - Container & Cloud Networking: 6 repos"
echo "   - Network Testing & Validation: 4 repos"
echo "   - Cisco Open Source: 5 repos"
echo "   - Network to Code Community: 4 repos"
echo "   - EVPN, VXLAN & Fabric: 3 repos"
echo "   - Data Center & Switch OS: 4 repos"
echo "   - Network Monitoring: 2 repos"
echo "   - Awesome Lists: 2 repos"
echo ""
echo "🎉 Total: ~74 Data Center Network repositories starred!"
