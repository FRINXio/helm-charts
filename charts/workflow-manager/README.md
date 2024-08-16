# workflow-manager

![Version: 3.1.2](https://img.shields.io/badge/Version-3.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

A Helm chart for Kubernetes deploying conductor-server and schellar

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| FRINX |  |  |

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
| conductorExtraEnv | object | `{"CONDUCTOR_ADDITIONAL_MODULES":"com.netflix.conductor.contribs.metrics.MetricsRegistryModule,com.netflix.conductor.contribs.metrics.LoggingMetricsModule","CONDUCTOR_APP_ASYNCINDEXINGENABLED":false,"CONDUCTOR_APP_EXECUTORSERVICEMAXTHREADCOUNT":100,"CONDUCTOR_APP_MAXTASKINPUTPAYLOADSIZETHRESHOLD":102400,"CONDUCTOR_APP_MAXTASKOUTPUTPAYLOADSIZETHRESHOLD":102400,"CONDUCTOR_APP_MAXWORKFLOWINPUTPAYLOADSIZETHRESHOLD":102400,"CONDUCTOR_APP_MAXWORKFLOWOUTPUTPAYLOADSIZETHRESHOLD":102400,"CONDUCTOR_APP_OWNEREMAILMANDATORY":false,"CONDUCTOR_APP_SYSTEMTASKWORKERCALLBACKDURATION":10,"CONDUCTOR_APP_TASKEXECUTIONPOSTPONEDURATION":0,"CONDUCTOR_APP_TASKINPUTPAYLOADSIZETHRESHOLD":85,"CONDUCTOR_APP_TASKOUTPUTPAYLOADSIZETHRESHOLD":85,"CONDUCTOR_APP_WORKFLOWEXECUTIONLOCKENABLED":true,"CONDUCTOR_APP_WORKFLOWINPUTPAYLOADSIZETHRESHOLD":85,"CONDUCTOR_APP_WORKFLOWOFFSETTIMEOUT":5,"CONDUCTOR_APP_WORKFLOWOUTPUTPAYLOADSIZETHRESHOLD":85,"CONDUCTOR_ARCHIVE_DB_ENABLED":true,"CONDUCTOR_ARCHIVE_DB_INDEXER_POLLINGINTERVAL":10,"CONDUCTOR_ARCHIVE_DB_INDEXER_THREADCOUNT":4,"CONDUCTOR_ARCHIVE_DB_TYPE":"postgres","CONDUCTOR_DB_TYPE":"postgres","CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_CONDUCTORURL":"http://conductor-server:8080","CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_MAXDATADAYS":0,"CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_MAXDATAMONTHS":0,"CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_MAXDATAROWS":100000,"CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_MAXDATAYEARS":1,"CONDUCTOR_EXTERNALPAYLOADSTORAGE_TYPE":"postgres","CONDUCTOR_INDEXING_ENABLED":false,"CONDUCTOR_METRICSDATADOG_ENABLED":false,"CONDUCTOR_METRICSLOGGER_ENABLED":true,"CONDUCTOR_METRICSLOGGER_REPORTPERIODSECONDS":15,"CONDUCTOR_METRICSPROMETHEUS_ENABLED":false,"CONDUCTOR_WORKFLOWEXECUTIONLOCK_TYPE":"local_only","CONDUCTOR_WORKFLOWREPAIRSERVICE_ENABLED":false,"LOADSAMPLE":false,"SPRING_AUTOCONFIGURE_EXCLUDE":"org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration","SPRING_SEARCHDATASOURCE_HIKARI_MAXIMUMPOOLSIZE":8}` | Conductor extra ENV |
| dbPersistence.CONDUCTOR_DATASOURCE_SCHEMA | string | `"public"` |  |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_HOST | string | `nil` |  |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_USERNAME | string | `"postgresU"` |  |
| dbPersistence.POSTGRES_DATABASE | string | `"conductor"` |  |
| dbPersistence.SPRING_DATASOURCE_HOST | string | `nil` | Datasource host |
| dbPersistence.SPRING_DATASOURCE_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.SPRING_DATASOURCE_USERNAME | string | `"postgresU"` |  |
| dbPersistence.SPRING_SEARCHDATASOURCE_HOST | string | `nil` |  |
| dbPersistence.SPRING_SEARCHDATASOURCE_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.SPRING_SEARCHDATASOURCE_USERNAME | string | `"postgresU"` |  |
| dbPersistence.existingSecret.conductorExternalpayloadstoragePostgresPasswordKey | string | `nil` |  |
| dbPersistence.existingSecret.conductorExternalpayloadstoragePostgresUsernameKey | string | `nil` |  |
| dbPersistence.existingSecret.secretName | string | `nil` |  |
| dbPersistence.existingSecret.springDatasourcePasswordKey | string | `nil` |  |
| dbPersistence.existingSecret.springDatasourceUsernameKey | string | `nil` |  |
| dbPersistence.existingSecret.springSearchdatasourcePasswordKey | string | `nil` |  |
| dbPersistence.existingSecret.springSearchdatasourceUsernameKey | string | `nil` |  |
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
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"conductor","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"enabled":true,"primary":{"initdb":{"scripts":{"init_db.sql":"CREATE DATABASE schellar;\n"}}}}` | PostgreSQL chart configuration |
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
| service.portConductor | int | `8080` | Monitoring port |
| service.portSchellar | int | `3000` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `"conductor"` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | utilities image repository |
| utilitiesImage.tag | string | `"1.2"` | Overrides the image tag. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
