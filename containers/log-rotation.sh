#! /bin/bash

# Tutto ciò che nel container finisce su STDOUT e STDERR viene rediretto nei log.
# Il meccanismo di default è: json-file
# Specifico il meccanismo di rotation.
# Nel docker container inspect si vedono poi queste informazioni.

docker container run \
    --rm -it \
    --log-opt max-size=10m --log-opt max-file=5 \
    nginx:latest /bin/bash