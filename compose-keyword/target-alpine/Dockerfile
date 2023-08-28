# https://docs.docker.com/engine/reference/builder/
FROM alpine:latest

RUN apk update -qq \
      && apk add --no-cache bash nano \
      && rm -rf /var/cache/apk/*

ENV MY_NAME="Jhon Dash"

# Metto tutti i RUN ma dovrebbe essere una unica istruzione...

RUN addgroup -g 1000 dockeruser # Andare poi a vedere in /etc/group
RUN adduser -h /home/dockeruser -s /bin/bash