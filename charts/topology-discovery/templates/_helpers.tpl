{{/*
Expand the name of the chart.
*/}}
{{- define "topology-discovery.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "topology-discovery.fullname" -}}
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
{{- define "topology-discovery.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "topology-discovery.labels" -}}
helm.sh/chart: {{ include "topology-discovery.chart" . }}
{{ include "topology-discovery.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "topology-discovery.selectorLabels" -}}
app.kubernetes.io/name: {{ include "topology-discovery.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "topology-discovery.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "topology-discovery.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get the password secret.
*/}}
{{- define "topology-discovery.secretName" -}}
{{- if .Values.dbPersistence.existingSecret.secretName }}
    {{- printf "%s" (tpl .Values.dbPersistence.existingSecret.secretName $) -}}
{{- else -}}
    {{- printf "%s" (include "topology-discovery.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "topology-discovery.createSecret" -}}
{{- if not .Values.dbPersistence.existingSecret.secretName -}}
    {{- true -}}
{{- end -}}
{{- end -}}