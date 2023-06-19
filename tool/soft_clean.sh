#! /bin/bash

# Cancella tutte le immagini dangling e tutte quelle non più associate a container
docker image prune -af

docker container prune -f
docker volume prune -af
docker network prune -f
