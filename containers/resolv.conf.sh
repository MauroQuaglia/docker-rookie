#! /bin/bash

# docker container run --rm -it ubuntu:latest /bin/bash

# root@404e371c64ef:~# cat /etc/resolv.conf
# nameserver 10.10.10.10
# search pippo.it
# Based on host file: '/run/systemd/resolve/resolv.conf' (legacy)
# Overrides: []

# ---------------------

docker container run --rm -it --dns="8.8.8.8" --dns-search="example1.com" ubuntu:latest /bin/bash
# root@643d5b2968e5:~# cat /etc/resolv.conf
# nameserver 8.8.8.8
# search example1.com
# Based on host file: '/run/systemd/resolve/resolv.conf' (legacy)
# Overrides: [nameservers search]
