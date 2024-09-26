#! /bin/bash

docker container stop my-pg-container
docker container rm my-pg-container

docker image build -t my-pg-image .
docker container run --name my-pg-container --env POSTGRES_PASSWORD=777 --publish 5555:5777 --detach  my-pg-image