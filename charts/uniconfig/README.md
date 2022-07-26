# uniconfig

A Helm chart for UniConfig Kubernetes deployment

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/uniconfig
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/uniconfig
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/uniconfig` |
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
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/uniconfig/values.yaml) |
| `service.annotations` | Annotations for service resource | `{}` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port of service | `8181` |
| `ingress.enabled` | Enables Ingress | `true` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.path` | Path for service  | `/` |
| `ingress.pathType` | Path type variable | `Prefix` |
| `ingress.host` | Host variable | |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `license` | License for uniconfig | |
| `mountPath` | Mount path for uniconfig config files | |
| `uniconfigCacheFolderPath` | Path to uniconfig cache folder | `""` |
| `serviceName` | serviceName env variable | `"uniconfig"` |
| `tls_keystorePassword` | tls_keystorePassword env variable | `"password"` |
| `proxy.enabled` | Enable proxy for uniconfig  | `false` |
| `proxy.http_proxy` | Http address for proxy | `false` |
| `proxy.https_proxy` | Https address for proxy | `false` |
| `java.max_mem` | Max memory for java | `"10G"` |
| `dbPersistence.enabled` | Database persistence | `true` |
| `dbPersistence.connection_dbName` | Database name | `"uniconfig"` |
| `dbPersistence.connection_username` | Database username | `"postgresU"` |
| `dbPersistence.connection_password` | Database password | `"postgresP"` |
| `dbPersistence.existingSecret` | Name of existing secret with database credentials | `` |
| `dbPersistence.connection_databaseLocations_host` | Database host | `"uniconfig-postgres-postgresql"` |
| `dbPersistence.connection_databaseLocations_port` | Database port | `"5432"` |
| `azure.AKS.enabled` | Enable AKS azure deployment | `false` |
| `azure.AKS.storage.existingSecret` | Use existing secrets for storage credentials | |
| `azure.AKS.storage.accountName` | Azure storage account name | |
| `azure.AKS.storage.accessKey` | Azure storage accessKey | |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true` |
| `postgresql.auth.username` | Name for a custom user to create | `postgresU` |
| `postgresql.auth.password` | Password for the custom user to create | `postgresP` |
| `postgresql.auth.database` | Name for a custom database to create | `conductor` |
| `postgresql.architecture` | PostgreSQL architecture (`standalone` or `replication`) | `standalone` |
| `traefikExtraService.enabled` | Enable extra service for traefik | `true` |
| `traefikExtraService.name` | Name for extra service for traefik | `"unistore"` |
| `traefik.enabled` | Switch to enable or disable the traefik helm chart | `true` |
