# topology-discovery

A Helm chart for the Topology Discovery

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/topology-discovery
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

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/topology-discovery` |
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
| `service.port` | Kubernetes port where service is exposed | `5000` |
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname  | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `1` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `10` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `dbPersistence.ARANGO_USERNAME` | ARANGO_USERNAME env variable | `root` |
| `dbPersistence.ARANGO_ROOT_PASSWORD` | ARANGO_ROOT_PASSWORD env variable | `frinx` |
| `dbPersistence.ARANGO_URL` | ARANGO_URL env variable | `http://arangodb:8529` |
| `dbPersistence.existingSecret` | Configure ARANGO connection via existing secret | `` |
| `env.UC_URL_BASE` | UC_URL_BASE env variable | `http://uniconfig:8181/rests` |
| `env.CONDUCTOR_URL` | CONDUCTOR_URL env variable is used to build healthcheck and worker api url | `http://conductor-server:8080` |
| `env.BGPLS_ENABLED` | BGPLS_ENABLED env variable | `false` |
| `env.BGPLS_NETWORK` | BGPLS_NETWORK env variable | `172.18.0.0/16` |
| `env.BGPLS_ROUTER_ID` | BGPLS_ROUTER_ID env variable | `192.168.99.1` |
| `env.BGPLS_NEIGHBOR_IP` | BGPLS_NEIGHBOR_IP env variable | `192.168.99.100` |
| `env.BGPLS_LOCAL_AS` | BGPLS_LOCAL_AS env variable | `100` |
| `env.BGPLS_PEER_AS` | BGPLS_PEER_AS env variable | `100` |
| `env.ADMIN` | BGPLS_PEER_AS env variable | `admin` |
| `env.EDITOR` | BGPLS_PEER_AS env variable | `editor` |
| `env.VIEWER` | BGPLS_PEER_AS env variable | `viewer` |
| `env.IMPORT_ARANGO_DEMO_DATA` | Option to add demo data into topology-discovery | `false` |
| `env.IMPORT_DEVICE_INVENTORY_DATA` | Option to add demo data into inventory | `false` |
| `env.X_TENANT_ID` | X_TENANT_ID env variable | `"frinx"` |
