#! /bin/bash

# Tutto ciò che nel container finisce su STDOUT e STDERR viene rediretto nei log.
# Il meccanismo di default è: json-file
# Ma li posso scrivere anche su syslog
# In questo caso se sul mio DockerHost faccio: "tail -f /var/log/syslog" vedo i log del container.
# Posso anche mettere questa impostazione nella configurazione del demone docker così che vale per tutti i container.

docker container run \
    --rm --detach \
    --log-driver=syslog \
    --publish 8080:80 \
    nginx:latest