#! /bin/bash

# Creo un container read-only nel senso che nessuno ci può scrivere dentro.
# Per evitare che inavvertitamente qualcuno ci scriva qualcosa.
# In questo esempio, nel volume posso continuare a scrivere perché non hospecificato che è read-only, ma nel container no.

docker container run \
    --volume ./stuff:/basket:rw \
    --read-only=true \
    --rm -it \
    ubuntu:latest /bin/bash

# root@73bf67733b6f:/# mount | grep basket
# /dev/nvme0n1p2 on /basket type ext4 (rw,relatime,errors=remount-ro)
# Il /dev/nvme0n1p2 (host) è montato su /basket (container) come RW

# root@73bf67733b6f:/# mount | grep overlay
# overlay on / type overlay (ro,relatime, ...)
# Il overlay (host) è montato su / (container) come RO

# root@73bf67733b6f:/# touch pippo.txt
# touch: cannot touch 'pippo.txt': Read-only file system