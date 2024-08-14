# swagger-ui

A Helm chart for Swagger UI

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v5.17.14](https://img.shields.io/badge/AppVersion-v5.17.14-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/swagger-ui

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/swagger-ui
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Formatter script configuration

A Formatter script is used to reformat openapi documentation on the fly.
This is useful when swagger is deployed behind a reverse proxy.

Current functionality supports changing server definition, rewriting and whitelisting API endpoints.

Example of configuration:

```yaml
extraConfigMaps:
  workflow-manager-filter:
    server:
      url: /api/workflow
    api:
      rewrite:
        from: ^/api/   # support regex
        to: "/"
      whitelist:
        "/api/metadata/taskdefs":
          - "get"
          - "post"
          - "put"
        "/api/metadata/taskdefs/{name}":
          - "get"
          - "delete"

```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| autoscaling | object | `{"enabled":false,"maxReplicas":100,"minReplicas":1,"targetCPUUtilizationPercentage":80}` | [Autoscaling parameters](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) |
| env | object | `{"BASE_URL":"/swagger","URLS":"[{ url: \"./api/workflow-manager.json\", name: \"WorkflowManager\"}]"}` | Application environment variables |
| extraConfigMaps | object | `{"workflow-manager-filter":{"api":{"rewrite":{"from":"^/api/","to":"/"},"whitelist":{"/api/event":["get","post"],"/api/event/{name}":["delete","get"],"/api/external/postgres/{externalPayloadPath}":["get"],"/api/metadata/taskdefs":["get","post","put"],"/api/metadata/taskdefs/{name}":["get","delete"],"/api/metadata/workflow":["get","post","put"],"/api/metadata/workflow/{name}":["get"],"/api/metadata/workflow/{name}/{version}":["delete"],"/api/workflow":["post"],"/api/workflow/bulk/pause":["put"],"/api/workflow/bulk/restart":["post"],"/api/workflow/bulk/resume":["put"],"/api/workflow/bulk/retry":["post"],"/api/workflow/bulk/terminate":["post"],"/api/workflow/{name}":["delete"],"/api/workflow/{workflowId}":["get"],"/api/workflow/{workflowId}/remove":["delete"],"/health":["get"]}},"enabled":true,"server":{"url":"/api/workflow"}}}` | Extra Config maps Define configuration for formetter script. |
| extraConfigMaps.workflow-manager-filter | object | `{"api":{"rewrite":{"from":"^/api/","to":"/"},"whitelist":{"/api/event":["get","post"],"/api/event/{name}":["delete","get"],"/api/external/postgres/{externalPayloadPath}":["get"],"/api/metadata/taskdefs":["get","post","put"],"/api/metadata/taskdefs/{name}":["get","delete"],"/api/metadata/workflow":["get","post","put"],"/api/metadata/workflow/{name}":["get"],"/api/metadata/workflow/{name}/{version}":["delete"],"/api/workflow":["post"],"/api/workflow/bulk/pause":["put"],"/api/workflow/bulk/restart":["post"],"/api/workflow/bulk/resume":["put"],"/api/workflow/bulk/retry":["post"],"/api/workflow/bulk/terminate":["post"],"/api/workflow/{name}":["delete"],"/api/workflow/{workflowId}":["get"],"/api/workflow/{workflowId}/remove":["delete"],"/health":["get"]}},"enabled":true,"server":{"url":"/api/workflow"}}` | workflow-manager filter configuration |
| extraVolumes | object | `{}` | Additional volumes on the output Deployment definition |
| fullnameOverride | string | `""` | String to partially override app name |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"swaggerapi/swagger-ui"` | swagger-ui image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | [Image Pull Secrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/) |
| ingress.annotations | object | `{}` | Additional annotations for the Ingress resource |
| ingress.className | string | `""` | IngressClass that will be be used to implement the Ingress |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | [Ingress Host](https://kubernetes.io/docs/concepts/services-networking/ingress/#the-ingress-resource) |
| ingress.labels | object | `{}` | Additional labels for the Ingress resource |
| ingress.tls | list | `[]` |  |
| initContainers | object | `{}` | additional InitContainers |
| livenessProbe | object | `{"initialDelaySeconds":10,"periodSeconds":30,"timeoutSeconds":10}` | Liveness probe |
| manageApiDocs | object | `{"workflow-manager":{"enabled":true,"fetch":{"file":"workflow-manager.json","url":"https://raw.githubusercontent.com/FRINXio/conductor/swagger_docs/latest.json"},"formatConfigMap":"workflow-manager-filter"}}` | InitContainer configuration used to fetch and format openapi documentation Define service name, endpoint to documentation, output file name and extra config map with configuration for formatter script. |
| nameOverride | string | `""` | String to partially override app name |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podLabels | object | `{}` | Pod labels |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| replicaCount | int | `1` | Number of replicas of the deployment. |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{}` | Security context |
| service.annotations | object | `{}` | Service annotations |
| service.loadBalancerIP | string | `nil` | Service [Load Balancer IP](https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer) |
| service.port | int | `8080` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | utilities image repository |
| utilitiesImage.tag | string | `"1.2"` | Overrides the image tag. |

