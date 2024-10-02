#! /bin/bash

docker compose build
docker compose up

docker compose down
docker image rm rails-setup-image:latest