FROM golang:1.27-alpine

RUN go install github.com/open-telemetry/opentelemetry-collector-contrib/cmd/telemetrygen@latest

ENTRYPOINT ["telemetrygen"]

CMD ["traces", "--otlp-endpoint", "otel-collector:4317", "--otlp-insecure", "--duration", "inf"]
