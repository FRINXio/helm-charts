# resource-manager

A Helm chart for Kubernetes deploying of the Frinx Resource-Manager

![Version: 2.2.1](https://img.shields.io/badge/Version-2.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 14.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":3,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| dbPersistence.POSTGRES_DATABASE | string | `"postgres"` | Database name |
| dbPersistence.POSTGRES_HOST | string | `nil` | Database hostname |
| dbPersistence.POSTGRES_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.POSTGRES_PORT | int | `5432` | Database port |
| dbPersistence.POSTGRES_USERNAME | string | `"postgresU"` | Database credentials. Exposed when existing dbPersistence.existingSecret.secretName is empty   |
| dbPersistence.existingSecret | object | `{"postgresPasswordKey":null,"postgresUsernameKey":null,"secretName":null}` | Existing database credentials |
| env | object | `{"RM_API_PORT":8884,"RM_LOG_LEVEL":"warn","RM_LOG_PATH":"/var/log/rm.log","WASMER_MAX_TIMEOUT_MILLIS":10000}` | Application environment variables |
| extraEnv | list | `[]` | Additional application environment variables |
| fullnameOverride | string | `""` | String to fully override app name |
| image.name | string | `"frinx/resource-manager"` | Resource-manager image repository |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` | [Ingress TLS resource](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"postgres","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"enabled":true}` | PostgreSQL chart configuration |
| rbac | object | `{"RM_ADMIN_GROUPS":"NETWORK-ADMIN","RM_ADMIN_ROLES":"OWNER"}` | RBAC configuration |
| replicaCount | int | `1` | Number of replicas of the deployment |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Configure [Container Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) |
| service.monitorPort | int | `9464` | Monitoring port |
| service.port | int | `8884` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | utilities image repository |
| utilitiesImage.tag | string | `"1.2"` | Overrides the image tag. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
