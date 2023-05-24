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
| `initContainersUrl.UNICONFIG_URL_BASE` | UNICONFIG_URL_BASE env variable | `http://uniconfig:8181` |
| `initContainersUrl.CONDUCTOR_URL_BASE` | CONDUCTOR_URL_BASE env variable | `http://workflow-proxy:8080` |
| `initContainersUrl.INVENTORY_URL_BASE` | INVENTORY_URL_BASE env variable | `http://inventory:8000` |
| `env.X_TENANT_ID` | X_TENANT_ID env variable | `frinx` |
| `env.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `network-admin` |
| `env.UNICONFIG_URL_BASE` | UNICONFIG_URL_BASE env variable | `http://uniconfig:8181/rests` |
| `extraSecrets` | Option to add secrets into the pod in key: value form where key is name of secret and value is name of the secret object | |
| `fileSecrets` | Option to attach secrets as a file into the pod. Need to define secret name, env name and target path. [See example in values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/worker/values.yaml) | |
