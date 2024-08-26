# krakend

FRINX KrakenD API Gateway for FRINX-machine

![Version: 4.1.0](https://img.shields.io/badge/Version-4.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.1](https://img.shields.io/badge/AppVersion-6.1.1-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/krakend
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/krakend
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| containerSecurityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Security context for KrakenD container |
| debug | object | `{"enabled":true,"x_forwarded_groups":"network-admin","x_forwarded_roles":"owner","x_forwarded_user":"frinx-admin-user"}` | Simulate USER credentials |
| devIngress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| devIngress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| devIngress.enabled | bool | `false` | Enable ingress |
| devIngress.hosts | list | `[{"host":"chart-example-dev.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| devIngress.labels | object | `{}` | Additional labels for the Ingress resource |
| devIngress.tls | list | `[]` |  |
| devService.enabled | bool | `false` | Enable dev service |
| devService.nodePort | int | `30001` | Node port |
| devService.port | int | `8081` | SideCar proxy (nginx reverse proxy for http/ws protocols) |
| devService.type | string | `"ClusterIP"` | Service type |
| env | object | `{"ALLOWED_HOSTS":null,"ALLOWED_ORIGINS":null,"DEFAULT_TIMEOUT":"2m","DEVICE_TOPOLOGY_ENABLED":true,"HTTPS_PROXY":null,"HTTP_PROXY":null,"INVENTORY_ENABLED":true,"KRAKEND_TLS_PROTOCOL":"http","L3VPN_ENABLED":false,"LOG_LEVEL":"INFO","NO_PROXY":null,"OAUTH2_KRAKEND_PLUGIN_FROM_MAP":"X-Forwarded-User","OAUTH2_KRAKEND_PLUGIN_TENANT_ID":"frinx","OAUTH2_KRAKEND_PLUGIN_USER_GROUPS_MAP":"X-Forwarded-Groups","OAUTH2_KRAKEND_PLUGIN_USER_ROLES_MAP":"X-Forwarded-Roles","PERFORMANCE_MONITOR_ENABLED":true,"PROXY_ENABLED":false,"RESOURCE_MANAGER_ENABLED":true,"TLS_DISABLED":true,"UNICONFIG_ENABLED":true,"UNICONFIG_PROTOCOL":"http","UNICONFIG_TIMEOUT":"2m","UNICONFIG_ZONES_LIST":"uniconfig","WORKFLOW_MANAGER_ENABLED":true}` | Application environment variables |
| extraEnv | list | `[]` | Additional KrakenD environment variables |
| fullnameOverride | string | `""` | String to partially override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/krakend"` | krakend image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` |  |
| monitoring | object | `{"enabled":false,"port":9091,"targertPort":9091}` | Monitoring configuration |
| nameOverride | string | `""` | String to partially override app name |
| nginx.rateLimits.dryRun | string | `"off"` | [limit_req_dry_run](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_dry_run) |
| nginx.rateLimits.statusCode | int | `429` | [limit_req_status](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_status) |
| nginx.rateLimits.zoneRate | object | `{"api":"100r/s","auth":"20r/s","ws":"10r/s"}` | [limit_req_zone](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_zone) |
| nginx.server | string | `"client_body_buffer_size \"8k\";\nclient_header_buffer_size \"1k\";\nproxy_headers_hash_max_size 2048;\nproxy_headers_hash_bucket_size 128;\nproxy_connect_timeout \"3600\";\nproxy_read_timeout \"3600\";\nproxy_send_timeout \"3600\";\nadd_header X-Frame-Options \"SAMEORIGIN\";\nadd_header X-XSS-Protection \"1; mode=block\";\n"` |  |
| nginxContainerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsGroup":101,"runAsNonRoot":true,"runAsUser":101}` | Security context for NginX container |
| nginxResources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| proxyImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| proxyImage.repository | string | `"nginx"` | nginx image repository |
| proxyImage.tag | string | `"1.27-alpine"` | Overrides the image tag. |
| rbac | object | `{"ADMIN_ACCESS_ROLE":"network-admin","INVENTORY_ADMIN_GROUP":"network-admin","UNICONFIG_CONTROLLER_ADMIN_GROUP":"network-admin","UNISTORE_BEARER_NODE":"bearer","UNISTORE_BEARER_ROLE":"","UNISTORE_CONTROLLER_ADMIN_GROUP":"network-admin","UNISTORE_NETWORK_NODE":"network","UNISTORE_NETWORK_ROLE":"","UNISTORE_OTHER_PERMITTED_ROLES":"","UNISTORE_SERVICE_NODE":"service","UNISTORE_SERVICE_ROLE":"","X_AUTH_USER_GROUP":"network-admin"}` | RBAC configuration |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| service.nodePort | int | `30000` | Node port |
| service.port | int | `8080` | SideCar proxy (nginx reverse proxy for http/ws protocols) |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| volumes.azureFile | object | `{"enabled":false,"storage":{"accessKey":null,"accountName":null}}` | AzureFile volume |

