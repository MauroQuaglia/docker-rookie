#! /bin/bash

# Monto un volume locale che sta sul docker host all'interno del container.
# ./stuff (localhost) ---> /data_mq (container)

# Dal container il file hello.txt è modificabile (echo "xxx" > hello.txt)
# docker container run --volume ./stuff:/data_mq --rm -it ubuntu:latest /bin/bash


# ---------------------------------------------------

# Per renderlo read-only
docker container run --volume ./stuff:/data_mq:ro --rm -it ubuntu:latest /bin/bash

# Se da dentro il container faccio "mount" lo vedo come montato


# Con --volume ./stuff:/data_mq:z oppure --volume ./stuff:/data_mq:Z posso anche specificare se il volume montato è
# condiviso tra più container oppure è privato