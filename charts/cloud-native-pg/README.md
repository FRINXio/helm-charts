# cloud-native-pg

A Helm chart for Kubernetes deployment of the cloud-native-pg

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/cloud-native-pg
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/cloud-native-pg
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter                | Description             | Default        |
| ------------------------ | ----------------------- | -------------- |
| `name` | Cluster name. If not defined, Chart name is used. | `null` |
| `imageName` | Name of the container image, supporting both tags (<image>:<tag>) and digests for deterministic and repeatable deployments (<image>:<tag>@sha256:<digestValue>) | `"ghcr.io/cloudnative-pg/postgresql:12.10@sha256:3cd378bf6b4e6bdc495cf478ca893a3490ecdab5332a614d99d2adb41b1e63ce"` |
| `imagePullPolicy` | Image pull policy | `"IfNotPresent"` |
| `imagePullSecrets` | The list of pull secrets to be used to pull the images | `[]` |
| `instances` | Number of instances required in the cluster | `3` |
| `primaryUpdateStrategy` | Deployment strategy to follow to upgrade the primary server during a rolling update procedure, after all replicas have been successfully updated: it can be automated (unsupervised - default) or manual (supervised) | `"unsupervised"` |
| `primaryUpdateMethod` | Method to follow to upgrade the primary server during a rolling update procedure, after all replicas have been successfully updated: it can be with a switchover (switchover - default) or in-place (restart) | `"switchover"` |
| `startDelay` | The time in seconds that is allowed for a PostgreSQL instance to successfully start up (default 30) | `30` |
| `stopDelay` | The time in seconds that is allowed for a PostgreSQL instance to gracefully shutdown (default 30) | `30` |
| `replicationSlots` | ReplicationSlotsConfiguration encapsulates the configuration of replication slots | `{}` |
| `storage` | StorageConfiguration is the configuration of the storage of the PostgreSQL instances | `{"size": "1Gi"}` |
| `storage.size` | Size of the storage. Required if not already specified in the PVC template. Changes to this field are automatically reapplied to the created PVCs. Size cannot be decreased. | `"1Gi"` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `postgresql` | PostgreSQL configuration options (postgresql.conf) | `{}` |
| `bootstrap.initdb.database` | Name of the database used by the application | `"frinx"` |
| `bootstrap.initdb.owner` | Name of the owner of the database in the instance to be used by applications | `"frinx"` |
| `bootstrap.initdb.secret.name` | User secret reference name | `"frinx-user"` |
| `bootstrap.initdb.postInitSQL` | List of SQL queries to be executed as a superuser immediately after the cluster has been created - to be used with extreme care (by default empty) | `{}` |
| `bootstrap.initdb.postInitTemplateSQL` | List of SQL queries to be executed as a superuser in the template1 after the cluster has been created - to be used with extreme care (by default empty) | `{}` |
| `bootstrap.initdb.postInitApplicationSQL` | List of SQL queries to be executed as a superuser in the application database right after is created - to be used with extreme care (by default empty) | `{}` |
| `bootstrap.initdb.postInitApplicationSQLRefs.configMapRefs` | ConfigMapRefs holds a list of references to ConfigMaps | `{}` |
| `bootstrap.initdb.postInitApplicationSQLRefs.secretRefs` | SecretRefs holds a list of references to Secrets | `{}` |
| `backup` | BackupConfiguration defines how the backup of the cluster are taken. Currently the only supported backup method is barmanObjectStore. For details and examples refer to the Backup and Recovery section of the documentation | `{}` |
| `superuserSecret.name` | Reference name to secret for superuser | `"frinx-superuser"` |
| `monitoring` | MonitoringConfiguration is the type containing all the monitoring configuration for a certain cluster | `{}` |
| `env` | Env follows the Env format to pass environment variables to the pods created in the cluster | `{}` |
| `envFrom` | EnvFrom follows the EnvFrom format to pass environment variables sources to the pods to be used by Env | `{}` |
| `logLevel` | The instances' log level, one of the following values: error, warning, info (default), debug, trace | `"info"` |
| `affinity` | AffinityConfiguration contains the info we need to create the affinity rules for Pods | `{}` |
| `secrets.superuserSecret.name` | superuser secret reference name | `"frinx-superuser"` |
| `secrets.superuserSecret.username` | superuser username | `"postgres"` |
| `secrets.superuserSecret.password` | superuser password | `"postgres"` |
| `secrets.userSecret.name` | user secret reference name | `"frinx-user"` |
| `secrets.userSecret.username` | user username | `"frinx"` |
| `secrets.userSecret.password` | user password | `"postgres"` |
| `secrets.postInitSqlSecret` | postInitSqlSecret secret reference name | `{}` |

## CloudNativePG configuration API reference
More details about configuration can be found on [CloudNativePG API reference](https://cloudnative-pg.io/documentation/1.18/api_reference) page.
