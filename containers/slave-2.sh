#! /bin/bash

# Uso il container per eseguire un lavoro e mi tengo il risultato finale.
# Poi butto il container stesso.
# Basta usare il comando di default e non mettere -it e -d.

# In questo casomi faccio dire quante righe ci sono in quel file (nel container) e poi esco
docker container run \
    --rm \
    ubuntu:latest /bin/bash -c "cat /etc/passwd | wc -l"
