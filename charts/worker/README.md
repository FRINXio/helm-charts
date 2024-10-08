# worker

A Helm chart for conductor workers

![Version: 4.1.0](https://img.shields.io/badge/Version-4.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 6.1.0](https://img.shields.io/badge/AppVersion-6.1.0-informational?style=flat-square)

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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | [Affinity for pod assignment](https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity) |
| commands | list | `["python3","main.py"]` | Application commands |
| configMaps | string | `nil` |  |
| deployment.annotations | object | `{}` |  |
| env | object | `{"CONDUCTOR_URL_BASE":"http://conductor-server:8080/api","SCHELLAR_URL_BASE":"http://conductor-server:3000/query","UNICONFIG_URL_BASE":"http://uniconfig:8181/rests","X_AUTH_USER_GROUP":"network-admin","X_TENANT_ID":"frinx"}` | Application properties |
| extraSecrets | string | `nil` |  |
| fileSecrets | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| hostPaths | string | `nil` |  |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"frinx/demo-workflows"` | Demo-workflows image repository |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| initContainers | object | `{"checkConductorReady":true,"checkInventoryReady":true,"checkUniconfigReady":true,"copyWorkerFiles":true}` | Init containers |
| initContainersUrl | object | `{"CONDUCTOR_URL_BASE":"http://conductor-server:8080","INVENTORY_URL_BASE":"http://inventory:8000","UNICONFIG_URL_BASE":"http://uniconfig:8181"}` | Init containers URL |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` | [Node labels for pod assignment](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| podAnnotations | object | `{}` | Pod annotations |
| podSecurityContext | object | `{}` | Configure [Pods Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-pod) |
| replicaCount | int | `1` | Number of replicas of the deployment |
| resources | object | `{}` | [Container resources](https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/) |
| securityContext | object | `{}` | Configure [Container Security Context](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container) |
| service.monitorPort | int | `8000` | Monitoring port |
| service.port | int | `80` | Service port |
| service.type | string | `"ClusterIP"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | [Tolerations for pod assignment](https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/) |
| utilitiesImage.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| utilitiesImage.repository | string | `"frinx/utilities-alpine"` | utilities image repository |
| utilitiesImage.tag | string | `"1.2"` | Overrides the image tag. |
| workdir | string | `"/home/app"` |  |
