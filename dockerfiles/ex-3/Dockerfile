# docker image build --secret id=secretsite,src=secretsite.txt -t run:secret .
# docker container run -it run:secret bash

FROM ubuntu:latest

RUN apt update && apt install -y curl

# In questo caso nessuno sa nulla del secretsite.txt, infatti viene usato il secretfile.txt locale per la curl e poi viene salavato solo il risultato della curl ma il secretsite.txt nel container non c'è.
RUN --mount=type=secret,id=secretsite,target=/root/.ss \
    curl -I "$(cat /root/.ss)" -o result.txt