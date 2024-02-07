# frinx-grafana-configs

A Helm chart for Kubernetes deployment of the Frinx Grafana dashboards and datasources

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-grafana-configs
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-grafana-configs
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `assets.files` | Rexeg to select oauth2-proxy assets  | `config/*` |

