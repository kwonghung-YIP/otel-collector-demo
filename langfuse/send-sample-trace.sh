#!/bin/bash

export LANGFUSE_PUBLIC_KEY="pk-lf-5217a99a-1c7d-4de8-bb9b-387d74e9a549"
export LANGFUSE_SECRET_KEY="sk-lf-6cc29e22-8f56-4dca-86e4-77a7a2879655"
export LANGFUSE_HOST="http://localhost:3000" # EU region

TRACE_ID=$(openssl rand -hex 16)
SPAN_ID=$(openssl rand -hex 8)
START=$(($(date +%s) * 1000000000))

curl -v -X POST "$LANGFUSE_HOST/api/public/otel/v1/traces" \
  -u "$LANGFUSE_PUBLIC_KEY:$LANGFUSE_SECRET_KEY" \
  -H "Content-Type: application/json" \
  -H "x-langfuse-ingestion-version: 4" \
  --data-binary @- <<JSON
{"resourceSpans": [{"scopeSpans": [{"spans": [{
  "traceId": "$TRACE_ID",
  "spanId": "$SPAN_ID",
  "name": "hello-langfuse",
  "startTimeUnixNano": "$START",
  "endTimeUnixNano": "$((START + 1000000))",
  "attributes": [
    {
      "key": "langfuse.observation.input",
      "value": {"stringValue": "Hello, Langfuse!"}
    },
    {
      "key": "langfuse.observation.output",
      "value": {"stringValue": "Hello from curl!"}
    }
  ]
}]}]}]}
JSON
