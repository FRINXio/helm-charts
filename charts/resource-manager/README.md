# resource-manager

A Helm chart for Kubernetes deploying of the Frinx Resource-Manager

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/resource-manager
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/resource-manager
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/resource-manager` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
| `imagePullSecrets` | Image pull secrets | `{}` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `""` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/resource-manager/values.yaml) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where service is exposed | `8888` |
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `3` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.image.tag` | Image tag | `"12.2"` |
| `postgresql.postgresql.username` | Name for a custom user to create | `postgresU` |
| `postgresql.postgresql.password` | Password for the custom user to create | `postgresP` |
| `postgresql.postgresql.database` | Name for a custom database to createe | `postgres` |
| `dbPersistence.POSTGRES_HOST` | Hostname of external database | |
| `dbPersistence.POSTGRES_PORT` | Port of external database | `5432` |
| `dbPersistence.POSTGRES_USERNAME` | Username for external database | `postgresU` |
| `dbPersistence.POSTGRES_PASSWORD` | Password for external database | `postgresP` |
| `dbPersistence.POSTGRES_DATABASE` | External database name | `postgres` |
| `env.RM_API_PORT` | Port for resource-manager | `8884` |
| `env.RM_LOG_PATH` | Log path | `/var/log/rm.log` |
| `env.RM_LOG_LEVEL` | Log level | `info` |
| `env.WASMER_MAX_TIMEOUT_MILLIS` | WASMER_MAX_TIMEOUT_MILLIS env value | `1000` |
| `extraEnv` | Additional env variables |  |
| `rbac.RM_ADMIN_ROLES` | Admin roles | `OWNER` |
| `rbac.RM_ADMIN_GROUPS` | Admin groups | `NETWORK-ADMIN` |