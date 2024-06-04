# frinx-machine

FRINX Machine is a dockerized deployment of multiple elements. The FRINX Machine enables large scale automation of network devices, services and retrieval of operational state data from a network. 
User specific workflows are designed through the use of OpenConfig NETCONF & YANG models, vendor native models, and the CLI. 
The FRINX Machine uses dockerized containers that are designed and tested to work together to create a user specific solution. 
Further information is available on [docs.frinx.io](https://docs.frinx.io/frinx-machine/getting-started/).

## Prerequisites

* Kubernetes 1.19+
* Helm 3.2.0+

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Operators Chart

Before installing Frinx MACHINE, install required operators and crds

```console
helm install [RELEASE_NAME]-operators frinx/frinx-machine-operators
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-machine
```

To access UI, port-forward KrakenD service

```console
kubectl port-forward -n frinx svc/krakend 8080:8080
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-machine
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Uninstall Operators Chart

```console
helm uninstall [RELEASE_NAME]-operators
```

## Dependencies

| Chart | Documentation |
|-----------|-------------|
| `krakend` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/krakend) |
| `frinx-frontend` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/frinx-frontend) |
| `postgresql` | [ArtifactHub](https://artifacthub.io/packages/helm/bitnami/postgresql) |
| `resource-manager` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/resource-manager) |
| `workflow-manager` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/workflow-manager) |
| `inventory` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/inventory) |
| `uniconfig-postgresql` | [ArtifactHub](https://artifacthub.io/packages/helm/bitnami/postgresql) |
| `uniconfig` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/uniconfig) |
| `kube-arangodb` | [Github](https://github.com/arangodb/kube-arangodb) |
| `frinx-arango-config` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/frinx-arango-config) |
| `topology-discovery` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/topology-discovery) |
| `grafana` | [ArtifactHub](https://artifacthub.io/packages/helm/grafana/grafana) |
| `frinx-grafana-configs` | [ArtifactHub](https://artifacthub.io/packages/helm/frinx-helm-charts/frinx-grafana-configs) |
| `influxdb` | [ArtifactHub](https://artifacthub.io/packages/helm/influxdata/influxdb2) |
| `telegraf-ds` | [ArtifactHub](https://artifacthub.io/packages/helm/influxdata/telegraf-ds) |
| `loki` | [ArtifactHub](https://artifacthub.io/packages/helm/grafana/loki) |
| `promtail` | [ArtifactHub](https://artifacthub.io/packages/helm/grafana/promtail) |
| `cloudnative-pg` | [ArtifactHub](https://artifacthub.io/packages/helm/cloudnative-pg/cloudnative-pg) |
| `oauth2-proxy` | [ArtifactHub](https://artifacthub.io/packages/helm/oauth2-proxy/oauth2-proxy) |

## Requirements

| **Minimal hardware requirements for production** |                      |
|--------------------------------------------------|----------------------|
| Compute  (vCores)                                | 12                   |
| Memory (RAM)                                     | 32 GB                |
| Storage                                          | 300 GB               |

| **Minimal hardware requirements for development** |                      |
|---------------------------------------------------|----------------------|
| Compute  (vCores)                                 | 8                    |
| Memory (RAM)                                      | 24 GB                |
| Storage                                           | 100 GB               |

- minimum 12GB Memory(RAM) on worker node
- tested on nodes with Ubuntu

## Where to Purchase
For information regarding sales, visit [frinx.io](https://frinx.io/)
