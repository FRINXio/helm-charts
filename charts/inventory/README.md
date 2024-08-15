# inventory

A Helm chart for Kubernetes deployment of the Device Inventory

![Version: 6.0.1](https://img.shields.io/badge/Version-6.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | Image name |
| utilitiesImage.tag | string | `1.2` | Image tag |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| dbPersistence.POSTGRES_DATABASE | string | `"inventory"` | Database name |
| dbPersistence.POSTGRES_DB_SCHEMA | string | `"public"` | Database schema |
| dbPersistence.POSTGRES_HOST | string | `nil` | Database hostname |
| dbPersistence.POSTGRES_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.POSTGRES_PORT | int | `5432` | Database port |
| dbPersistence.POSTGRES_USERNAME | string | `"postgresU"` | Database credentials. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.existingSecret | object | `{"postgresPasswordKey":null,"postgresUsernameKey":null,"secretName":null}` | Existing database credentials |
| deployment.annotations | object | `{}` | Deployment annotations |
| env | object | `{"KAFKA_BROKER":"kafka:9092","KAFKA_ENABLED":true,"KAFKA_TOPIC":"device-inventory","PERFORMANCE_MONITORING_ENABLED":true,"PERFORMANCE_MONITORING_GRAPHQL_API_URL":"http://performance-monitor:8000/api/graphql","SHELL_HOST":"uniconfig-controller","TOPOLOGY_DISCOVERY_API_URL":"http://topology-discovery:5000","TOPOLOGY_DISCOVERY_GRAPHQL_API_URL":"http://topology-discovery:5000/api/graphql","TOPOLOGY_ENABLED":true,"UNICONFIG_API_PORT":8181,"UNICONFIG_API_PROTOCOL":"http","UNICONFIG_LIST_URL":"http://krakend:8080/static/list/uniconfig","X_TENANT_ID":"frinx"}` | Application environment variables |
| fullnameOverride | string | `""` | String to partially override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/frinx-inventory-server"` | frinx-inventory-server image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"inventory","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"enabled":true}` | Internal Postgres Database |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Security context |
| service.port | int | `8000` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |

