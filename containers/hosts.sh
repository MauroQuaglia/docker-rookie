#! /bin/bash

# docker container run --rm -it ubuntu:latest /bin/bash

# root@404e371c64ef:~# cat /etc/hosts
# 127.0.0.1       localhost
# 10.45.0.3       404e371c64ef

# ---------------------------------------------------

# Se gli fornisco l'hostname, viene riportato anche nel file di /etc/hosts
docker container run --hostname="pluto" --rm -it ubuntu:latest /bin/bash

# root@pluto:~# cat /etc/hosts
# 127.0.0.1       localhost
# 10.45.0.3       pluto