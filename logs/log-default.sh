#! /bin/bash

# Tutto ciò che nel container finisce su STDOUT e STDERR viene rediretto nei log.
# Il meccanismo di default è json-file: --log-driver=json-file
# Non c'è nessun meccanismo di rotation.
# I log vengono salvati sul Docker Host in: /var/lib/docker/containers/sha/sha-json.log

docker container stop nginx-test
docker container rm nginx-test

docker container run \
    --rm --detach --name nginx-test \
    --publish 8080:80 \
    nginx:latest

sleep 5

# Li posso vedere così:
docker container logs --follow nginx-test

# E sono gli stessi di /var/lib/docker/containers/sha/sha-json.log