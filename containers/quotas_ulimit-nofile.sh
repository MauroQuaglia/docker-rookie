#! /bin/bash

# Limite artificiale sul numero di file che possono essere aperti dal processo in esecuzione all'interno del container.
# Se metto dei valori troppo bassi, il container non parte neanche.

# Se faccio ulimit -a dentro il container vedo che la configurazione è stata presa.

docker container run --rm -it --ulimit nofile=10 ubuntu:latest
