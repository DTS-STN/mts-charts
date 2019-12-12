{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "elk.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "elk.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "elk.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "elk.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Print Host URL
*/}}
{{- define "elk.url" -}}
{{- if .Values.elk.ingress.enabled }}
{{- if .Values.elk.ingress.tls }}
{{- range .Values.elk.ingress.tls }}{{ range .hosts }}https://{{ . }}{{ end }}{{ end }}
{{- else }}
{{- range .Values.elk.ingress.hosts }}http://{{ . }}{{ end }}
{{- end }}
{{- end }}
{{- end -}}

{{/*
Create a default fully qualified elasticsearch name or use the `elk.elasticsearch.hosts` value if defined.
Or use chart dependencies with release name
*/}}
{{- define "elk.elasticsearch.hosts" -}}
{{- if .Values.elk.elasticsearch.hosts }}
    {{- .Values.elk.elasticsearch.hosts -}}
{{- else }}
    {{- printf "http://%s-elasticsearch-client.%s.svc.cluster.local:9200" .Release.Name .Release.Namespace -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified mongodb name or use the `elk.mongodb.uri` value if defined.
Or use chart dependencies with release name
*/}}
{{- define "elk.mongodb.uri" -}}
{{- if .Values.elk.mongodb.uri }}
    {{- .Values.elk.mongodb.uri -}}
{{- else }}
    {{- printf "mongodb://%s-mongodb-replicaset.%s.svc.cluster.local:27017/elk?replicaSet=rs0" .Release.Name .Release.Namespace -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "elk.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
