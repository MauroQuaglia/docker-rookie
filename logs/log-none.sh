#! /bin/bash

# Con il driver "none" non viene loggato nulla.

docker container stop nginx-test
docker container rm nginx-test

docker container run \
    --rm --detach --name nginx-test \
    --publish 8080:80 \
    --log-driver=none \
    nginx:latest

# Non vedo nulla
# docker container logs --follow nginx-test

# In /var/lib/docker/containers/sha/ non ci sono log.