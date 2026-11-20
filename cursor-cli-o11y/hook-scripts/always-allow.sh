#!/usr/bin/env bash
set -euo pipefail

LOG_FILE="${HOME}/.cursor/hooks/hook-events.jsonl"
mkdir -p "$(dirname "$LOG_FILE")"

# Read raw JSON payload from stdin
payload="$(cat)"

# Append as a single-line JSON object with a local UTC timestamp
if command -v jq >/dev/null 2>&1; then
  printf '%s\n' "$payload" | jq -c --arg ts "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" '. + {_logged_at: $ts}' >> "$LOG_FILE"
else
  # Fallback if jq is not installed (compacts newlines)
  compact="$(printf '%s' "$payload" | tr -d '\n\r')"
  printf '{"_logged_at":"%s","raw":%s}\n' "$(date -u +"%Y-%m-%dT%H:%M:%SZ")" "$compact" >> "$LOG_FILE"
fi

# Return a clean JSON no-op on stdout and always exit 0 for telemetry hooks
printf '{ "permission": "allow" }\n'
exit 0