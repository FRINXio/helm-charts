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
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits for frontend | `{}` |
| `proxyResources` | CPU/Memory resource requests/limits for proxy | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.AUTH_ENABLED` | AUTH_ENABLED env variable | `false` |
| `env.PERFORMANCE_MONITORING_ENABLED` | PERFORMANCE_MONITORING_ENABLED env variable | `false` |
| `env.URL_BASENAME` | URL_BASENAME env variable | `"/frinxui"` |
| `env.WORKFLOW_MANAGER_API_URL` | CONDUCTOR_API_URL env variable | `"/api/workflow"` |
| `env.RESOURCE_MANAGER_API_URL` | RESOURCE_MANAGER_API_URL env variable | `"/api/proxy"` |
| `env.UNISTORE_API_URL` | UNISTORE_API_URL env variable | `"/api/unistore"` |
| `env.INVENTORY_API_URL` | INVENTORY_API_URL env variable | `"/api/proxy"` |
| `env.INVENTORY_WS_PATH` | INVENTORY_WS_PATH env variable | `"/api/proxy"` |
| `env.INVENTORY_WS_SCHEMA` | INVENTORY_WS_SCHEMA env variable | `"wss://"` |
| `env.UNICONFIG_API_DOCS_URL` | UNICONFIG_API_DOCS_URL env variable | `"/api/workflow/docs-uniconfig"` |
| `env.WORKFLOW_MANAGER_API_DOCS_URL` | WORKFLOW_MANAGER_API_DOCS_URLgitk env variable | `"/api/workflow/docs"` |
| `env.RESOURCE_MANAGER_API_DOCS_URL` | RESOURCE_MANAGER_API_DOCS_URL env variable | `"/api/resource"` |
| `env.SCHELLAR_API_DOCS_URL` | SCHELLAR_API_DOCS_URL env variable | `"/api/schedule"` |
| `env.PERFORMANCE_MONITOR_API_DOCS_URL` | PERFORMANCE_MONITOR_API_DOCS_URL env variable | `"/api/performance"` |
| `env.TOPOLOGY_DISCOVERY_API_DOCS_URL` | TOPOLOGY_DISCOVERY_API_DOCS_URL env variable | `"/api/topology"` |
| `proxyEnv.CONDUCTOR_URL` | CONDUCTOR_URL proxyEnv variable | `http://conductor-server:8080` |
| `proxyEnv.SCHELLAR_URL` | SCHELLAR_URL proxyEnv variable | `http://conductor-server:3000/query` |
| `proxyEnv.INVENTORY_URL` | INVENTORY_URL proxyEnv variable | `http://inventory:8000/graphql` |
| `proxyEnv.WS_INVENTORY_URL` | WS_INVENTORY_URL proxyEnv variable | `ws://inventory:8000/graphql` |
| `proxyEnv.RESOURCE_MANAGER_URL` | RESOURCE_MANAGER_URL proxyEnv variable | `http://resource-manager:8884/query` |
