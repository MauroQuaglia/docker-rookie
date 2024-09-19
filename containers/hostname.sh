#! /bin/bash

# docker container run --rm -it ubuntu:latest /bin/bash

# root@98bf28a3a27c:/# hostname -f
# 98bf28a3a27c

# ---------------------------------------------------

# Se gli fornisco l'hostname.
docker container run --hostname="pluto" --rm -it ubuntu:latest /bin/bash

# root@pluto:/# hostname -f
# pluto
