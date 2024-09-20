#! /bin/bash

# --mount è più sofisticato e ha tante opzioni
# --volume è più semplice, è un collegamento del tipo "da path a path"

docker container run \
    --volume ./stuff:/basket:ro \
    --rm -it \
    ubuntu:latest /bin/bash

# Nel container crea la cartella /basket
# Dato che l'ho montata come readonly posso solo leggere il contenuto.

# root@2f7a5c2e8934:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (ro,relatime,errors=remount-ro)
