# krakend

FRINX KrakenD API Gateway for FRINX-machine

![Version: 5.0.0](https://img.shields.io/badge/Version-5.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.1](https://img.shields.io/badge/AppVersion-6.1.1-informational?style=flat-square)

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

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | nginx | 18.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| containerSecurityContext | object | `{"capabilities":{"drop":["ALL"]}}` | Security context for KrakenD container |
| debug | object | `{"enabled":true,"x_forwarded_groups":"network-admin","x_forwarded_roles":"owner","x_forwarded_user":"frinx-admin-user"}` | Simulate USER credentials |
| env | object | `{"ALLOWED_HOSTS":null,"ALLOWED_ORIGINS":null,"DEFAULT_TIMEOUT":"2m","DEVICE_TOPOLOGY_ENABLED":true,"HTTPS_PROXY":null,"HTTP_PROXY":null,"INVENTORY_ENABLED":true,"KRAKEND_TLS_PROTOCOL":"http","L3VPN_ENABLED":false,"LOG_LEVEL":"INFO","NO_PROXY":null,"OAUTH2_KRAKEND_PLUGIN_FROM_MAP":"X-Forwarded-User","OAUTH2_KRAKEND_PLUGIN_TENANT_ID":"frinx","OAUTH2_KRAKEND_PLUGIN_USER_GROUPS_MAP":"X-Forwarded-Groups","OAUTH2_KRAKEND_PLUGIN_USER_ROLES_MAP":"X-Forwarded-Roles","PERFORMANCE_MONITOR_ENABLED":true,"PROXY_ENABLED":false,"RESOURCE_MANAGER_ENABLED":true,"TLS_DISABLED":true,"UNICONFIG_ENABLED":true,"UNICONFIG_PROTOCOL":"http","UNICONFIG_TIMEOUT":"12h","UNICONFIG_ZONES_LIST":"uniconfig","WORKFLOW_MANAGER_ENABLED":true}` | Application environment variables |
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
| monitoring | object | `{"enabled":false,"port":9091,"targetPort":9091}` | Monitoring configuration |
| nameOverride | string | `""` | String to partially override app name |
| nginx.enabled | bool | `true` |  |
| nginx.existingServerBlockConfigmap | existingServerBlockConfigmap ConfigMap with custom server block to be added to NGINX configuration | `"krakend-nginx-config"` | [https://artifacthub.io/packages/helm/bitnami/nginx?modal=values&path=existingServerBlockConfigmap] |
| nginx.ingress | object | `{"annotations":{"nginx.ingress.kubernetes.io/force-ssl-redirect":"true","nginx.ingress.kubernetes.io/proxy-connect-timeout":"12h","nginx.ingress.kubernetes.io/proxy-read-timeout":"12h","nginx.ingress.kubernetes.io/proxy-send-timeout":"12h"},"enabled":false}` | Configure the [Nginx Ingress resource](https://artifacthub.io/packages/helm/bitnami/nginx?modal=values&path=ingress) |
| nginx.rateLimits.dryRun | bool | `false` | [limit_req_dry_run](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_dry_run) |
| nginx.rateLimits.statusCode | int | `429` | [limit_req_status](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_status) |
| nginx.rateLimits.zoneRate | object | `{"api":"100r/s","auth":"20r/s","ws":"10r/s"}` | [limit_req_zone](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html#limit_req_zone) |
| nginx.server | string | `"client_body_buffer_size \"8k\";\nclient_header_buffer_size \"1k\";\nproxy_headers_hash_max_size 2048;\nproxy_headers_hash_bucket_size 128;\nproxy_connect_timeout \"12h\";\nproxy_read_timeout \"12h\";\nproxy_send_timeout \"12h\";\n"` |  |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| rateLimits.frinxFrontend | object | `{"proxy":{"capacity":10,"enabled":true,"every":"1s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"1s","maxRate":10}}` | Rate limits for frinx-frontend |
| rateLimits.frinxFrontendProxy | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for frinx-frontend-proxy |
| rateLimits.inventory | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for inventory |
| rateLimits.performanceMonitor | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for performance-monitor |
| rateLimits.resourceManager | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for resource-manager |
| rateLimits.schellar | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for schellar |
| rateLimits.swagger | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for swagger |
| rateLimits.topologDiscovery | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for topology-discovery |
| rateLimits.uniconfig | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for uniconfig |
| rateLimits.unistore | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for unistore |
| rateLimits.workflowManager | object | `{"proxy":{"capacity":10,"enabled":true,"every":"10s","maxRate":30},"router":{"clientCapacity":30,"enabled":true,"every":"10s","maxRate":10}}` | Rate limits for workflow-manager |
| rbac | object | `{"ADMIN_ACCESS_ROLE":"network-admin","INVENTORY_ADMIN_GROUP":"network-admin","UNICONFIG_CONTROLLER_ADMIN_GROUP":"network-admin","UNISTORE_BEARER_NODE":"bearer","UNISTORE_BEARER_ROLE":"","UNISTORE_CONTROLLER_ADMIN_GROUP":"network-admin","UNISTORE_NETWORK_NODE":"network","UNISTORE_NETWORK_ROLE":"","UNISTORE_OTHER_PERMITTED_ROLES":"","UNISTORE_SERVICE_NODE":"service","UNISTORE_SERVICE_ROLE":"","X_AUTH_USER_GROUP":"network-admin"}` | RBAC configuration |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [KrakenD Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| service.nodePort | int | `30000` | Node port for HTTP |
| service.port | int | `8080` | KrakenD HTTP |
| service.targetPort | int | `8080` | Target port for HTTP |
| service.type | string | `"ClusterIP"` | Service type for HTTP and Websocket |
| service.wsNodePort | int | `30001` | Node port for Websocket |
| service.wsPort | int | `8001` | KrakenD Websocket |
| service.wsTargetPort | int | `8001` | Target port for Websocket |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |

