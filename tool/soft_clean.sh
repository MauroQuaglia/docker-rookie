#! /bin/bash

docker container prune -f
docker image prune -af
docker volume prune -af
docker network prune -f
