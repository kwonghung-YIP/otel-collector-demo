#!/bin/bash

docker compose \
  --file otel-collector-compose.yaml \
  down

#docker compose logs \
#  -f telemetrygen

#docker compose logs \
#  -f otel-collector