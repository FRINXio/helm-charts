# frinx-arango-config

A Helm chart for Kubernetes deployment of the Arango CRD and ArangoDB configuration files

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-arango-config
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-arango-config
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `arangodb_config.enabled` | Deploy custom ArangoDeployment | `false` |
| `arangodb_config.image.repository` | Image repository | `arangodb/arangodb` |
| `arangodb_config.image.tag` | mage tag | `""` |
| `arango_operator_secret.affinity` | Configure ArangoDB affinity | `{}` |
| `arangodb_config.tokenSecretName` | ArangoDB jwt token name | `arangodb-jwt` |
| `arangodb_config.bearerSecretName` | ArangoDB bearer token name | `arangodb-bearer` |
| `arangodb_config.token` | ArangoDB jwt token value | `""` |
| `arangodb_config.bearer` | ArangoDB bearer token value generated from jwt token | `""` |
| `arangodb_config.rootSecretName` | Secret name for ArangoDB root password configuration  | `frinx` |
| `arangodb_config.rootSecretPassword` | Default password for ArangoDB root user | `frinx` |
| `arangodb_config.resources` | CPU/Memory resource requests/limits | `{}` |
| `arangodb_config.securityContext` | SecurityContext for ArangoDeployment | `{}` |
| `arango_operator_secret.username` | Default user for Arango operator  | `frinx` |
| `arango_operator_secret.password` | Default password for Arango operator | `frinx` |
