# sample-topology

A Helm chart for the Frinx Machine sample-topology Kubernetes deployment

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/sample-topology
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/sample-topology
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/sample-topology` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
| `imagePullSecrets` | Image pull secrets | `[]` |
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
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.className` | Class name for Ingress | `""` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
| `ingress.tlsSecret.enabled` | Enable Ingress TLS Secret configuration | `false` |
| `ingress.tlsSecret.crt` | TLS Certificate | `false` |
| `ingress.tlsSecret.key` | TLS Private key | `false` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.DOCKER_GWBRIDGE_IP` | DOCKER_GWBRIDGE_IP env value | `"localhost"` |
| `env.INSTANCES_TO_SIMULATE` | INSTANCES_TO_SIMULATE env value | `""` |
| `env.RUN_TESTTOOLS` | RUN_TESTTOOLS env value | `"./scripts/run_netconf_devices/run_netconf_testtool.sh & ./scripts/run_cli_devices/run_devices_docker.sh"` |
