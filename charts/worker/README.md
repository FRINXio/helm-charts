# worker

A Helm chart for uniflow worker

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/worker
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/worker
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/demo-workflows` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
| `imagePullSecrets` | Image pull secrets | `[]` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `""` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | `{}` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.UNICONFIG_HOSTNAME` | UNICONFIG_HOSTNAME env variable | `uniconfig` |
| `env.UNICONFIG_PORT` | UNICONFIG_PORT env variable | `8181` |
| `env.UNIFLOW_HOSTNAME` | UNIFLOW_HOSTNAME env variable | `workflow-proxy` |
| `env.UNIFLOW_PORT` | UNIFLOW_PORT env variable | `8088` |
| `env.CONDUCTOR_PORT` | CONDUCTOR_PORT env variable | `8080` |
| `env.INVENTORY_HOSTNAME` | INVENTORY_HOSTNAME env variable | `inventory` |
| `env.INVENTORY_PORT` | INVENTORY_PORT env variable | `8000` |
| `env.X_TENANT_ID` | X_TENANT_ID env variable | `frinx` |
| `env.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `network-admin` |
| `env.UNICONFIG_URL_BASE` | UNICONFIG_URL_BASE env variable | `https://uniconfig:8181/rests` |
