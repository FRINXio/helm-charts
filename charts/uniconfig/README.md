# uniconfig

A Helm chart for UniConfig Kubernetes deployment

![Version: 8.0.0](https://img.shields.io/badge/Version-8.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.1](https://img.shields.io/badge/AppVersion-6.1.1-informational?style=flat-square)

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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | kafka | 25.2.0 |
| https://charts.bitnami.com/bitnami | postgresql | 11.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| alwaysRollAfterUpgrade | bool | `false` |  |
| args | list | `["/opt/uniconfig-frinx/run_uniconfig.sh"]` | Uniconfig container args |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80,"targetMemoryUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| cacheConfigs | object | `{}` | global configuration of cache |
| command | list | `["/bin/sh","-c"]` | Uniconfig container command |
| dbPersistence.CLISHELL_SSHSERVER_USERNAMEPASSWORDAUTH_PASSWORD | string | `"admin"` |  |
| dbPersistence.POSTGRES_HOST | string | `nil` | Database hostname |
| dbPersistence.POSTGRES_PASSWORD | string | `"postgresP"` |  |
| dbPersistence.POSTGRES_USERNAME | string | `"postgresU"` | Database credentials. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.existingSecret | object | `{"clishellSshserverUsernamepasswordauthPasswordKey":null,"postgresPasswordKey":null,"postgresUsernameKey":null,"secretName":null}` | Existing database credentials |
| extraEnv | object | `{"CLISHELL_SSHSERVER_ENABLED":true,"CLISHELL_SSHSERVER_INETADDRESS":"0.0.0.0","DBPERSISTENCE_CONNECTION_DATABASELOCATIONS_0_PORT":5432,"DBPERSISTENCE_CONNECTION_MAXDBPOOLSIZE":300,"DBPERSISTENCE_EMBEDDEDDATABASE_ENABLED":false,"NOTIFICATIONS_ENABLED":true,"NOTIFICATIONS_KAFKA_KAFKASERVERS_0_BROKERHOST":"kafka","NOTIFICATIONS_KAFKA_KAFKASERVERS_0_BROKERLISTENINGPORT":9092,"SPRING_AUTOCONFIGURE_EXCLUDE":"org.springframework.cloud.stream.function.FunctionConfiguration","SPRING_CLOUD_BUS_ENABLED":false,"SPRING_KAFKA_BOOTSTRAPSERVERS":"http://kafka:9092","TRANSACTIONS_MAXSTOREDTRANSACTIONS":100,"TRANSACTIONS_MAXTRANSACTIONAGE":7200,"TRANSACTIONS_TRANSACTIONIDLETIMEOUT":3600,"UNICONFIG_CLOUD_CONFIG_ENABLED":false}` | Application properties |
| extraInitContainers | list | `[]` | Extra init containers |
| extraLogbackConfigMap | string | `nil` |  |
| extraScriptConfigMap | string | `nil` |  |
| fullnameOverride | string | `""` | String to fully override app name |
| highAvailability.enabled | bool | `false` | Deploy extra traefik compatible resources to provide sticky session and zone loadbalancing |
| highAvailability.hosts | list | `["uniconfig"]` | Additional traefik services which are used to forward requests to uniconfig controller with sticky session |
| highAvailability.stickyCookie | object | `{"httpOnly":true,"name":"uniconfig_server_id","sameSite":"strict","secure":true}` | Traefik [sticky cookie](https://doc.traefik.io/traefik/v2.11/routing/services/#sticky-sessions) |
| highAvailability.traefik.entrypoint | string | `"uniconfig"` | Traefik port name for uniconfig entrypoint |
| highAvailability.traefik.port | int | `8181` | Traefik port value for uniconfig entrypoint |
| highAvailability.traefik.selectorInstance | string | `nil` | Override traefik service instance |
| highAvailability.traefik.selectorName | string | `nil` | Override traefik service name. If not defined, default value is uc-zone-lb |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/uniconfig"` | Uniconfig image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[{"name":"regcred"}]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` | [Ingress TLS resource](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) |
| java | object | `{"max_mem":"10G"}` | Java max memory for Uniconfig container |
| kafka | object | `{"fullnameOverride":"kafka","listeners":{"client":{"protocol":"PLAINTEXT"}}}` | [Kafka subchart: "https://artifacthub.io/packages/helm/bitnami/kafka"] |
| mibsConfigs | object | `{}` | global configuration of mibs |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| postgresql | object | `{"architecture":"standalone","auth":{"database":"uniconfig","enablePostgresUser":true,"password":"postgresP","username":"postgresU"},"enabled":true}` | Internal Postgres Database |
| proxy | object | `{"config":{"HTTPS_PROXY":null,"HTTP_PROXY":null,"NO_PROXY":null},"enabled":false}` | Configure proxy settings fr unicnfig container |
| replicaCount | int | `1` | Number of replicas of the deployment. If you want to use more than 1 replica, must deploy it with cookie sticky sessions To create sticky session, deploy it with traefik and set highAvailability.enabled=true |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| service.annotations | object | `{}` |  |
| service.loadBalancerIP | string | `nil` | Service [Load Balancer IP](https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer) |
| service.port | int | `8181` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |

