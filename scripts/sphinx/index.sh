#!/usr/bin/env bash

docker exec -ti $(docker-compose ps | egrep "^sphinx_*" | awk '{print $1}') indexer --all --rotate

