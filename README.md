## References

- [OpenTelemetry - Internal Metrics](https://opentelemetry.io/docs/collector/internal-telemetry/#lists-of-internal-metrics)
- [OpenTelemetry Collector - GitHub Repo](https://github.com/open-telemetry/opentelemetry-collector/tree/v0.165.0)
- [OpenTelemetry Collector Extension - zPages](https://github.com/open-telemetry/opentelemetry-collector/blob/main/extension/zpagesextension/README.md)
- [LangFuse - OpenTelemetry Overview](https://langfuse.com/integrations/native/opentelemetry)
- [LangFuse - Public API](https://langfuse.com/docs/api-and-data-platform/features/public-api)
- [LangFuse - Public API References](https://api.reference.langfuse.com/?_gl=1*8d5hyg*_gcl_aw*R0NMLjE3OTQ5MTkxMDQuQ2owS0NRaUFrX0RYQmhDb0FSSXNBSEUtb21QTmJTblh3dHpTYjRXOFlkN3N1MXBDTEdqOTBMNlFJRXZmZ3BPdEVRRnR2Qm5IN1NkQnh1QWFBdFRHRUFMd193Y0I.*_gcl_au*MTg0OTAyOTAzOC4xNzkzMzU1NzE2Li0uLS4xNzk0ODMxMzU3LjEzNjQxNDA2MzkuMTc5NDkxOTEwNC4xNzk0OTE5MTg4*_ga*MTUyMTEwMjg3LjE3OTMzNTU3MTQ.*_ga_KF1LLRTQ5Q*czE3OTQ5MTg5MTIkbzEwJGcxJHQxNzk0OTE5MjExJGoxMyRsMCRoMA..#tag/opentelemetry/POST/api/public/otel/v1/traces)



```bash
docker run --rm -it \
    golang:1.27-alpine \
    /bin/sh

docker compose exec -it telemetrygen /bin/sh

telemetrygen traces --otlp-insecure --duration inf --interval 1s

telemetrygen metrics --otlp-endpoint otel-collector:4317 --otlp-insecure --duration 5s --batch false

telemetrygen metrics --otlp-insecure --duration 5s

```

```bash
docker compose \
  -f otel-collector-compose.yaml \
  exec -it otel-collector \
  otelcol components

docker compose \
  -f otel-collector-compose.yaml \
  exec -it netshoot \
  /bin/bash

docker compose \
  exec -it cursor-cli \
  /bin/bash
```