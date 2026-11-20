## Cursor OpenTelemetry Plugins

- [GitHub - OpenTelemetry-Hooks](https://github.com/o11y-dev/opentelemetry-hooks)
- [GitHub - Last9 CursorScope](https://github.com/last9/cursorscope)
- [GitHub - LangGuard AI - cursor-otel-hook](https://github.com/LangGuard-AI/cursor-otel-hook)
- [GitHub - LangFuse - cursor-observability-plugin](https://github.com/langfuse/cursor-observability-plugin)
- [Cursor Docs - Hook References](https://cursor.com/docs/hooks)
- [Cursor Docs - OpenTelemetry Export Overview](https://cursor.com/docs/enterprise/opentelemetry-export)
- [Cursor Docs - OpenTelemetry Export Wire References](https://cursor.com/docs/enterprise/opentelemetry-export/wire)

## OpenTelemetry References

- [OpenTelemetry - Internal Metrics](https://opentelemetry.io/docs/collector/internal-telemetry/#lists-of-internal-metrics)
- [GitHub - OpenTelemetry Collector](https://github.com/open-telemetry/opentelemetry-collector/tree/v0.165.0)
- [GitHub - Extension - zPages](https://github.com/open-telemetry/opentelemetry-collector/blob/main/extension/zpagesextension/README.md)
- [GitHub - Receiver - OTLP](https://github.com/open-telemetry/opentelemetry-collector/blob/main/receiver/otlpreceiver/README.md)
- [GitHub - Extension - Basic Auth](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/basicauthextension)
- [GitHub - Extension - Bearer Token Auth](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/extension/bearertokenauthextension)
- [GitHub - Filter Processor](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/processor/filterprocessor/README.md)

## LangFuse Public API

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