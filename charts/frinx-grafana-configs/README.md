# frinx-grafana-configs

A Helm chart for Kubernetes deployment of the Frinx Grafana dashboards and datasources

## Get Repo Info

```console
helm repo add frinx https://FRINXio.github.io/helm-charts
helm repo update
```

## Install Chart

```console
helm install [RELEASE_NAME] frinx/frinx-grafana-configs
```

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] frinx/frinx-grafana-configs
```

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

## Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `dashboards.files` | Rexeg to select frinx-machine dashboards | `config/*` |
| `datasources.influxdb2.url` | InfluxDB datasource url | `http://influxdb` |
| `datasources.influxdb2.name` | InfluxDB datasource name | `InfluxDB` |
| `datasources.influxdb2.url` | InfluxDB datasource url | `http://influxdb` |
| `datasources.influxdb2.basicAuth` | InfluxDB datasource basic auth setup | `true` |
| `datasources.influxdb2.basicAuthUser` | InfluxDB datasource username | `frinx` |
| `datasources.influxdb2.basicAuthPassword` |  InfluxDB datasource password | `frinx123!` |
| `datasources.influxdb2.token` | InfluxDB datasource token | `eyJrIjoiN09MSVpVZjlVRG1xNHlLNXpVbmZJOXFLWU1GOXFxNEIiLCJuIjoic3Nzc3MiLCJpZCI6MX0` |
| `datasources.influxdb2.defaultBucket` | InfluxDB datasource bucket | `frinx` |
| `datasources.influxdb2.organization` | InfluxDB datasource organization | `frinx-machine` |
| `datasources.influxdb2.httpMode` | InfluxDB datasource http method | `POST` |
| `datasources.loki.name` | InfluxDB datasource name | `Loki` |
| `datasources.loki.url` | InfluxDB datasource url | `http://loki:3100` |
| `extraDatasources` | Additional grafana datasources (yaml format) |  |

