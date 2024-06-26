# inventory

A Helm chart for Kubernetes deployment of the Device Inventory

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/inventory
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/inventory
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/frinx-inventory-server` |
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
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/inventory/values.yaml) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where workflow-proxy is exposed | `8000` |
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.UNICONFIG_API_PROTOCOL` | UNICONFIG_API_PROTOCOL env value | `http` |
| `env.UNICONFIG_API_PORT` | UNICONFIG_API_PORT env value | `8181` |
| `env.UNICONFIG_LIST_URL` | UNICONFIG_LIST_URL env value | `http://krakend:8080/static/list/uniconfig` |
| `env.X_TENANT_ID` | X_TENANT_ID env value | `frinx` |
| `env.POSTGRES_USER` | POSTGRES_USER env value | `postgresU` |
| `env.POSTGRES_PASSWORD` | POSTGRES_PASSWORD env value | `postgresP` |
| `env.POSTGRES_DB` | POSTGRES_DB env value | `inventory` |
| `env.POSTGRES_DB_SCHEMA` | POSTGRES_DB_SCHEMA env value | `public` |
| `env.POSTGRES_HOSTNAME` | POSTGRES_HOSTNAME env value | |
| `env.POSTGRES_PORT` | POSTGRES_PORT env value | `5432` |
| `env.TOPOLOGY_ENABLED` | Enable/Disable connection to arangodb | `true` |
| `env.TOPOLOGY_DISCOVERY_API_URL` | TOPOLOGY_DISCOVERY_API_URL env variable | `http://topology-discovery:5000/api/data` |
| `env.TOPOLOGY_DISCOVERY_GRAPHQL_API_URL` | TOPOLOGY_DISCOVERY_GRAPHQL_API_URL env variable | `http://topology-discovery:5000/api/graphql` |
| `env.SHELL_HOST` | SHELL_HOST env value | `"uniconfig-controller"` |
| `extraEnv` | Additional env variables |  |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true` |
| `postgresql.auth.username` | Name for a custom user to create | `postgresU` |
| `postgresql.auth.password` | Password for the custom user to create | `postgresP` |
| `postgresql.auth.database` | Name for a custom database to create | `conductor` |
| `postgresql.architecture` | PostgreSQL architecture (`standalone` or `replication`) | `standalone` |
