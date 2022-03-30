# krakend

An helm chart to deploy Frinx krakend in a kubernetes cluster
* Installs the api-gateway system [FRINXio/krakendD](https://github.com/FRINXio/krakend-ce)

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
helm upgrade [RELEASE_NAME] [CHART] --install
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
| `securityContext` | Deployment securityContext | `{}` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where service is exposed | `80` |
| `service.targetPort` | Port on which the service will send requests to, that your pod will be listening on | `8080` |
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
| `ingress.tlsSecret.enabled` | Enable Ingress TLS Secret configuration | `false` |
| `ingress.tlsSecret.crt` | TLS Certificate | `false` |
| `ingress.tlsSecret.key` | TLS Private key | `false` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `mountPath` | Mount Path for Config files | `"/etc/krakend/"` |
| `replica.autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `replica.autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `replica.autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `replica.autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `replica.autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `podAnnotations` | Pod deployment annotations | `{}` |
| `addVolumes` | Add Volumes | `{}` |
| `addVolumeMounts` | Add mounnts volumes | `{}` |
| `env` | Add environment variable | `{}` |
| `azure.auth.enabled` | Enable azure authentification | `false` |
| `azure.auth.clientId` | Azure cliendId | |
| `azure.auth.clientSecret` | Azure clientSecret | |
| `azure.auth.httpJwtPrefix` | Azure httpJwtPrefix | |
| `azure.AKS.enabled` | Enable AKS azure deployment | `false` |
| `azure.AKS.storage.accountName` | Azure storage account name | |
| `azure.AKS.storage.accessKey` | Azure storage accessKey | |
