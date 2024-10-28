FROM ubuntu:latest

RUN apt update
RUN apt install -y adduser

# Ricordiamo che l'utente 1000 esiste già ed è ubuntu.
RUN addgroup --gid 1001 grouppy
RUN adduser --home /home/mauro --shell /bin/bash --uid 1005 --ingroup grouppy mauro

CMD ["sleep", "infinity"]