#! /bin/bash

# --mount è più sofisticato e ha tante opzioni
# --volume è più semplice, è un collegamento del tipo "da path a path"

docker container run \
    --mount type=bind,source=./stuff,target=/basket,readonly \
    --rm -it \
    ubuntu:latest /bin/bash

# Nel container crea la cartella /basket
# Dato che l'ho montata come readonly posso solo leggere il contenuto.

# root@1485e4e31e1d:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (ro,relatime,errors=remount-ro)
