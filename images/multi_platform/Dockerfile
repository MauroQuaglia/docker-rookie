# https://docs.docker.com/build/building/multi-platform/#simple-multi-platform-build-using-emulation
# Se lo faccio su Vagrant dopo aver seguito i passi per installare QEMU funziona!

# syntax=docker/dockerfile:1
FROM alpine
RUN uname -m > /arch

# docker build --platform linux/arm64 -t arm .
# arm:latest                 18fcbda3d9f1         13MB         3.87MB

# docker build --platform linux/amd64 -t amd .
# amd:latest                 65bf692a1e3b         13MB         3.87MB

# docker build --platform linux/amd64,linux/arm64 -t amdarm .
# amdarm:latest              da5b9568a3e3       17.2MB         8.07MB
# Più grossa perché contiene le due precedenti, e può però girare sulle due architetture.

# Quando faccio pull da un repository però tira giù solo quella che mi interessa, in base all'architettura che ho sul PC, non tutte e due.