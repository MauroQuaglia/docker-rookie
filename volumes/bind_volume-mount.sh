#! /bin/bash

# --mount è più sofisticato e ha tante opzioni

docker container run \
    --mount type=bind,source=./stuff,target=/basket,readonly \
    --rm -it \
    ubuntu:latest /bin/bash

# Nel container crea la cartella /basket
# Dato che l'ho montata come readonly posso solo leggere il contenuto.

# root@1485e4e31e1d:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (ro,relatime,errors=remount-ro)

# In questo caso non viene creato nessun volume perché è un bind volume e c'è un mapping diretto con la cartella stuff.
# docker volume ls -> vuoto
