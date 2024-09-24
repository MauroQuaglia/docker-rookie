#! /bin/bash

# Tutto ciò che nel container finisce su STDOUT e STDERR viene rediretto nei log.
# Il meccanismo di default è: json-file
# Non c'è nessun meccanismo di rotation.

docker container run \
    --rm --detach --name nginx-test \
    nginx:latest

sleep 5

docker container logs -f nginx-test