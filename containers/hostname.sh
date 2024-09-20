#! /bin/bash

# docker container run --rm -it ubuntu:latest /bin/bash

# root@98bf28a3a27c:/# hostname -f
# 98bf28a3a27c

# ---------------------------------------------------

# Se gli fornisco l'hostname.
docker container run --hostname="pluto" --rm -it ubuntu:latest /bin/bash

# root@pluto:/# hostname -f
# pluto

# root@pluto:/# mount | grep hostname
# /dev/nvme0n1p2 on /etc/hostname type ext4 (rw,relatime,errors=remount-ro)

# La partizione /dev/nvme0n1p2 è nel mio Docker Host.
# Il file /etc/hostname è nel container