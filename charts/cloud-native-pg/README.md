# cloud-native-pg

A Helm chart for creating postgres cluster via CloudNativePG operator

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.0.0](https://img.shields.io/badge/AppVersion-7.0.0-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/cloud-native-pg
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/cloud-native-pg
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity] Defines info about creating affinity rules for pods https://cloudnative-pg.io/documentation/1.18/api_reference/#AffinityConfiguration |
| backup | object | `{}` | [Backup] Cluster backup configuration https://cloudnative-pg.io/documentation/1.18/api_reference/#backupconfiguration |
| bootstrap | object | `{"initdb":{"database":"frinx","owner":"frinx","postInitApplicationSQL":[],"postInitApplicationSQLRefs":null,"postInitSQL":[],"postInitTemplateSQL":[]}}` | Bootstrap configuration of cluster |
| env | object | `{}` | Environmental variables configuration |
| envFrom | object | `{}` | Environmental variables passed from referenced objects |
| imageName | string | `"ghcr.io/cloudnative-pg/postgresql:12.18"` | Image repository with tag |
| imagePullPolicy | string | `"IfNotPresent"` | Image pull policy |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| instances | int | `2` | Number of instances |
| logLevel | string | `"info"` | Logging level configuration |
| monitoring | object | `{"enablePodMonitor":false}` | Podmonitor configuration |
| name | string | `nil` |  |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| postgresql | object | `{"parameters":{"max_connections":"300"}}` | [PostgresConfiguration] Defines the PostgreSQL configuration https://cloudnative-pg.io/documentation/1.18/api_reference/#postgresconfiguration |
| primaryUpdateMethod | string | `"switchover"` | Primary update method configuration |
| primaryUpdateStrategy | string | `"unsupervised"` | Primary update strategy configuration |
| replicationSlots | object | `{}` | [ReplicationSlots] Defines encapsulation of the configuration of replication slots |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| secrets | object | `{"postInitSqlSecret":null,"superuserSecret":{"existingSecret":null,"password":"postgres","username":"postgres"},"userSecret":{"existingSecret":null,"password":"frinx","username":"frinx"}}` | Secrets configuration |
| startDelay | int | `30` | Start delay configuration |
| stopDelay | int | `30` | Stop delay configuration |
| storage | object | `{"resizeInUseVolumes":true,"size":"1Gi"}` | [StorageConfiguration] Defines PostgreSQL instances storage configuration https://cloudnative-pg.io/documentation/1.18/api_reference/#storageconfiguration |

