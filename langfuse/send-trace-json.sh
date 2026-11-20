#!/bin/bash

export LANGFUSE_PUBLIC_KEY="pk-lf-5217a99a-1c7d-4de8-bb9b-387d74e9a549"
export LANGFUSE_SECRET_KEY="sk-lf-6cc29e22-8f56-4dca-86e4-77a7a2879655"
export LANGFUSE_HOST="http://localhost:3000" # EU region

export TRACE_ID=$(openssl rand -hex 16)
export SPAN_ID=$(openssl rand -hex 8)
export START=$(($(date +%s) * 1000000000))
export END=$((START + 1000000))

export JSON_FILE_NAME="trace-samples/simple-trace.json"

jq '
  walk(
    if type == "string" and startswith("$") then
      . as $key | env[$key[1:]] // .
    else 
      . 
    end
  )
' $JSON_FILE_NAME | \
curl -v -X POST "$LANGFUSE_HOST/api/public/otel/v1/traces" \
  -u "$LANGFUSE_PUBLIC_KEY:$LANGFUSE_SECRET_KEY" \
  -H "Content-Type: application/json" \
  -H "x-langfuse-ingestion-version: 4" \
  --data @-