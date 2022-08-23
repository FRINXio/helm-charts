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
| `service.targetPort` | Port on which the service will send requests to, that your pod will be listening on | `8080` |
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.host` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `deployment.env.TLS_DISABLED` | TLS_DISABLED env variable | `true` |
| `deployment.env.KRAKEND_TLS_PROTOCOL` | KRAKEND_TLS_PROTOCOL env variable | `"http"` |
| `deployment.env.AUTH_ENABLED` | AUTH_ENABLED env variable | `false` |
| `deployment.env.PROXY_ENABLED` | PROXY_ENABLED env variable | `false` |
| `deployment.env.HTTP_PROXY` | HTTP_PROXY env variable | |
| `deployment.env.HTTPS_PROXY` | HTTPS_PROXY env variable | |
| `deployment.env.NO_PROXY` | NO_PROXY env variable | |
| `deployment.env.UNICONFIG_ZONES_LIST` | UNICONFIG_ZONES_LIST env variable | `"uniconfig"` |
| `deployment.azureAuth.enabled` | Enabled azure authentication | `false` |
| `deployment.azureAuth.AZURE_LOGIN_URL` | AZURE_LOGIN_URL env variable | `"https://login.microsoftonline.com"` |
| `deployment.azureAuth.AZURE_TENANT_NAME` | AZURE_TENANT_NAME env variable | `"frinx"` |
| `deployment.azureAuth.AZURE_TENANT_ID` | AZURE_TENANT_ID env variable | `"frinx"` |
| `deployment.azureAuth.AZURE_KRAKEND_PLUGIN_JWT_VALUE_PREFIX` | AZURE_KRAKEND_PLUGIN_JWT_VALUE_PREFIX env variable | `"Bearer"` |
| `deployment.azureAuth.AZURE_KRAKEND_PLUGIN_GROUP_DISABLE` | AZURE_KRAKEND_PLUGIN_GROUP_DISABLE env variable | `true` |
| `deployment.azureAuth.existingSecret` | Name for existing Secret for azure authentication | |
| `deployment.azureAuth.AZURE_KRAKEND_PLUGIN_CLIENT_ID` | AZURE_KRAKEND_PLUGIN_CLIENT_ID env variable | `""` |
| `deployment.azureAuth.AZURE_KRAKEND_PLUGIN_CLIENT_SECRET` | AZURE_KRAKEND_PLUGIN_CLIENT_SECRET env variable | `""` |
| `deployment.rbac.UNICONFIG_CONTROLLER_ADMIN_GROUP` | UNICONFIG_CONTROLLER_ADMIN_GROUP env variable | `"network-admin"` |
| `deployment.rbac.UNISTORE_CONTROLLER_ADMIN_GROUP` | UNISTORE_CONTROLLER_ADMIN_GROUP env variable | `"network-admin"` |
| `deployment.rbac.UNISTORE_BEARER_ROLE` | UNISTORE_BEARER_ROLE env variable | `""` |
| `deployment.rbac.UNISTORE_SERVICE_ROLE` | UNISTORE_SERVICE_ROLE env variable | `""` |
| `deployment.rbac.UNISTORE_NETWORK_ROLE` | UNISTORE_NETWORK_ROLE env variable | `""` |
| `deployment.rbac.UNISTORE_OTHER_PERMITTED_ROLES` | UNISTORE_OTHER_PERMITTED_ROLES env variable | `""` |
| `deployment.rbac.UNISTORE_BEARER_NODE` | UNISTORE_BEARER_NODE env variable | `"bearer"` |
| `deployment.rbac.UNISTORE_SERVICE_NODE` | UNISTORE_SERVICE_NODE env variable | `"service"` |
| `deployment.rbac.UNISTORE_NETWORK_NODE` | UNISTORE_NETWORK_NODE env variable | `"network"` |
| `deployment.rbac.RM_ADMIN_GROUPS` | RM_ADMIN_GROUPS env variable | `"network-admin"` |
| `deployment.rbac.RM_ADMIN_ROLES` | RM_ADMIN_ROLES env variable | `""` |
| `deployment.rbac.INVENTORY_ADMIN_GROUP` | INVENTORY_ADMIN_GROUP env variable | `"network-admin"` |
| `deployment.rbac.ADMIN_ACCESS_ROLE` | ADMIN_ACCESS_ROLE env variable | `"network-admin"` |
| `deployment.rbac.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `"network-admin"` |
| `deployment.volumes.azureFile.enabled` | Enable azureFile for config | `false` |
| `deployment.volumes.azureFile.storage.accountName` | accountName for azure storage | |
| `deployment.volumes.azureFile.storage.accessKey` | accessKey for azure storage | |
