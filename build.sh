#!/bin/bash

cd gotty

rm gotty redis-cli

## get gotty
wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz
tar -xvf gotty_linux_amd64.tar.gz
rm gotty_linux_amd64.tar.gz
chmod +x gotty

## get redis-cli
CONTAINER_ID=$(docker run -e ALLOW_EMPTY_PASSWORD=yes -d bitnami/redis:4.0.14)
echo "container id - $CONTAINER_ID"
docker cp $CONTAINER_ID:/opt/bitnami/redis/bin/redis-cli ./redis-cli
docker stop $CONTAINER_ID
