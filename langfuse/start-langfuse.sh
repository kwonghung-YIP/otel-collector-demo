#!/bin/bash

docker compose \
  --file langfuse-compose.yaml \
  --env-file langfuse-demo.env \
  up \
  --remove-orphans --detach