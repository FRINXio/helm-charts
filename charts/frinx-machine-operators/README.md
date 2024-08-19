# frinx-machine-operators

A Helm chart for installing operators and crds.

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-machine-operators
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-machine-operators
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://arangodb.github.io/kube-arangodb | kube-arangodb | 1.2.41 |
| https://cloudnative-pg.github.io/charts | cloudnative-pg | 0.21.5 |
| https://prometheus-community.github.io/helm-charts/ | prometheus-operator-crds | 13.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cloudnative-pg.enabled | bool | `true` | Enable cloudnative-pg |
| kube-arangodb.enabled | bool | `true` | Enable kube-arangodb |
| kube-arangodb.operator.args[0] | string | `"--deployment.feature.ephemeral-volumes=true"` | Additional arguments for the operator |
| kube-arangodb.operator.enableCRDManagement | bool | `true` | Enable CRD management for the operator |
| kube-arangodb.operator.replicaCount | int | `2` | Number of replicas for the operator |
| kube-arangodb.rbac.enabled | bool | `true` | Enable RBAC |
| kube-arangodb.rbac.extensions.acs | bool | `false` | Enable ACS extension |
| kube-arangodb.rbac.extensions.at | bool | `false` | Enable AT extension |
| kube-arangodb.rbac.extensions.monitoring | bool | `false` | Enable monitoring extension |
| prometheus-operator-crds.enabled | bool | `true` | Enable prometheus-operator-crds |
