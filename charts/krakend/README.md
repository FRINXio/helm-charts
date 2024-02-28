# krakend

FRINX KrakenD API Gateway for FRINX-machine
* Source code [FRINXio/krakendD](https://github.com/FRINXio/krakend-ce)

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

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/krakend` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `1.0.2` |
| `imagePullSecrets` | Image pull secrets | `{}` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `""` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `containerSecurityContext` | Deployment container securityContext | [See values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/krakend/values.yaml#L32) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where service is exposed | `8080` |
| `service.nodePort` | Option to specify nodePort if type of service is NodePort | `30000` |
| `service.targetPort` | Port on which the service will send requests to, that your pod will be listening on | `8080` |
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.TLS_DISABLED` | TLS_DISABLED env variable | `true` |
| `env.DEFAULT_TIMEOUT` | DEFAUTL_TIMEOUT for requests | `"2m"` |
| `env.UNICONFIG_TIMEOUT` | UNICONFIG_TIMEOUT for uniconfig requests | `"2m"` |
| `env.KRAKEND_TLS_PROTOCOL` | KRAKEND_TLS_PROTOCOL env variable | `"http"` |
| `env.PROXY_ENABLED` | PROXY_ENABLED env variable | `false` |
| `env.HTTP_PROXY` | HTTP_PROXY env variable | |
| `env.HTTPS_PROXY` | HTTPS_PROXY env variable | |
| `env.NO_PROXY` | NO_PROXY env variable | |
| `env.UNICONFIG_PROTOCOL` | UNICONFIG_PROTOCOL env variable | `"http"` |
| `env.UNICONFIG_ZONES_LIST` | UNICONFIG_ZONES_LIST env variable | `"uniconfig"` |
| `env.ALLOWED_HOSTS` | ALLOWED_HOSTS env variable | `""` |
| `env.ALLOWED_ORIGINS` | ALLOWED_ORIGINS env variable | `""` |
| `env.WORKFLOW_MANAGER_ENABLED` | WORKFLOW_MANAGER_ENABLED env variable | `true` |
| `env.UNICONFIG_ENABLED` | UNICONFIG_ENABLED env variable | `true` |
| `env.INVENTORY_ENABLED` | INVENTORY_ENABLED env variable | `true` |
| `env.RESOURCE_MANAGER_ENABLED` | RESOURCE_MANAGER_ENABLED env variable | `true` |
| `env.DEVICE_TOPOLOGY_ENABLED` | DEVICE_TOPOLOGY_ENABLED env variable | `false` |
| `env.L3VPN_ENABLED` | L3VPN_ENABLED env variable | `false` |
| `env.OAUTH2_KRAKEND_PLUGIN_TENANT_ID` | OAUTH2_KRAKEND_PLUGIN_TENANT_ID env variable | `frinx` |
| `env.OAUTH2_KRAKEND_PLUGIN_USER_ROLES_MAP` | OAUTH2_KRAKEND_PLUGIN_USER_ROLES_MAP env variable | `X-Forwarded-Roles` |
| `env.OAUTH2_KRAKEND_PLUGIN_USER_GROUPS_MAP` | OAUTH2_KRAKEND_PLUGIN_USER_GROUPS_MAP env variable | `X-Forwarded-Groups` |
| `env.OAUTH2_KRAKEND_PLUGIN_FROM_MAP` | OAUTH2_KRAKEND_PLUGIN_FROM_MAP env variable | `X-Forwarded-User` |
| `rbac.UNICONFIG_CONTROLLER_ADMIN_GROUP` | UNICONFIG_CONTROLLER_ADMIN_GROUP env variable | `"network-admin"` |
| `rbac.UNISTORE_CONTROLLER_ADMIN_GROUP` | UNISTORE_CONTROLLER_ADMIN_GROUP env variable | `"network-admin"` |
| `rbac.UNISTORE_BEARER_ROLE` | UNISTORE_BEARER_ROLE env variable | `""` |
| `rbac.UNISTORE_SERVICE_ROLE` | UNISTORE_SERVICE_ROLE env variable | `""` |
| `rbac.UNISTORE_NETWORK_ROLE` | UNISTORE_NETWORK_ROLE env variable | `""` |
| `rbac.UNISTORE_OTHER_PERMITTED_ROLES` | UNISTORE_OTHER_PERMITTED_ROLES env variable | `""` |
| `rbac.UNISTORE_BEARER_NODE` | UNISTORE_BEARER_NODE env variable | `"bearer"` |
| `rbac.UNISTORE_SERVICE_NODE` | UNISTORE_SERVICE_NODE env variable | `"service"` |
| `rbac.UNISTORE_NETWORK_NODE` | UNISTORE_NETWORK_NODE env variable | `"network"` |
| `rbac.INVENTORY_ADMIN_GROUP` | INVENTORY_ADMIN_GROUP env variable | `"network-admin"` |
| `rbac.ADMIN_ACCESS_ROLE` | ADMIN_ACCESS_ROLE env variable | `"network-admin"` |
| `rbac.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `"network-admin"` |
| `extraEnv` | Additional env variables |  |
| `volumes.azureFile.enabled` | Enable azureFile for config | `false` |
| `volumes.azureFile.storage.accountName` | accountName for azure storage | |
| `volumes.azureFile.storage.accessKey` | accessKey for azure storage | |
