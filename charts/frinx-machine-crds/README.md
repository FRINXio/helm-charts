# frinx-machine-crds

FRINX Machine is a dockerized deployment of multiple elements. The FRINX Machine enables large scale automation of network devices, services and retrieval of operational state data from a network. User specific workflows are designed through the use of OpenConfig NETCONF & YANG models, vendor native models, and the CLI. The FRINX Machine uses dockerized containers that are designed and tested to work together to create a user specific solution. Further information is available on [docs.frinx.io](https://docs.frinx.io/frinx-machine/getting-started/).

## Prerequisites

* Kubernetes 1.19+
* Helm 3.2.0+

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-machine-crds
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-machine-crds
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Dependencies

| Chart | Documentation |
|-----------|-------------|
| `kube-arangodb` | [Github](https://github.com/arangodb/kube-arangodb) |
| `cloudnative-pg` | [ArtifactHub](https://artifacthub.io/packages/helm/cloudnative-pg/cloudnative-pg) |

