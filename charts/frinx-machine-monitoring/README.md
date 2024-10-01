# frinx-machine-monitoring

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes monitoring

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-machine-monitoring
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-machine-monitoring
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| FRINX | <services@frinx.io> | <https://frinx.io> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://grafana.github.io/helm-charts | loki | 2.16.0 |
| https://grafana.github.io/helm-charts | promtail | 6.15.5 |
| https://prometheus-community.github.io/helm-charts/ | kube-prometheus-stack | 60.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| kube-prometheus-stack | object | `{"crds":{"enabled":false},"enabled":true,"fullnameOverride":"kube-prometheus-stack","grafana":{"additionalDataSources":[{"access":"proxy","name":"Loki","type":"loki","url":"http://loki:3100"}],"adminPassword":"frinx123!","adminUser":"frinx","enabled":true,"fullnameOverride":"grafana","sidecar":{"dashboards":{"folder":"/tmp/dashboards/Frinx-Machine","folderAnnotation":"grafana_folder","provider":{"allowUiUpdates":true,"foldersFromFilesStructure":true}}}},"kube-state-metrics":{"fullnameOverride":"prometheus-kube-state-metrics"},"nodeExporter":{"operatingSystems":{"darwin":{"enabled":false}}},"prometheus":{"fullnameOverride":"prometheus","prometheusSpec":{"podMonitorSelector":{"matchExpressions":[{"key":"cnpg.io/cluster","operator":"In","values":["uniconfig-postgresql","postgresql"]}]},"serviceMonitorSelector":{"matchExpressions":[{"key":"app.kubernetes.io/instance","operator":"In","values":["{{ $.Release.Name }}","uniconfig","workflow-manager","resource-manager","oauth2-proxy"]}]}}},"prometheus-node-exporter":{"fullnameOverride":"prometheus-node-exporter"}}` | Kube-prometheus-stack configuration |
| kube-prometheus-stack.crds | object | `{"enabled":false}` | CRDs for kube-prometheus-stack to be pulled and installed |
| kube-prometheus-stack.grafana | object | `{"additionalDataSources":[{"access":"proxy","name":"Loki","type":"loki","url":"http://loki:3100"}],"adminPassword":"frinx123!","adminUser":"frinx","enabled":true,"fullnameOverride":"grafana","sidecar":{"dashboards":{"folder":"/tmp/dashboards/Frinx-Machine","folderAnnotation":"grafana_folder","provider":{"allowUiUpdates":true,"foldersFromFilesStructure":true}}}}` | Configure Grafana for visualisation |
| kube-prometheus-stack.grafana.additionalDataSources | list | `[{"access":"proxy","name":"Loki","type":"loki","url":"http://loki:3100"}]` | Grafana additional datasource configurations Prometheus is defaultly set |
| kube-prometheus-stack.grafana.sidecar | object | `{"dashboards":{"folder":"/tmp/dashboards/Frinx-Machine","folderAnnotation":"grafana_folder","provider":{"allowUiUpdates":true,"foldersFromFilesStructure":true}}}` | Grafana sidecar configurations |
| kube-prometheus-stack.grafana.sidecar.dashboards.folder | string | `"/tmp/dashboards/Frinx-Machine"` | Folder name for storing created and imported dashboards |
| kube-prometheus-stack.grafana.sidecar.dashboards.folderAnnotation | string | `"grafana_folder"` | ConfigMap folder annotation for dashboard recognition |
| kube-prometheus-stack.grafana.sidecar.dashboards.provider | object | `{"allowUiUpdates":true,"foldersFromFilesStructure":true}` | Provider settings |
| kube-prometheus-stack.nodeExporter | object | `{"operatingSystems":{"darwin":{"enabled":false}}}` | NodeExporter deployment configuration |
| kube-prometheus-stack.prometheus | object | `{"fullnameOverride":"prometheus","prometheusSpec":{"podMonitorSelector":{"matchExpressions":[{"key":"cnpg.io/cluster","operator":"In","values":["uniconfig-postgresql","postgresql"]}]},"serviceMonitorSelector":{"matchExpressions":[{"key":"app.kubernetes.io/instance","operator":"In","values":["{{ $.Release.Name }}","uniconfig","workflow-manager","resource-manager","oauth2-proxy"]}]}}}` | Prometheus Operator configuration |
| kube-prometheus-stack.prometheus.prometheusSpec.podMonitorSelector | object | `{"matchExpressions":[{"key":"cnpg.io/cluster","operator":"In","values":["uniconfig-postgresql","postgresql"]}]}` | Selection of pod monitors to be discovered and scraped by Prometheus |
| kube-prometheus-stack.prometheus.prometheusSpec.serviceMonitorSelector | object | `{"matchExpressions":[{"key":"app.kubernetes.io/instance","operator":"In","values":["{{ $.Release.Name }}","uniconfig","workflow-manager","resource-manager","oauth2-proxy"]}]}` | Selection of service monitors to be discovered and scraped by Prometheus |
| loki | object | `{"enabled":true,"fullnameOverride":"loki","loki":{"config":"chunk_store_config:\n  max_look_back_period: 24h\ntable_manager:\n  retention_deletes_enabled: false\n  retention_period: 24h\n"}}` | Loki configurations |
| promtail | object | `{"config":{"clients":[{"url":"http://loki:3100/loki/api/v1/push"}],"snippets":{"pipelineStages":[{"match":{"selector":"{container=\"uniconfig\"}","stages":[{"cri":{}},{"docker":{}},{"multiline":{"firstline":"^\\d{4}-\\d{1,2}-\\d{1,2} \\d{1,2}:\\d{2}:\\d{2}.\\d{3}","max_lines":128,"max_wait_time":"3s"}},{"regex":{"expression":".*DeviceName:(?P<deviceName>[^\\t\\n\\f\\r ]+)"}},{"labels":{"deviceName":null}}]}}]}},"fullnameOverride":"promtail"}` | Promtail configurations |

