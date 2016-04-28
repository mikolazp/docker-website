#!/usr/bin/env bash

# install docker
curl -s https://get.docker.com/ | sh


# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


echo "";
echo "";
echo "";
echo "======== Installed =========";
docker -v
docker-compose --version
