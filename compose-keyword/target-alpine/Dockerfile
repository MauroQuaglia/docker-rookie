# https://docs.docker.com/engine/reference/builder/
FROM alpine:latest

RUN apk update -qq \
      && apk add --no-cache bash nano \
      && rm -rf /var/cache/apk/*

# echo $MY_NAME
#ENV MY_NAME="Jhon Dash" con o senza = non cambia
ENV MY_NAME "Jhon Dash"

# Metto tutti i RUN ma dovrebbe essere una unica istruzione...

# -g aggiunge un gruppo con id 1000
## ...lo trovo guardando qua: cat /etc/group
# OSS: root GID=0
RUN addgroup \
    -g 1000 dockergroup

# -h home dell'utente dockeruser \
# -s percorso della shell dell'utente \
# -u id dell'utente \
# -G gruppo dell'utente. Questo gruppo deve già esistere, ma è stato creato al passo precedente. \
# -S crea l'utente di sistema dockeruser
# ...lo trovo guardando qua: cat /etc/passwd
# OSS: root UID=0
RUN adduser \
    -h /home/dockeruser \
    -s /bin/bash \
    -u 1000 \
    -G dockergroup \
    -S dockeruser

RUN mkdir -p /app && chown dockeruser:dockergroup /app
RUN setcap cap_setgid=ep /app

# whoami
USER dockeruser

COPY --chown=dockeruser:dockergroup text-a.txt ./