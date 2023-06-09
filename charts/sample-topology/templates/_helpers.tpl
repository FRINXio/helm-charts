{{/*
Expand the name of the chart.
*/}}
{{- define "sample-topology.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sample-topology.fullname" -}}
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
{{- define "sample-topology.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sample-topology.labels" -}}
helm.sh/chart: {{ include "sample-topology.chart" . }}
{{ include "sample-topology.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sample-topology.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sample-topology.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sample-topology.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sample-topology.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return true if a secret object for repository should be created
*/}}
{{- define "sample-topology.createRepositorySecret" -}}
{{- if and (not .Values.externalConfig.auth.existingSecret) (.Values.externalConfig.enabled) -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "sample-topology.secretRepositoryName" -}}
{{- if .Values.externalConfig.auth.existingSecret }}
    {{- printf "%s" (tpl .Values.externalConfig.auth.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-repository"  (include "sample-topology.fullname" .) -}}
{{- end -}}
{{- end -}}