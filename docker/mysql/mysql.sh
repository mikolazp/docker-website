#!/usr/bin/env bash

mysql -uroot -p${MYSQL_PASSWORD} "$@"

