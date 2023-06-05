#!/usr/bin/env bash

RED='\033[0;31m'
NOCOLOR='\033[0m'

echo -e "${RED}IMAGES:${NOCOLOR}"
docker image ls

echo -e "${RED}CONTAINERS:${NOCOLOR}"
docker container ls

echo -e "${RED}NETWORKS:${NOCOLOR}"
docker network ls

echo -e "${RED}VOLUMES:${NOCOLOR}"
docker volume ls