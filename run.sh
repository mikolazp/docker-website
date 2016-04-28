#!/usr/bin/env bash

docker-compose up -d


# if yii2 exist, then update it
if [ -f ./www/_protected/yii ]; then
    sleep 1
    ./scripts/yii/update_yii
fi

