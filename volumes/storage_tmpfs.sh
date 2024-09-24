#! /bin/bash

# Mettiamo il container come readonly, così che nessuno possa scriverci dentro inavvertitamente.
# Poi monto un file-system (tmpfs) in memoria. E'  molto veloce ma effimero, quando muore il container il contenuto viene perso.

docker container run \
    --read-only=true \
    --mount type=tmpfs,destination=/basket,tmpfs-size=256M \
    --rm -it \
    ubuntu:latest /bin/bash

# root@3919ea1a76f2:/# mount | grep basket
# tmpfs on /basket type tmpfs (rw,nosuid,nodev,noexec,relatime,size=262144k)

# Anche in questo caso non viene creato nessun volume.
# docker volume ls -> vuoto