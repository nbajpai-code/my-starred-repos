# 🌐 Networking & Observability

[← Back to Main](README.md)

## Network Observability (~69 repos)

| Layer | Tools | Count |
|-------|-------|-------|
| **Platforms** | Netdata, SigNoz, Grafana, Uptrace, OpenObserve | 6 |
| **Metrics** | Prometheus, VictoriaMetrics, Mimir, Thanos, InfluxDB | 7 |
| **Logging** | Loki, Elasticsearch, Fluentd, Fluent Bit, Vector | 7 |
| **Tracing** | OpenTelemetry, Jaeger, Zipkin, Tempo | 7 |
| **eBPF Monitoring** | Cilium, Hubble, Pixie, BCC, bpftrace | 8 |
| **K8s Observability** | kube-state-metrics, Prometheus Operator, Kubeshark | 5 |

## Data Center Networking (~62 repos)

### Cisco DxNetOps & SDN

- **Cisco Official:** Nexus9000, ACI, Intersight, NX-OS automation
- **Network Automation:** NAPALM, Nornir, Netmiko, Ansible
- **Source of Truth:** Nautobot, NetBox, DeviceType Library
- **SDN:** SONiC, OpenConfig, VPP

### Container Networking

```
Calico | Cilium | Antrea | Flannel | Weave | CNI Plugins
```

## ScienceLogic Observability (~20 repos)

**ScienceLogic Organization** (github.com/ScienceLogic)
- **otel-components** - ScienceLogic's OpenTelemetry Components (Go, Apache-2.0, Updated Dec 2024)
- **stackconfig** - Render, merge and validate docker-compose files for deploying docker stacks (Python)
- Infrastructure tools and adapters (lua-resty-session, dex, Casbin adapters)

**Commercial Platform:**
- Skylar Automated RCA - AI observability solution
- ScienceLogic AI Platform - Combines monitoring and observability with unsupervised AI

## Cisco Network Observability Stack (~225 repos)

### Cisco Open (~98 repos)

- **OpenTelemetry:** otel-js, otel-java, otel-py, otel-dotnet, otel-webserver-module
- **FSO Tools:** terraform-provider-observability, fsoc, fso-dashboard-examples
- **AppDynamics:** appd-client-go, terraform-provider-appd, appdynamics-k8s-webhook-instrumentor
- **ThousandEyes:** ansible-role-thousandeyes-enterprise-agent-linux
- **Network:** jalapeno, gnmi-client-examples, network-sketcher

### Model-Driven Telemetry (4 repos)

| Platform | Repository | Description |
|----------|------------|-------------|
| **IOS XE** | cisco-ios-xe-mdt | YANG-based MDT for IOS XE |
| **IOS XR** | model-driven-telemetry | IOS XR telemetry protos |
| **NX-OS** | nx-telemetry-proto | NX-OS GPB/gRPC telemetry |
| **Multi-Platform** | network-programmability-stream | MDT examples |

### Cisco Innovation Edge (~59 repos)

- **Telemetry:** bigmuddy-network-telemetry-pipeline, pipeline-gnmi, cisco-mdt-python
- **gRPC/gNMI:** ios-xr-grpc-python, cisco-gnmi-python, gnmi, gnmitest
- **Network Tools:** awesome-network-programmability, telemetry_stacks
- **Protocols:** cisco-proto, nx-telemetry-proto, yang-json-validator

### DNA Center (8 repos)

```
awesome-cisco-dnac | DNAC-Top5 | DNAC-AURA | DNA_Analyzer
dnacenter_git_integrations | import-dnac-nso
```

### Cisco Public Sector (~48 repos)

- **Network Automation:** ansible-viptela, viptela-ops, ansible-meraki
- **Observability:** cisco-splunk-mdt, grafana
- **Security:** cisco-cyber-vision, cybervisionapi

### Network Programmability

- **pyATS/Genie:** CiscoTestAutomation/pyats, genieparser
- **YANG Models:** YangModels/yang, openconfig/public

**Cisco FSO Components:**
- ✅ **ThousandEyes** - Network performance monitoring
- ✅ **AppDynamics** - APM (Splunk Observability family)
- ✅ **Intersight** - Infrastructure management
- ✅ **Model-Driven Telemetry** - Streaming telemetry (IOS XE/XR, NX-OS)
- ✅ **DNA Center** - Network automation & analytics
- ✅ **NSO** - Service orchestration

## Networking Protocols

See [PROTOCOLS.md](PROTOCOLS.md) for detailed information on routing protocols and network infrastructure.
