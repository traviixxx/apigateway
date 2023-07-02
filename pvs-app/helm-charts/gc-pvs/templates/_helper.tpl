{{- define "gc-pvs.containerEnv" -}}
{{- range $name, $value := . }}
- name: {{ .name }}
  {{- if .config}}
  valueFrom:
    configMapKeyRef:
      name: {{ .config | regexFind "^[^/]+" }}
      key: {{ .config | regexFind "/.*" | regexFind "[^/].*" }}
  {{- end }}
  {{- if .secret}}
  valueFrom:
    secretKeyRef:
      name: {{ .secret | regexFind "^[^/]+" }}
      key: {{ .secret | regexFind "/.*" | regexFind "[^/].*"}}
  {{- end }}
  {{- if .fieldPath}}
  valueFrom:
    fieldRef:
      fieldPath: {{ .fieldPath }}
  {{- end }}
  {{- if .value}}
  value: {{ .value }}
  {{- end }}
{{- end }}
{{- end }}

{{- define "gc-pvs.resources" }}
{{- if .Values.resources }}
resources:
{{ toYaml .Values.resources | indent 2 }}
{{- end }}
{{- end }}

{{- define "gc-pvs.probes" }}
startupProbe:
{{- with .Values.startupProbe }}
{{ toYaml . | trim | indent 2 }}
{{- end }}
livenessProbe:
{{- with .Values.livenessProbe }}
{{ toYaml . | trim | indent 2 }}
{{- end }}
readinessProbe:
{{- with .Values.readinessProbe }}
{{ toYaml . | trim | indent 2 }}
{{- end }}
{{- end }}
