# frinx-frontend

A Helm chart for Kubernetes deployment of the Frinx UI

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-frontend
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-frontend
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/krakend` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `1.0.2` |
| `imagePullSecrets` | Image pull secrets | `{}` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `""` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/frinx-frontend/values.yaml#L31) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where service is exposed | `8888` |
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.AUTH_REDIRECT_SCHEME` | AUTH_REDIRECT_SCHEME env variable | `"http"` |
| `env.AUTH_ENABLED` | AUTH_ENABLED env variable | `false` |
| `env.URL_BASENAME` | URL_BASENAME env variable | `"/frinxui"` |
| `env.UNIFLOW_ENABLED` | UNIFLOW_ENABLED env variable | `true` |
| `env.CONDUCTOR_API_URL` | CONDUCTOR_API_URL env variable | `"/api/uniflow"` |
| `env.UNIFLOW_API_DOCS_URL` | UNIFLOW_API_DOCS_URL env variable | `"/api/uniflow/docs"` |
| `env.UNICONFIG_ENABLED` | UNICONFIG_ENABLED env variable | `true` |
| `env.UNICONFIG_API_DOCS_URL` | UNICONFIG_API_DOCS_URL env variable | `"/api/uniflow/docs-uniconfig"` |
| `env.INVENTORY_ENABLED` | INVENTORY_ENABLED env variable | `true` |
| `env.INVENTORY_API_URL` | INVENTORY_API_URL env variable | `"/api/inventory"` |
| `env.UNIRESOURCE_ENABLED` | UNIRESOURCE_ENABLED env variable | `true` |
| `env.UNIRESOURCE_API_URL` | UNIRESOURCE_API_URL env variable | `"/api/uniresource"` |
| `env.UNISTORE_API_URL` | UNISTORE_API_URL env variable | `"/api/unistore"` |
| `env.GAMMA_ENABLED` | GAMMA_ENABLED env variable | `false` |
| `env.AUTH_CLIENT_ID` | AUTH_CLIENT_ID env variable | `"frinx"` |
| `env.AUTH_REDIRECT_DOMAIN` | AUTH_REDIRECT_DOMAIN env variable | `localhost` |
| `env.MSAL_AUTHORITY` | MSAL_AUTHORITY env variable | `https://login.microsoftonline.com/common/` |
| `env.DEVICE_TOPOLOGY_ENABLED` | DEVICE_TOPOLOGY_ENABLED env variable | `false` |
