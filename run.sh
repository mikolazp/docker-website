#!/usr/bin/env bash

sudo docker-compose up -d


# if yii2 exist, then update it
if [ -f ./www/_protected/yii ]; then
    sleep 1
    sudo ./scripts/yii/update_yii
fi

