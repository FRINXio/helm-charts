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

## Uniconfig license

Uniconfig docker image has been moved to a private repository
For access, contact info@frinx.io

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
| `ingress.labels` | Ingress labels. It is highly recommendet to use labels with environment value in cluster with multiple traefik ingress controllers. Please also set traefik.providers.kubernetesIngress.labelSelector to specific label | `{}` |
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
| `mountPath` | Mount path for uniconfig config files | |
| `serviceName` | serviceName env variable | `"uniconfig"` |
| `tls_keystorePassword` | tls_keystorePassword env variable | `"password"` |
| `proxy.enabled` | Enable proxy for uniconfig  | `false` |
| `proxy.http_proxy` | Proxy address for http | `""` |
| `proxy.https_proxy` | Proxy address for https | `""` |
| `proxy.no_proxy` | List of no proxy | `""` |
| `alwaysRollAfterUpgrade` | Always roll after upgrade option | `false` |
| `extraScriptConfigMap` | Mount different config map with script for uniconfig | |
| `extraLightyConfigMap` | Mount different config map with lighty configuration file for uniconfig | |
| `extraLogbackConfigMap` | Mount different config map with logback configuration file for uniconfig | |
| `java.max_mem` | Max memory for java | `"10G"` |
| `dbPersistence.POSTGRES_HOST` | Database host | |
| `dbPersistence.existingSecret` | Name of existing secret with database credentials | `` |
| `dbPersistence.POSTGRES_USERNAME` | Database username | `"postgresU"` |
| `dbPersistence.POSTGRES_PASSWORD` | Database password | `"postgresP"` |
| `dbPersistence.CLISHELL_SSHSERVER_USERNAMEPASSWORDAUTH_PASSWORD` | CLI shell password | `admin` |
| `extraEnv` | Extra env for uniconfig-controller | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/uniconfig/values.yaml) |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true` |
| `postgresql.auth.username` | Name for a custom user to create | `postgresU` |
| `postgresql.auth.password` | Password for the custom user to create | `postgresP` |
| `postgresql.auth.database` | Name for a custom database to create | `conductor` |
| `postgresql.architecture` | PostgreSQL architecture (`standalone` or `replication`) | `standalone` |
| `cacheImage.enabled` | Enable cacheImage | `false` |
| `cacheImage.repository` | cacheImage repository | |
| `cacheImage.tag` | cacheImage tag | `""` |
| `cacheImage.cachePath` | Path to cache files in cacheImage | |
| `extraInitContainers` | Option to add extraInitContainers | `[]` |
| `traefikExtraService.enabled` | Enable extra service for traefik | `true` |
| `traefikExtraService.name` | Name for extra service for traefik | `"unistore"` |
| `traefik.enabled` | Switch to enable or disable the traefik helm chart | `true` |
