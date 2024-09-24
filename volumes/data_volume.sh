#! /bin/bash

# I data volume vengono creati da Docker.

# Per esempio creo un data volume:
docker volume create mq-data

# In questo caso non viene creato un data volume
# docker volume ls -> mq-data

# E poi lo aggancio a un container.
docker container run \
    --mount source=mq-data,target=/basket \
    --rm -it \
    ubuntu:latest /bin/bash

# Nel container crea la cartella /basket e la aggancia al data volume.

# root@1485e4e31e1d:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (rw,relatime,errors=remount-ro)
