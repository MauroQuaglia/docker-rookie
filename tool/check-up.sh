#!/usr/bin/env bash

RED='\033[0;31m'
NOCOLOR='\033[0m'

echo -e "${RED}-----------------------------------------------------------------------${NOCOLOR}"
echo -e "${RED}Vediamo le versioni dei vari compnenti di Docker e se sono compatibili:${NOCOLOR}"
echo -e "${RED}-----------------------------------------------------------------------${NOCOLOR}"
docker version

echo -e "${RED}----------------------------------------------------------${NOCOLOR}"
echo -e "${RED}Vediamo le informazioni relative all'ambiente sottostante:${NOCOLOR}"
echo -e "${RED}----------------------------------------------------------${NOCOLOR}"
docker system info

echo -e "${RED}---------------------------------------------------------------------------------------------------${NOCOLOR}"
echo -e "${RED}In /var/lib/docker ci sono immagini e container, volumi e molto altro... ma solo se sei root!:${NOCOLOR}"
echo -e "${RED}In /etc/docker c'è la configurazione del demone!:${NOCOLOR}"
echo -e "${RED}---------------------------------------------------------------------------------------------------${NOCOLOR}"
