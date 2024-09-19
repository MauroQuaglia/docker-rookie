#! /bin/bash

# Creo un container read-only nel senso che nessuno ci può scrivere dentro per evitare che inavvertitamente qualcuno ci scriva qualcosa
# Nei volumi è possibile scrivere, nel container no.

# Esempio
docker container run --volume ./stuff:/data_mq --read-only=true --rm -it ubuntu:latest /bin/bash

