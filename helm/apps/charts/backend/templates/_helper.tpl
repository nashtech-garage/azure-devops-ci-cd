{{- define "app.label" -}}
  {{- $name := printf "app: %s" .Chart.Name -}}
  {{- $name -}}
{{- end -}}