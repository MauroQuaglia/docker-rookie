#!/usr/bin/env bash

docker swarm leave --force
docker swarm init --advertise-addr enp1s0

./portainer.sh