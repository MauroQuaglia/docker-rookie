#! /bin/bash

# --volume è più semplice, è un collegamento del tipo "da path a path"

docker container run \
    --volume ./stuff:/basket:ro \
    --rm -it \
    ubuntu:latest /bin/bash

# Nel container crea la cartella /basket
# Dato che l'ho montata come readonly posso solo leggere il contenuto.

# root@2f7a5c2e8934:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (ro,relatime,errors=remount-ro)

# In questo caso non viene creato nessun volume perché è un bind volume e c'è un mapping diretto con la cartella stuff.
# docker volume ls -> vuoto