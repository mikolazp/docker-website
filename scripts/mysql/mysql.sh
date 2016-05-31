#!/usr/bin/env bash

docker exec -ti $(docker-compose ps | egrep "^db_*" | awk '{print $1}') /root/mysql.sh "$@"

