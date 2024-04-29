{{/*
Return true if a script configMap object should be created
*/}}
{{- define "uniconfig.createScriptConfigMap" -}}
{{- if not .Values.extraScriptConfigMap -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the uniconfig script configMap.
*/}}
{{- define "uniconfig.scriptConfigMapName" -}}
{{- if .Values.extraScriptConfigMap }}
    {{- printf "%s" (tpl .Values.extraScriptConfigMap $) -}}
{{- else -}}
    {{- printf "%s-configmap-uniconfig-script" (include "uniconfig.fullname" .) -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a Logback configMap object should be created
*/}}
{{- define "uniconfig.createLogbackConfigMap" -}}
{{- if not .Values.extraLogbackConfigMap -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Get the uniconfig Logback configMap.
*/}}
{{- define "uniconfig.logbackConfigMapName" -}}
{{- if .Values.extraLogbackConfigMap }}
    {{- printf "%s" (tpl .Values.extraLogbackConfigMap $) -}}
{{- else -}}
    {{- printf "%s-configmap-logback" (include "uniconfig.fullname" .) -}}
{{- end -}}
{{- end -}}
