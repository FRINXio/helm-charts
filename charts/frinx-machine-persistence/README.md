# frinx-machine-persistence

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-machine-persistence
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-machine-persistence
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://FRINXio.github.io/helm-charts | workflow-manager-postgres(cloud-native-pg) | 0.0.2 |
| https://FRINXio.github.io/helm-charts | uniconfig-postgres(cloud-native-pg) | 0.0.2 |
| https://FRINXio.github.io/helm-charts | frinx-arango-config | 4.2.0 |
| https://charts.bitnami.com/bitnami | kafka | 25.2.0 |
| https://charts.bitnami.com/bitnami | timescale-db(postgresql) | 11.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| frinx-arango-config.arangodb_config.enabled | bool | `true` |  |
| frinx-arango-config.arangodb_config.image.repository | string | `"arangodb/arangodb"` |  |
| frinx-arango-config.arangodb_config.image.tag | string | `"3.11.8"` |  |
| frinx-arango-config.arangodb_config.securityContext.fsGroup | int | `3000` |  |
| frinx-arango-config.arangodb_config.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| frinx-arango-config.arangodb_config.securityContext.runAsGroup | int | `2000` |  |
| frinx-arango-config.arangodb_config.securityContext.runAsUser | int | `1000` |  |
| frinx-arango-config.enabled | bool | `true` |  |
| global.dbPersistence.enabled | bool | `true` |  |
| global.dbPersistence.secretName | string | `"frinx-database-password"` |  |
| global.dbPersistence.secrets.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_PASSWORD | string | `"conductor"` |  |
| global.dbPersistence.secrets.CONDUCTOR_EXTERNALPAYLOADSTORAGE_POSTGRES_USERNAME | string | `"conductor_user"` |  |
| global.dbPersistence.secrets.INVENTORY_POSTGRES_PASSWORD | string | `"inventory"` |  |
| global.dbPersistence.secrets.INVENTORY_POSTGRES_USERNAME | string | `"inventory_user"` |  |
| global.dbPersistence.secrets.RM_POSTGRES_PASSWORD | string | `"resource"` |  |
| global.dbPersistence.secrets.RM_POSTGRES_USERNAME | string | `"resource_user"` |  |
| global.dbPersistence.secrets.SCHELLAR_POSTGRES_PASSWORD | string | `"schellar"` |  |
| global.dbPersistence.secrets.SCHELLAR_POSTGRES_USERNAME | string | `"schellar_user"` |  |
| global.dbPersistence.secrets.SPRING_DATASOURCE_PASSWORD | string | `"conductor"` |  |
| global.dbPersistence.secrets.SPRING_DATASOURCE_USERNAME | string | `"conductor_user"` |  |
| global.dbPersistence.secrets.SPRING_SEARCHDATASOURCE_PASSWORD | string | `"conductor"` |  |
| global.dbPersistence.secrets.SPRING_SEARCHDATASOURCE_USERNAME | string | `"conductor_user"` |  |
| global.dbPersistence.secrets.TD_ARANGO_ROOT_PASSWORD | string | `"frinx"` |  |
| global.dbPersistence.secrets.TD_ARANGO_USERNAME | string | `"root"` |  |
| global.dbPersistence.secrets.UNICONFIG_CLISHELL_SSHSERVER_USERNAMEPASSWORDAUTH_PASSWORD | string | `"admin"` |  |
| global.dbPersistence.secrets.UNICONFIG_POSTGRES_PASSWORD | string | `"postgresP"` |  |
| global.dbPersistence.secrets.UNICONFIG_POSTGRES_USERNAME | string | `"postgresU"` |  |
| kafka.configurationOverrides."log.retention.hours" | int | `168` |  |
| kafka.controller.replicaCount | int | `1` |  |
| kafka.enabled | bool | `true` |  |
| kafka.fullnameOverride | string | `"kafka"` |  |
| kafka.listeners.client.protocol | string | `"PLAINTEXT"` |  |
| kafka.persistence.enabled | bool | `true` |  |
| kafka.persistence.size | string | `"10Gi"` |  |
| kafka.provisioning.enabled | bool | `true` |  |
| kafka.provisioning.topics[0].config."flush.messages" | int | `1` |  |
| kafka.provisioning.topics[0].config."max.message.bytes" | int | `64000` |  |
| kafka.provisioning.topics[0].name | string | `"device-inventory"` |  |
| kafka.provisioning.topics[0].partitions | int | `1` |  |
| kafka.provisioning.topics[0].replicationFactor | int | `1` |  |
| timescale-db.architecture | string | `"standalone"` |  |
| timescale-db.auth.database | string | `"performancemonitor"` |  |
| timescale-db.auth.enablePostgresUser | bool | `true` |  |
| timescale-db.auth.password | string | `"postgresP"` |  |
| timescale-db.auth.username | string | `"postgresU"` |  |
| timescale-db.enabled | bool | `true` |  |
| timescale-db.fullnameOverride | string | `"timescale-db"` |  |
| timescale-db.image.repository | string | `"timescale/timescaledb-ha"` |  |
| timescale-db.image.tag | string | `"pg16-ts2.15-all"` |  |
| timescale-db.primary.initdb.scripts."init_db.sql" | string | `"CREATE EXTENSION IF NOT EXISTS timescaledb;\n"` |  |
| uniconfig-postgres.bootstrap.initdb.database | string | `"uniconfig"` |  |
| uniconfig-postgres.bootstrap.initdb.owner | string | `"postgresU"` |  |
| uniconfig-postgres.enabled | bool | `true` |  |
| uniconfig-postgres.imageName | string | `"ghcr.io/cloudnative-pg/postgresql:12.18"` |  |
| uniconfig-postgres.name | string | `"uniconfig-postgresql"` |  |
| uniconfig-postgres.postgresql.parameters.max_connections | string | `"300"` |  |
| uniconfig-postgres.secrets.superuserSecret.password | string | `"postgres"` |  |
| uniconfig-postgres.secrets.superuserSecret.username | string | `"postgres"` |  |
| uniconfig-postgres.secrets.userSecret.password | string | `"postgresP"` |  |
| uniconfig-postgres.secrets.userSecret.username | string | `"postgresU"` |  |
| uniconfig-postgres.storage.resizeInUseVolumes | bool | `true` |  |
| uniconfig-postgres.storage.size | string | `"10Gi"` |  |
| workflow-manager-postgres.bootstrap.initdb.postInitApplicationSQLRefs.secretRefs[0].key | string | `"secret.sql"` |  |
| workflow-manager-postgres.bootstrap.initdb.postInitApplicationSQLRefs.secretRefs[0].name | string | `"postgresql-post-init-sql-secret"` |  |
| workflow-manager-postgres.enabled | bool | `true` |  |
| workflow-manager-postgres.imageName | string | `"ghcr.io/cloudnative-pg/postgresql:12.18"` |  |
| workflow-manager-postgres.name | string | `"postgresql"` |  |
| workflow-manager-postgres.postgresql.parameters.max_connections | string | `"300"` |  |
| workflow-manager-postgres.secrets.postInitSqlSecret.sql | string | `"CREATE ROLE schellar LOGIN PASSWORD 'schellar';\nGRANT CONNECT ON DATABASE frinx TO schellar;\nCREATE USER schellar_user WITH PASSWORD 'schellar';\nGRANT schellar TO schellar_user;\nCREATE SCHEMA schellar AUTHORIZATION schellar;\nALTER ROLE schellar SET search_path=schellar;\nALTER USER schellar_user SET search_path TO schellar;\nCREATE ROLE inventory LOGIN PASSWORD 'inventory';\nGRANT CONNECT ON DATABASE frinx TO inventory;\nCREATE USER inventory_user WITH PASSWORD 'inventory';\nGRANT inventory TO inventory_user;\nCREATE SCHEMA inventory AUTHORIZATION inventory;\nALTER ROLE inventory SET search_path=inventory;\nALTER USER inventory_user SET search_path TO inventory;\nCREATE ROLE conductor LOGIN PASSWORD 'conductor';\nGRANT CONNECT ON DATABASE frinx TO conductor;\nCREATE USER conductor_user WITH PASSWORD 'conductor';\nGRANT conductor TO conductor_user;\nCREATE SCHEMA conductor AUTHORIZATION conductor;\nCREATE SCHEMA archive AUTHORIZATION conductor;\nCREATE SCHEMA external AUTHORIZATION conductor;\nALTER ROLE conductor SET search_path=public,conductor,archive,external;\nALTER USER conductor_user SET search_path TO conductor,archive,external;\nCREATE ROLE resource LOGIN PASSWORD 'resource';\nGRANT CONNECT ON DATABASE frinx TO resource;\nCREATE USER resource_user WITH PASSWORD 'resource';\nGRANT resource TO resource_user;\nCREATE SCHEMA resource AUTHORIZATION resource;\nALTER ROLE resource SET search_path=resource;\nALTER USER resource_user SET search_path TO resource;"` |  |
| workflow-manager-postgres.secrets.superuserSecret.password | string | `"postgres"` |  |
| workflow-manager-postgres.secrets.superuserSecret.username | string | `"postgres"` |  |
| workflow-manager-postgres.secrets.userSecret.password | string | `"postgres"` |  |
| workflow-manager-postgres.secrets.userSecret.username | string | `"frinx"` |  |
| workflow-manager-postgres.storage.resizeInUseVolumes | bool | `true` |  |
| workflow-manager-postgres.storage.size | string | `"100Gi"` |  |
| x-frinx-database-password | string | `"frinx-database-password"` |  |
| x-frinx-image-pull-secret | string | `"regcred"` |  |
| x-frinx-machine-version | float | `6.1` |  |
| x-frinx-rbac-admin-role | string | `"FRINXio"` |  |

