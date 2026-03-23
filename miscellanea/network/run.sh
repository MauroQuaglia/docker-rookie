#! /bin/bash

# Con il compose crea in automatico anche la rete network_default in autonomia.

docker network create localnet --driver bridge

docker container run -d -p 5005:80 --name web --network localnet nginx:latest

docker container run -d --name client --network bridge ubuntu:latest /bin/bash -c "sleep infinity"