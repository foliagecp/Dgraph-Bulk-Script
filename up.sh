#!/bin/bash

typeIt="${1:-1}"

bash ./cook-a-bulk.sh "$typeIt"
docker compose up -d
docker compose logs -f
