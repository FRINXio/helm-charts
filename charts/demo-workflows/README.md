# demo-workflows

A Helm chart for the Frinx Machine demo workflows

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

## Prerequisites

* Kubernetes 1.27+
* Helm 3.2.0+

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/demo-workflows
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/demo-workflows
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://FRINXio.github.io/helm-charts | sample-topology | 3.1.0 |
| https://FRINXio.github.io/helm-charts | frinx-demo-workflows(worker) | 4.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| frinx-demo-workflows | object | `{"env":{"X_AUTH_USER_GROUP":"FRINXio"}}` | Configure [Worker](https://artifacthub.io/packages/helm/frinx-helm-charts/worker) |
| sample-topology | object | `{"devices":{}}` | Configure [Sample-Topology](https://artifacthub.io/packages/helm/frinx-helm-charts/sample-topology) |
| x-frinx-rbac-admin-role | string | `"FRINXio"` | Global anchor for RBAC setting |

