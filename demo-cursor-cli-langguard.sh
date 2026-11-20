#!/bin/bash

docker compose \
  --profile cursor-cli-langguard \
  --env-file .env \
  up \
  --detach --build

docker compose \
  exec -it cursor-cli-langguard \
  /bin/bash

# agent --trust