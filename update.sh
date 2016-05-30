#!/usr/bin/env bash

git pull origin master

sudo docker-compose build
sudo docker-compose stop
sudo docker-compose up -d


# if yii2 exist, then update it
if [ -f ./www/_protected/yii ]; then
    sleep 1
    sudo ./scripts/yii/update_yii
fi
