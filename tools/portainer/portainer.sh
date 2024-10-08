#! /bin/bash

# https://docs.portainer.io/start/install-ce/server/docker/linux

docker container stop portainer
docker container rm portainer
docker volume rm portainer_data

docker volume create portainer_data
docker run \
    -d \
    -p 9000:9000 \
    --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    portainer/portainer-ce:latest