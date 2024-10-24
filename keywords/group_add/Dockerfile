FROM ubuntu:latest

RUN apt update
RUN apt install adduser

# Ricordiamo che l'utente 1000 esiste già ed è ubuntu.
RUN addgroup --gid 1001 grouppy
RUN adduser -h /home/mauro -s /bin/bash -u 1001 -G grouppy mauro

CMD ["sleep", "infinity"]