# frinx-machine

FRINX Machine is a dockerized deployment of multiple elements. The FRINX Machine enables large scale automation of network devices, services and retrieval of operational state data from a network.
User specific workflows are designed through the use of OpenConfig NETCONF & YANG models, vendor native models, and the CLI.
The FRINX Machine uses dockerized containers that are designed and tested to work together to create a user specific solution.
Further information is available on [docs.frinx.io](https://docs.frinx.io/frinx-machine/getting-started/).

![Version: 11.0.0](https://img.shields.io/badge/Version-11.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.0.0](https://img.shields.io/badge/AppVersion-7.0.0-informational?style=flat-square)

## Prerequisites

* Kubernetes 1.28+
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

## Uninstall Operators CRDs

```
kubectl delete -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.23/releases/cnpg-1.23.2.yaml
kubectl delete -f https://raw.githubusercontent.com/arangodb/kube-arangodb/1.2.41/manifests/arango-crd.yaml
```

## UI access

To access UI, use krakend-nginx ingress hostname for KrakenD service and visit Frinx Machine page in your browser on `https://krakend.127.0.0.1.nip.io/frinxui`
Frinx Machine can be deployed with Oauth2-Proxy. Example of configuration can be found in values.yaml.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://FRINXio.github.io/helm-charts | timescale-db(cloud-native-pg) | 1.0.0 |
| https://FRINXio.github.io/helm-charts | workflow-manager-postgres(cloud-native-pg) | 1.0.0 |
| https://FRINXio.github.io/helm-charts | uniconfig-postgres(cloud-native-pg) | 1.0.0 |
| https://FRINXio.github.io/helm-charts | frinx-arango-config | 4.2.0 |
| https://FRINXio.github.io/helm-charts | frinx-frontend | 4.1.0 |
| https://FRINXio.github.io/helm-charts | frinx-machine-monitoring | 0.1.2 |
| https://FRINXio.github.io/helm-charts | frinx-machine-operators | 0.3.0 |
| https://FRINXio.github.io/helm-charts | inventory | 6.0.2 |
| https://FRINXio.github.io/helm-charts | krakend | 5.0.2 |
| https://FRINXio.github.io/helm-charts | performance-monitor | 2.0.0 |
| https://FRINXio.github.io/helm-charts | resource-manager | 2.3.1 |
| https://FRINXio.github.io/helm-charts | swagger-ui | 0.2.0 |
| https://FRINXio.github.io/helm-charts | topology-discovery | 4.0.0 |
| https://FRINXio.github.io/helm-charts | uniconfig | 8.2.2 |
| https://FRINXio.github.io/helm-charts | device-induction(worker) | 4.1.0 |
| https://FRINXio.github.io/helm-charts | workflow-manager | 3.2.1 |
| https://charts.bitnami.com/bitnami | kafka | 25.2.0 |
| https://oauth2-proxy.github.io/manifests | oauth2-proxy | 7.7.23 |
| https://traefik.github.io/charts | uc-zone-lb(traefik) | 27.0.2 |

## Hardware requirements

| **Minimal hardware requirements for production** |                      |
|--------------------------------------------------|----------------------|
| Compute  (vCores)                                | 16                   |
| Memory (RAM)                                     | 40 GB                |
| Storage                                          | 300 GB               |

| **Minimal hardware requirements for development** |                      |
|---------------------------------------------------|----------------------|
| Compute  (vCores)                                 | 12                   |
| Memory (RAM)                                      | 24 GB                |
| Storage                                           | 100 GB               |

- minimum 12GB Memory(RAM) on worker node
- tested on nodes with Ubuntu

## Where to Purchase
For information regarding sales, visit [frinx.io](https://frinx.io/)

## Troubleshooting

### User limit of inotify watches reached
The error "User limit of inotify watches reached" typically occurs when the system has reached its limit on the number of inotify watches that can be created.
To solve this issue, increase the limit of inotify watches.
