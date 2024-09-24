#! /bin/bash

docker image build -t my-pg-image .
docker container run --name my-pg-container --env POSTGRES_PASSWORD=777 --publish 5555:5777 --detach  my-pg-image