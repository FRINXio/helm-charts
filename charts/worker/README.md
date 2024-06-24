# worker

A Helm chart for uniflow worker

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/worker
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/worker
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
| `imagePullSecrets` | Image pull secrets | `[]` |
| `nameOverride` | Replaces the name of the chart in the Chart.yaml file | `""` |
| `fullnameOverride` |  Completely replaces the generated name | `""` |
| `serviceAccount.create` | Create service account | `true` |
| `serviceAccount.annotations` | ServiceAccount annotations | `{}` |
| `serviceAccount.name` | Service account name to use, when empty will be set to created account if `serviceAccount.create` is set else to `default` | `""` |
| `podAnnotations` | Deployment | `{}` |
| `podSecurityContext` | Pod deployment securityContext | `{}` |
| `securityContext` | Deployment securityContext | `{}` |
| `resources` | CPU/Memory resource requests/limits | `{}` |
| `nodeSelector` | Node labels for pod assignment | `{}` |
| `tolerations` | Toleration labels for pod assignment | `[]` |
| `affinity` | Affinity settings for pod assignment | `{}` |
| `deployment.annotations` | Option to specify deployment annotation | `{}` |
| `commands` | Option to specify commands for main container | `[ "python3", "main.py" ]` |
| `workdir` | Option to specify WORKDIR of container. It is used for creating volume for application in non root environment | `/home/app` |
| `initContainers.checkUniconfigReady` | Enable checkUniconfigReady initContainer | true |
| `initContainers.checkConductorReady` | Enable checkConductorReady initContainer | true |
| `initContainers.checkInventoryReady` | Enable checkInventoryReady initContainer | true |
| `initContainers.copyWorkerFiles` | Enable copyWorkerFiles initContainer | true |
| `initContainersUrl.UNICONFIG_URL_BASE` | UNICONFIG_URL_BASE env variable | `http://uniconfig:8181` |
| `initContainersUrl.CONDUCTOR_URL_BASE` | CONDUCTOR_URL_BASE env variable | `http://conductor-server:8080` |
| `initContainersUrl.INVENTORY_URL_BASE` | INVENTORY_URL_BASE env variable | `http://inventory:8000` |
| `env.X_TENANT_ID` | X_TENANT_ID env variable | `frinx` |
| `env.X_AUTH_USER_GROUP` | X_AUTH_USER_GROUP env variable | `network-admin` |
| `env.UNICONFIG_URL_BASE` | UNICONFIG_URL_BASE env variable | `http://uniconfig:8181/rests` |
| `configMaps` | Option to attach configmaps into the pod. [See example in values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/worker/values.yaml) | |
| `extraSecrets` | Option to add secrets into the pod. [See example in values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/worker/values.yaml) | |
| `fileSecrets` | Option to attach secrets as a file into the pod. Need to define secret name, env name and target path. [See example in values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/worker/values.yaml) | |
| `hostPaths` | Option to attach host directories into the pod. Need to define name, mount path and host path. [See example in values.yaml](https://github.com/FRINXio/helm-charts/blob/main/charts/worker/values.yaml) | |

## Preparing a secretFile with Base64 encoding

In certain scenarios, it may be necessary to store sensitive information, such as passwords or API keys, in a secret file. To ensure the security and integrity of this data, it is recommended to encode the file using Base64 before storing it. This documentation outlines the steps to prepare a secret file with Base64 encoding.

### Steps

1. Encode the File in Base64
   To encode the secret file in Base64 format, follow these steps:

   - Open a command prompt or terminal.
   - Use the `base64` command to encode the file. Run the following command:

     ```shell
     base64 -w 0 path/to/your/secret.txt
     ```

   - The command will output the Base64-encoded representation of the secret file. For example:

     ```shell
     cGFzc3dvcmQK
     ```

   The encoded output represents the contents of the secret file in Base64 format.

2. Create the Secret Manifest
   Create a manifest file to define the Secret object that will hold the encoded secret file (multiple secrets can be stored).
   Here's an example YAML manifest:

   ```yaml
   apiVersion: v1
   kind: Secret
   metadata:
     name: secret
   type: Opaque
   data:
     secret.txt: cGFzc3dvcmQK
     password: ZWxpc2ExMjMK
