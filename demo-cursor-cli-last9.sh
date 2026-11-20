#!/bin/bash

docker compose \
  --profile cursor-cli-last9 \
  --env-file .env \
  up \
  --detach --build

docker compose \
  exec -it cursor-cli-last9 \
  /bin/bash -c "source /root/.nvm/nvm.sh && npx @last9/cursorscope setup"

docker compose cp \
  ./cursor-cli-last9/hooks.json cursor-cli-last9:/root/.cursor/hooks.json

docker compose \
  exec -it cursor-cli-last9 \
  /bin/bash

# npx @last9/cursorscope setup
# npx @last9/cursorscope status
# agent --trust