# topology-discovery

A Helm chart for Kubernetes deployment of the Topology Discovery

![Version: 3.1.0](https://img.shields.io/badge/Version-3.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.2.5](https://img.shields.io/badge/AppVersion-6.2.5-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/topology-discovery
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/topology-discovery
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":10,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| dbPersistence.ARANGO_ROOT_PASSWORD | string | `"frinx"` |  |
| dbPersistence.ARANGO_URL | string | `"http://arangodb:8529"` | ArangoDB URL |
| dbPersistence.ARANGO_USERNAME | string | `"root"` | Database credentials. Exposed when existing dbPersistence.existingSecret.secretName is empty |
| dbPersistence.existingSecret | object | `{"arangoRootPasswordKey":null,"arangoUsernameKey":null,"secretName":null}` | Existing database credentials |
| deployment.annotations | object | `{}` | Deployment annotations |
| env | object | `{"ADMIN":"admin","BGPLS_ENABLED":false,"BGPLS_LOCAL_AS":100,"BGPLS_NEIGHBOR_IP":"192.168.99.100","BGPLS_NETWORK":"172.18.0.0/16","BGPLS_PEER_AS":100,"BGPLS_ROUTER_ID":"192.168.99.1","CONDUCTOR_URL":"http://conductor-server:8080","EDITOR":"editor","IMPORT_ARANGO_DEMO_DATA":false,"IMPORT_DEVICE_INVENTORY_DATA":false,"TD_KAFKA__API_VERSION":"[\"0\", \"11\", \"5\"]","TD_KAFKA__BOOTSTRAP_SERVERS":"[\"kafka:9092\"]","TD_KAFKA__TOPICS__DEVICE_EVENTS_TOPIC":"device-events","TD_KAFKA__TOPICS__DEVICE_INVENTORY_TOPIC":"device-inventory","UC_URL_BASE":"http://uniconfig:8181/rests/","VIEWER":"viewer","X_TENANT_ID":"frinx"}` | Application environment variables |
| fullnameOverride | string | `""` | String to partially override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/topology-discovery"` | topology-discovery image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` |  |
| kafkaClientResources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Security context |
| service.kafkaClientPort | int | `5005` | Kafka Consumer API service port |
| service.port | int | `5000` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |

