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

{{/*
Generate role name from role object
*/}}
{{- define "pod-identity-iam-resources.rolename" -}}
{{- $values := .Values }}
{{- $release := .Release }}
{{- $role := .role }}
{{- if $values.clusterName }}
{{- printf "%s-%s" (lower $values.clusterName) $role.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (lower $release.Name) $role.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Generate role name from role name string
*/}}
{{- define "pod-identity-iam-resources.rolenameFromString" -}}
{{- $values := .Values }}
{{- $release := .Release }}
{{- $roleName := .roleName }}
{{- if $values.clusterName }}
{{- printf "%s-%s" (lower $values.clusterName) $roleName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (lower $release.Name) $roleName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Generate policy name from policy object
*/}}
{{- define "pod-identity-iam-resources.policyname" -}}
{{- $values := .Values }}
{{- $release := .Release }}
{{- $policy := .policy }}
{{- if $values.clusterName }}
{{- printf "%s-%s" (lower $values.clusterName) $policy.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (lower $release.Name) $policy.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Generate policy name from policy name string
*/}}
{{- define "pod-identity-iam-resources.policynameFromString" -}}
{{- $values := .Values }}
{{- $release := .Release }}
{{- $policyName := .policyName }}
{{- if $values.clusterName }}
{{- printf "%s-%s" (lower $values.clusterName) $policyName | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (lower $release.Name) $policyName | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Generate pod identity association name
*/}}
{{- define "pod-identity-iam-resources.podIdentityAssociationName" -}}
{{- $values := .Values }}
{{- $release := .Release }}
{{- $podIdentity := .podIdentity }}
{{- if $values.clusterName }}
{{- printf "%s-%s" (lower $values.clusterName) $podIdentity.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" (lower $release.Name) $podIdentity.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}