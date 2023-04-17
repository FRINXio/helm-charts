# demo-workflows

A Helm chart for the Frinx Machine demo workflows

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/demo-workflows
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/demo-workflows
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/demo-workflows` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
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
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `100` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `env.UNICONFIG_HOSTNAME` | UNICONFIG_HOSTNAME env variable | `uniconfig` |
| `env.UNICONFIG_PORT` | UNICONFIG_PORT env variable | `8181` |
| `env.UNIFLOW_HOSTNAME` | UNIFLOW_HOSTNAME env variable | `workflow-proxy` |
| `env.UNIFLOW_PORT` | UNIFLOW_PORT env variable | `8088` |
| `env.CONDUCTOR_PORT` | CONDUCTOR_PORT env variable | `8080` |
| `env.INVENTORY_HOSTNAME` | INVENTORY_HOSTNAME env variable | `inventory` |
| `env.INVENTORY_PORT` | INVENTORY_PORT env variable | `8000` |
| `env.INSTANCES_TO_SIMULATE` | INSTANCES_TO_SIMULATE env variable | `""` |
| `env.RUN_TESTTOOLS` | RUN_TESTTOOLS env variable | `"./scripts/run_netconf_devices/run_netconf_testtool.sh & ./scripts/run_cli_devices/run_devices_docker.sh"` |
| `env.X_TENANT_ID` | X_TENANT_ID env variable | `frinx` |
| `env.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `network-admin` |
| `env.TOPOLOGY_DISCOVERY_BACKUP_ENABLED` | Enable/Disable schedule workflow for topology-discovery backup (0/1) | `0` |
| `extraEnv` | Additional env variables |  |
