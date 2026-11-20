#!/bin/bash

export LANGFUSE_SECRET_KEY="sk-lf-6cc29e22-8f56-4dca-86e4-77a7a2879655"
export LANGFUSE_PUBLIC_KEY="pk-lf-5217a99a-1c7d-4de8-bb9b-387d74e9a549"
export LANGFUSE_BASIC_AUTH=`echo -n "$LANGFUSE_PUBLIC_KEY:$LANGFUSE_SECRET_KEY" | base64 -w 0`

echo $LANGFUSE_PUBLIC_KEY
echo $LANGFUSE_SECRET_KEY
echo $LANGFUSE_BASIC_AUTH

docker compose \
  --file otel-collector-compose.yaml \
  --env-file .env \
  up \
  --build --detach --remove-orphans

#docker compose logs \
#  -f telemetrygen

docker compose \
  --file otel-collector-compose.yaml \
  logs -f otel-collector