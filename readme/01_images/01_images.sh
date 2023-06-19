#!/usr/bin/env bash

# Scarico immagine
echo "PULL IMAGE"
docker image pull ubuntu:latest

# Controllo le caratteristiche. Per esempio nel cmd o entrypoint vedo per cosa è designata, più tante altre cose.
echo "INSPECT IMAGE"
docker image inspect ubuntu:latest

# E' un modo di vedere i comandi di come è stata costruita, quasi come se guardassi il suo Dockerfile.
echo "HISTORY IMAGE"
docker image history ubuntu:latest

# Per vedere per quali piattaforme è disponibile (oltre alla mia, altrimenti neanche l'avrebbe scaricata)
echo "MANIFEST IMAGE"
docker manifest inspect ubuntu:latest

# Creo immagine
# Quando creo io l'immagine, dare una controllatina va sempre bene:
  # inspect
  # history
# Il manifest non è necessario crearlo.
# Cercare di tenere l'immagine piccola: un solo RUN, il multi-stage build, ...
# Usare il no-install-recommends nel apt-get install.
