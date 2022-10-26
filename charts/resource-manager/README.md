# uniresource

A Helm chart for Kubernetes deploying of the Frinx Uniresource

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/uniresource
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/uniresource
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
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/uniresource/values.yaml) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where service is exposed | `8888` |
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
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
| `postgresql.postgresql.username` | Name for a custom user to create | `postgres` |
| `postgresql.postgresql.password` | Password for the custom user to create | `postgres` |
| `postgresql.postgresql.database` | Name for a custom database to createe | `postgres` |
| `env.PSQL_USERNAME` | Username for external database | `postgres` |
| `env.PSQL_PASSWORD` | Password for external database | `postgres` |
| `env.PSQL_HOSTNAME` | Hostname of external database | |
| `env.PSQL_CREDENTIAL_SECRET` | Secrets with credentials for external database | `""` |
| `env.PSQL_PORT` | Port of external database | `5432` |
| `env.RM_API_PORT` | Port for uniresource | `8884` |
| `env.RM_ADMIN_ROLES` | Admin roles | `OWNER` |
| `env.RM_ADMIN_GROUPS` | Admin groups | `NETWORK-ADMIN` |
| `env.RM_LOG_PATH` | Log path | `/var/log/rm.log` |
| `env.RM_LOG_LEVEL` | Log level | `info` |
| `env.WASMER_MAX_TIMEOUT_MILLIS` | WASMER_MAX_TIMEOUT_MILLIS env value | `1000` |
| `env.RM_DB_CONNECTION_STRING` | Connection string for connection to external database | `"postgres://$(PSQL_USERNAME):$(PSQL_PASSWORD)@$(PSQL_HOSTNAME):$(PSQL_PORT)/postgres?sslmode=disable"` |
