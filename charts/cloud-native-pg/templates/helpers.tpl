{{/*
Expand the name of the chart.
*/}}
{{- define "cloud-native-pg.fullname" -}}
{{- or $.Values.name $.Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Return true if a secret object should be created
*/}}
{{- define "cloud-native-pg.createSuperuserSecret" -}}
{{- if (.Values.secrets.superuserSecret) -}}
    {{- if (not .Values.secrets.superuserSecret.existingSecret ) -}}
        {{- true -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "cloud-native-pg.superUserSecretName" -}}
{{- if .Values.secrets.superuserSecret.existingSecret }}
    {{- printf "%s" (tpl  .Values.secrets.superuserSecret.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-frinx-superuser"  (include "cloud-native-pg.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "cloud-native-pg.createUserSecret" -}}
{{- if (.Values.secrets.userSecret) -}}
    {{- if (not .Values.secrets.userSecret.existingSecret ) -}}
        {{- true -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "cloud-native-pg.userSecretName" -}}
{{- if .Values.secrets.userSecret.existingSecret }}
    {{- printf "%s" (tpl  .Values.secrets.userSecret.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-frinx-user"  (include "cloud-native-pg.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "cloud-native-pg.createPostInitSqlSecret" -}}
{{- if (.Values.secrets.postInitSqlSecret) -}}
    {{- if (not .Values.secrets.postInitSqlSecret.existingSecret ) -}}
        {{- true -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "cloud-native-pg.postInitSqlSecretName" -}}
{{- if .Values.secrets.postInitSqlSecret.existingSecret }}
    {{- printf "%s" (tpl  .Values.secrets.postInitSqlSecret.existingSecret $) -}}
{{- else -}}
    {{- printf "%s-post-init-sql-secret"  (include "cloud-native-pg.fullname" .) -}}
{{- end -}}
{{- end -}}