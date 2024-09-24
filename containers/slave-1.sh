#! /bin/bash

# Uso il container per eseguire un lavoro e mi tengo il risultato finale.
# Poi butto il container stesso.
# Basta usare il comando di default e non mettere -it e -d.


docker container run \
    --rm \
    ubuntu:latest /bin/false

# Esegue false nel container e ritorna il risultato
# echo $? ---> 1