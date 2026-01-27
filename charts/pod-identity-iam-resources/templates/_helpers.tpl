{{/*
Expand the name of the chart.
*/}}
{{- define "pod-identity-iam-resources.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pod-identity-iam-resources.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pod-identity-iam-resources.labels" -}}
helm.sh/chart: {{ include "pod-identity-iam-resources.chart" . }}
{{ include "pod-identity-iam-resources.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pod-identity-iam-resources.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pod-identity-iam-resources.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
IAM Role name for Pod Identity cross-account access
*/}}
{{- define "pod-identity-iam-resources.roleName" -}}
{{- printf "xacct-pod-identity-role-%s-%s" (.Values.moniker | lower) .Values.aws.accountId | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
IAM Policy name for Pod Identity cross-account access
*/}}
{{- define "pod-identity-iam-resources.policyName" -}}
{{- printf "xacct-pod-identity-policy-%s-%s" (.Values.moniker | lower) .Values.aws.accountId | trunc 63 | trimSuffix "-" }}
{{- end }}
