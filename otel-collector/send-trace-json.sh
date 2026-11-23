#!/bin/bash


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
curl -i -X POST "http://localhost:4318/v1/traces" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer user1-token" \
  -d @-