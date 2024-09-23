#! /bin/bash

# Provo a vincolare un container a una sola CPU.
# Se l'intero sistema non è sotto stress è difficile vedere i limiti imposti da questa configurazione.


# Eventualmente per mettere il sistema sotto stress posso provare ad usare uno "stress" in un altro container.
# docker container run --rm spkane/train-os stress --verbose --cpu 2 --io 1 --vm 2 --vm-bytes 128 --timeout 120s

# In questo modo con htop dovrei vedere la prima CPU a cannone.
docker container run --rm --cpuset-cpus=0 spkane/train-os stress --verbose --cpu 2 --io 1 --vm 2 --vm-bytes 128 --timeout 120s
