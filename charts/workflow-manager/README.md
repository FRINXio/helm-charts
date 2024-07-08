# workflow-manager

FRINX Workflow-Manager enables customers to create automated, repeatable, digital processes to build, grow and operate their digital communication infrastructure.

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/workflow-manager
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/workflow-manager
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | Number of nodes | `1` |
| `image.repository` | Image repository | `frinx/uniflow-conductor-server` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `image.tag` | Image tag | `""` |
| `schellarImage.repository` | Image repository | `frinx/uniflow-schellar` |
| `schellarImage.pullPolicy` | Image pull policy | `IfNotPresent` |
| `schellarImage.tag` | Image tag | `"6.0.0"` |
| `imagePullSecrets` | Image pull secrets | `[]` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `"conductor"` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/workflow-manager/values.yaml) |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.portSchellar` | Kubernetes port where schellar is exposed | `3000` |
| `service.portConductor` | Kubernetes port where conductor is exposed | `8080` |
| `ingress.enabled` | Enable [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/). | `false` |
| `ingress.labels` | Ingress labels | `{}` |
| `ingress.annotations` | Annotations to be added to the ingress. | `{}` |
| `ingress.className` | Ingress [class name](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-class). | `""` |
| `ingress.tls` | Enable or disable tls attribute in ingress | `false` |
| `ingress.hosts` | Ingress accepted hostname for conductor | `""` |
| `ingress.schellarHosts` | Ingress accepted hostname for schellar | `""` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `2` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `3` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `conductorEnv.CONFIG_PROP` | CONFIG_PROP env value | `config.properties` |
| `conductorEnv._JAVA_OPTIONS` | _JAVA_OPTIONS env value | `-Xmx2g` |
| `conductorEnv.LOG4J_PROP` | LOG4J_PROP env value on specified image path | `/app/config/log4j-cluster.properties` |
| `conductorEnv.SPRING_DATASOURCE_HOSTNAME` | Hostname of external database | |
| `conductorEnv.CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_HOSTNAME` | CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_HOSTNAME env value | |
| `conductorEnv.DATABASE` | DATABASE env value | `conductor` |
| `conductorEnv.SPRING_SEARCHDATASOURCE_HOSTNAME` | SPRING_SEARCHDATASOURCE_HOSTNAME env value | |
| `conductorExtraEnv`| Extra env variables for conductor | |
| `schellarEnv.LOG_LEVEL` | LOG_LEVEL env value for schellar | `debug` |
| `schellarEnv.CHECK_INTERVAL_SECONDS` | CHECK_INTERVAL_SECONDS env value for schellar | `debug` |
| `schellarEnv.CONDUCTOR_API_URL` | CONDUCTOR_API_URL env value for schellar | `http://localhost:8080/api` |
| `schellarEnv.BACKEND` | BACKEND env value for schellar | `postgres` |
| `schellarEnv.PLAYGROUND_QUERY_ENDPOINT` | PLAYGROUND_QUERY_ENDPOINT env value for schellar | `/api/schedule` |
| `schellarEnv.POSTGRES_MIGRATIONS_DIR` | POSTGRES_MIGRATIONS_DIR env value for schellar | `postgres` |
| `schellarExtraEnv`| Extra env variables for schellar | [] |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true` |
| `postgresql.auth.username` | Name for a custom user to create | `postgresU` |
| `postgresql.auth.password` | Password for the custom user to create | `postgresP` |
| `postgresql.auth.database` | Name for a custom database to create | `conductor` |
| `postgresql.architecture` | PostgreSQL architecture (`standalone` or `replication`) | `standalone` |
| `postgresql.primary.initdb.scripts.init_db.sql` | Init script for creating another databases | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/workflow-manager/values.yaml) |
| `rbac.WM_ADMIN_GROUPS` | Rbac admin roles setting | `"NETWORK-ADMIN"` |  |
| `rbac.WM_ADMIN_ROLES` | Rbac admin groups setting | `"OWNER"` |  |