#! /bin/bash

# -q = --quiet, cioè solo gli id
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker image rm $(docker image ls -q) -f
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)

docker system prune --all --force
