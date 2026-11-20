#!/bin/bash

docker compose \
  --profile cursor-cli-o11y \
  --env-file .env \
  up \
  --detach --build

docker compose cp \
  ./cursor-cli-o11y/otel_config.json cursor-cli-o11y:/root/.local/share/opentelemetry-hooks/otel_config.json

docker compose cp \
  ./cursor-cli-o11y/hooks.json cursor-cli-o11y:/root/.cursor/hooks.json

docker compose \
  exec -it cursor-cli-o11y \
  /bin/bash

# agent --trust