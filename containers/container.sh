#!/usr/bin/env bash

docker container run -it --rm alpine:latest /bin/sh

# Se faccio mount all'interno del container vedo tutto ciò che è montato dal filesystem dell'host in /var/lib/docker/container/ID al filesystem del container.
# /dev/nvme0n1p2 on /etc/hostname type ext4 (rw,relatime,errors=remount-ro)