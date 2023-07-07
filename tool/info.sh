#!/usr/bin/env bash

RED='\033[0;31m'
NOCOLOR='\033[0m'

echo -e "${RED}IMAGES:${NOCOLOR}"
docker image ls -a

echo -e "${RED}CONTAINERS:${NOCOLOR}"
docker container ls -a

echo -e "${RED}NETWORKS:${NOCOLOR}"
docker network ls

echo -e "${RED}VOLUMES:${NOCOLOR}"
docker volume ls

echo -e "${RED}PLUGINS:${NOCOLOR}"
docker plugin ls