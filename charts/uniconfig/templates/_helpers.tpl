{{/*
Expand the name of the chart.
*/}}
{{- define "uniconfig.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "uniconfig.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "uniconfig.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "uniconfig.labels" -}}
helm.sh/chart: {{ include "uniconfig.chart" . }}
{{ include "uniconfig.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "uniconfig.selectorLabels" -}}
app.kubernetes.io/name: {{ include "uniconfig.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "uniconfig.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "uniconfig.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get the password secret.
*/}}
{{- define "uniconfig.secretName" -}}
{{- if .Values.dbPersistence.existingSecret.secretName }}
    {{- printf "%s" (tpl .Values.dbPersistence.existingSecret.secretName $) -}}
{{- else -}}
    {{- printf "%s" (include "uniconfig.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "uniconfig.createSecret" -}}
{{- if not .Values.dbPersistence.existingSecret.secretName -}}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Return true if a storage secret object should be created
*/}}
{{- define "uniconfig.createStorageSecret" -}}
{{- if and (not .Values.azure.AKS.storage.existingSecret) (.Values.azure.AKS.enabled) -}}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Selector labels
*/}}
{{- define "uniconfig.selectorLabelsForTraefik" -}}
app.kubernetes.io/name: {{ .Values.highAvailability.traefik.selectorName | default "uc-zone-lb" }}
app.kubernetes.io/instance: {{ .Values.highAvailability.traefik.selectorInstance | default .Release.Name }}-{{ .Release.Namespace }}
{{- end }}

{{/*
Get the uniconfig data volume.
*/}}
{{- define "uniconfig.data-volume" -}}
    {{- printf "%s-data" (include "uniconfig.fullname" .) -}}
{{- end -}}

{{/*
Get the uniconfig logs volume.
*/}}
{{- define "uniconfig.logs-volume" -}}
    {{- printf "%s-logs" (include "uniconfig.fullname" .) -}}
{{- end -}}

{{/*
Get the uniconfig logback volume.
*/}}
{{- define "uniconfig.logback-volume" -}}
    {{- printf "%s-logback" (include "uniconfig.fullname" .) -}}
{{- end -}}

