#!/usr/bin/env bash
docker-compose down --remove-orphans
docker image prune -af
docker container prune -f
docker volume prune -af
docker network prune -f
docker-compose build #--no-cache
docker-compose up -d
docker container exec -it $1 /bin/bash