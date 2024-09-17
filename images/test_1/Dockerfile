# docker image build -t doqer:test_2 .
# docker container run --rm -it doqer:test_2 /bin/bash

FROM ubuntu:latest

RUN apt update
RUN apt install adduser # Mi serve poi per aggiungere gruppo e utente
RUN apt install passwd # Mi serve poi per aggiungere gruppo e utente

# Sovrascrivibili con --build-arg a=b
# Disponibili solo durante il processo di build per evitare duplicazione.
ARG name="Mauro"
ARG surname="Quaglia"

# Metadati che posso aggiungere all'immagine.
LABEL "mantainer"="$name $surname"

# Utente che eseguirà i comandi nel container.
# Nell'inspect dell'immagine si vede che ho impostato "root" altrimenti si vede "". Poi nel container è sempre root però.
USER root

# Creo gruppo dockeruser e gli assegno un id che vale 1001
# cat /etc/group
RUN addgroup --gid 1001 dockeruser

# Aggiungo un utente per il gruppo dockeruser
RUN adduser --home /home/mauro --shell /bin/bash --uid 1001 --gid 1001 dockeruser
