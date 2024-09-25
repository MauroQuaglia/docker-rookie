#! /bin/bash

# Tutto ciò che nel container finisce su STDOUT e STDERR viene rediretto nei log.
# Il meccanismo di default è json-file: --log-driver=json-file
# Attivo il meccanismo di rotation... che avviene sul Docker Host.
# I log vengono salvati sul Docker Host in: /var/lib/docker/containers/sha/sha-json.log

docker container stop nginx-test
docker container rm nginx-test

docker container run \
    --rm --detach --name nginx-test \
    --publish 8080:80 \
    --log-opt max-size=10k --log-opt max-file=5 \
    nginx:latest

# Vado a vedere la rotaion in /var/lib/docker/containers/sha/sha-json.log
# Qui si vede che ruotano!
# sha-json.log
# sha-json.log.1
# sha-json.log.2
# ...

# Chiaramente quello che vedo con "docker container logs nginx-test --follow" è sempre quello corrente che ancora non è ruotato.