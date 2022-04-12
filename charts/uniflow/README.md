# uniflow

FRINX UniFlow enables customers to create automated, repeatable, digital processes to build, grow and operate their digital communication infrastructure.

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/uniflow
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/uniflow
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
| `imageProxy.repository` | Image repository | `frinx/workflow-proxy` |
| `imageProxy.pullPolicy` | Image pull policy | `IfNotPresent` |
| `imageProxy.tag` | Image tag | `"1.0.7"` |
| `imagePullSecrets` | Image pull secrets | `[]` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `"workflow-proxy"` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | `{}` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Kubernetes port where workflow-proxy is exposed | `8088` |
| `service.portWorkers` | Kubernetes port where worker is exposed | `8089` |
| `service.portSchellar` | Kubernetes port where schellar is exposed | `8089` |
| `service.portConductor` | Kubernetes port where conductor is exposed | `8080` |
| `ingress.enabled` | Enables Ingress | `false` |
| `ingress.annotations` | Ingress annotations (values are templated) | `{}` |
| `ingress.hosts` | Ingress accepted hostnames  | `[]` |
| `ingress.tls` | Ingress TLS configuration | `[]` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `resourcesProxy` | CPU/Memory resource requests/limits | `{}` |
| `autoscaling.enabled` | Enable replica autoscaling settings | `false` |
| `autoscaling.minReplicas` | Minimum replicas for the pod autoscaling | `2` |
| `autoscaling.maxReplicas` | Maximum replicas for the pod autoscaling | `3` |
| `autoscaling.targetCPUUtilizationPercentage` | Percentage of CPU to consider when autoscaling | `80` |
| `autoscaling.targetMemoryUtilizationPercentage` | Percentage of Memory to consider when autoscaling | |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `configScripts.config.properties` | config.properties file for conductor | `{{- .Files.Get "configs/config.properties" }}` |
| `configScripts.log4j.properties` | log4j.properties file for conductor | `{{ .Files.Get "configs/log4j.properties" }}` |
| `env.CONFIG_PROP` | CONFIG_PROP env value | `config.properties` |
| `env._JAVA_OPTIONS` | _JAVA_OPTIONS env value | `-Xmx2g` |
| `env.LOG4J_PROP` | LOG4J_PROP env value | `log4j.properties` |
| `env.ELASTIC_CLUSTER_HEALTH_COLOR` | ELASTIC_CLUSTER_HEALTH_COLOR env value | `yellow` |
| `env.SCHELLAR_TARGET` | SCHELLAR_TARGET env value | `http://schellar:3000` |
| `env.SPRING_DATASOURCE_URL` | SPRING_DATASOURCE_URL env value | `jdbc:postgresql://postgresql:5432/conductor?charset=utf8&parseTime=true&interpolateParams=true` |
| `env.SPRING_DATASOURCE_USERNAME` | SPRING_DATASOURCE_USERNAME env value | `postgres` |
| `env.SPRING_DATASOURCE_PASSWORD` | SPRING_DATASOURCE_PASSWORD env value | `postgres` |
| `env.CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_URL` | CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_URL env value | `jdbc:postgresql://postgresql:5432/conductor?charset=utf8&parseTime=true&interpolateParams=true` |
| `env.CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_USERNAME` | CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_USERNAME env value | `postgres` |
| `env.CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_PASSWORD` | CONDUCTOR_EXTERNAL_PAYLOAD_STORAGE_POSTGRES_PASSWORD env value | `postgres` |
| `env.CONDUCTOR_ELASTICSEARCH_URL` | CONDUCTOR_ELASTICSEARCH_URL env value | `http://elasticsearch-master-headless:9200` |
| `schellarEnv.LOG_LEVEL` | LOG_LEVEL env value for schellar | `debug` |
| `schellarEnv.CHECK_INTERVAL_SECONDS` | CHECK_INTERVAL_SECONDS env value for schellar | `debug` |
| `schellarEnv.CONDUCTOR_API_URL` | CONDUCTOR_API_URL env value for schellar | `http://conductor:8080/api` |
| `schellarEnv.BACKEND` | BACKEND env value for schellar | `postgres` |
| `schellarEnv.POSTGRES_MIGRATIONS_DIR` | POSTGRES_MIGRATIONS_DIR env value for schellar | `postgres` |
| `schellarEnv.POSTGRES_PORT` | POSTGRES_PORT env value for schellar | `5432` |
| `schellarEnv.POSTGRES_DATABASE_URL` | POSTGRES_DATABASE_URL env value for remote database for schellar | `"host=postgresql port=5432 user=postgres password=postgres database=schellar"` |
| `elasticsearch.enabled` | Switch to enable or disable the elasticsearch helm chart | `true` |
| `elasticsearch.replicas` | Number of replics | `1` |
| `elasticsearch.minimumMasterNodes` | Minimum number of master nodes | `1` |
| `elasticsearch.imageTag` | Image tag| `6.7.1` |
| `resources` | Resources for elasticsearch | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/uniflow/values.yaml) |
| `elasticsearch.volumeClaimTemplate.resources.requests.storage` | Requests for storage space | `1Gi` |
| `elasticsearch.clusterHealthCheckParams` | Cluster health check params | `"wait_for_status=yellow&timeout=5s"` |
| `postgresql.enabled` | Switch to enable or disable the PostgreSQL helm chart | `true` |
| `postgresql.auth.enablePostgresUser` | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user | `true` |
| `postgresql.auth.username` | Name for a custom user to create | `postgresU` |
| `postgresql.auth.password` | Password for the custom user to create | `postgresP` |
| `postgresql.auth.database` | Name for a custom database to create | `conductor` |
| `postgresql.architecture` | PostgreSQL architecture (`standalone` or `replication`) | `standalone` |
| `postgresql.primary.initdb.scripts.init_db.sql` | Init script for creating another databases | See [values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/uniflow/values.yaml) |
