# performance-monitor

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

FRINX Performance Monitor chart for FRINX-machine

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| FRINX | <services@frinx.io> | <https://frinx.io> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | kafka | 22.1.1 |
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | Image name |
| utilitiesImage.tag | string | `1.2` | Image tag |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| dbPersistence.POSTGRES_DATABASE | string | `"performancemonitor"` | Database name |
| dbPersistence.POSTGRES_DB_SCHEMA | string | `"public"` | Database schema |
| dbPersistence.POSTGRES_HOST | string | `nil` | Database hostname |
| dbPersistence.POSTGRES_MIGRATION_DIR | string | `"./migrations"` | Database migration dir |
| dbPersistence.POSTGRES_PASSWORD | string | `"postgresP"` | Database password. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.POSTGRES_PORT | int | `5432` | Database port |
| dbPersistence.POSTGRES_USERNAME | string | `"postgresU"` | Database username. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.existingSecret | object | `{"postgresPasswordKey":null,"postgresUsernameKey":null}` | Existing database credentials |
| env | object | `{"PM_KAFKA__BOOTSTRAP_SERVERS":"[\"kafka:9092\"]","PM_KAFKA__TOPICS__DEVICE_INVENTORY_TOPIC":"device-inventory"}` | Application environment variables |
| fullnameOverride | string | `""` | String to partially override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/performance-monitor"` | Performance Monitor image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[{"name":"regcred"}]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` |  |
| initContainersUrl | object | `{"KAFKA_PORT":9092}` | InitContiners envirnmnet variables |
| kafka | object | `{"configurationOverrides":{"log.retention.hours":168},"controller":{"replicaCount":1},"fullnameOverride":"kafka","listeners":{"client":{"protocol":"PLAINTEXT"}},"persistence":{"enabled":true,"size":"1Gi"}}` | [Kafka subchart](`https://artifacthub.io/packages/helm/bitnami/kafka`) |
| livenessProbe | object | `{}` | Liveness probe |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"performancemonitor","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"image":{"repository":"timescale/timescaledb-ha","tag":"pg16-ts2.15-all"},"primary":{"initdb":{"scripts":{"init_db.sql":"CREATE EXTENSION IF NOT EXISTS timescaledb;\n"}}}}` | [Postgresql subchart](https://artifacthub.io/packages/helm/bitnami/postgresql) |
| readinessProbe | object | `{}` | Readiness probe |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{}` | Security context |
| service.annotations | object | `{}` | Service annotations |
| service.loadBalancerIP | string | `nil` | Service [Load Balancer IP](https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer) |
| service.port | int | `8000` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

