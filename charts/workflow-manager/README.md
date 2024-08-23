# workflow-manager

A Helm chart for Kubernetes deploying conductor-server and schellar

![Version: 3.2.0](https://img.shields.io/badge/Version-3.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/workflow-manager
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/workflow-manager
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
| autoscaling | object | `{"enabled":false,"maxReplicas":3,"minReplicas":2,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| conductorEnv | object | `{"CONFIG_PROP":"/app/nofile/config.properties","LOG4J_PROP":"/app/config/log4j-cluster.properties","_JAVA_OPTIONS":"-Xmx2g"}` | Conductor extra ENV |
| dbPersistence.CONDUCTOR_DATASOURCE_SCHEMA | string | `"public"` | Database datasource schema |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_HOST | string | `nil` | Conductor external payload staorage postgres hostname |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_USERNAME | string | `"postgresU"` | Database credentials. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.POSTGRES_DATABASE | string | `"conductor"` | Database name |
| dbPersistence.SPRING_DATASOURCE_HOST | string | `nil` | Spring datasource hostname |
| dbPersistence.SPRING_DATASOURCE_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.SPRING_DATASOURCE_USERNAME | string | `"postgresU"` |  |
| dbPersistence.SPRING_SEARCHDATASOURCE_HOST | string | `nil` | Spring search datasource hostname |
| dbPersistence.SPRING_SEARCHDATASOURCE_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.SPRING_SEARCHDATASOURCE_USERNAME | string | `"postgresU"` |  |
| dbPersistence.existingSecret | object | `{"conductorExternalpayloadstoragePostgresPasswordKey":null,"conductorExternalpayloadstoragePostgresUsernameKey":null,"secretName":null,"springDatasourcePasswordKey":null,"springDatasourceUsernameKey":null,"springSearchdatasourcePasswordKey":null,"springSearchdatasourceUsernameKey":null}` | Existing database credentials |
| fullnameOverride | string | `""` | String to fully override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/conductor-server"` | Resource-manager image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"workflow-manager.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.schellarHosts[0].host | string | `"workflow-manager-schellar.local"` |  |
| ingress.schellarHosts[0].paths[0].path | string | `"/"` |  |
| ingress.schellarHosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` | [Ingress TLS resource](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) |
| monitoring | object | `{"conductorPath":"/actuator/prometheus","conductorPort":"http-conductor","enabled":false,"schellarPath":"/metrics","schellarPort":"http-schellar"}` | Monitoring configuration |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"conductor","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"enabled":true,"metrics":{"enabled":true,"serviceMonitor":{"enabled":true,"labels":{"prometheus":"conductor-db"}}},"primary":{"initdb":{"scripts":{"init_db.sql":"CREATE DATABASE schellar;\n"}}}}` | PostgreSQL chart configuration |
| postgresql.metrics | object | `{"enabled":true,"serviceMonitor":{"enabled":true,"labels":{"prometheus":"conductor-db"}}}` | Database metrics configuration |
| rbac | object | `{"WM_ADMIN_GROUPS":"NETWORK-ADMIN","WM_ADMIN_ROLES":"OWNER"}` | RBAC configuration |
| replicaCount | int | `1` | Number of replicas of the deployment |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| schellarDbPersistence | object | `{"POSTGRES_DATABASE":"schellar","POSTGRES_HOST":"postgresql","POSTGRES_PASSWORD":"postgresP","POSTGRES_PORT":5432,"POSTGRES_USERNAME":"postgresU","existingSecret":{"postgresPasswordKey":null,"postgresUsernameKey":null,"secretName":null}}` | Schellar DB chart configuration |
| schellarEnv.BACKEND | string | `"postgres"` |  |
| schellarEnv.CHECK_INTERVAL_SECONDS | int | `10` |  |
| schellarEnv.CONDUCTOR_API_URL | string | `"http://localhost:8080/api"` |  |
| schellarEnv.LOG_LEVEL | string | `"debug"` | Shellar log level |
| schellarEnv.PLAYGROUND_QUERY_ENDPOINT | string | `"/api/schedule"` |  |
| schellarEnv.POSTGRES_MIGRATIONS_DIR | string | `"migrations"` |  |
| schellarExtraEnv | list | `[]` | Schellar extra ENV |
| schellarImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| schellarImage.repository | string | `"frinx/schellar"` | Schellar image repository |
| schellarImage.tag | string | `"6.1.0"` | Overrides the image tag |
| schellarResources | object | `{}` | Schellar resources |
| securityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Configure [Container Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) |
| service.portConductor | int | `8080` | Conductor service port |
| service.portSchellar | int | `3000` | Schellar service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `"conductor"` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | utilities image repository |
| utilitiesImage.tag | string | `"1.2"` | Overrides the image tag. |
