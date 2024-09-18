FROM ubuntu:latest

RUN <<EOF
  apt update
  apt install -y adduser passwd
  apt clean
EOF

ARG name="Mauro"
ARG surname="Quaglia"

# Metadati che posso aggiungere all'immagine.
LABEL "mantainer"="${name} ${surname}"

# Utente che eseguirà i comandi nel container.
# Nell'inspect dell'immagine si vede che ho impostato "root" altrimenti si vede "".
# Poi nel container è sempre root però.
USER root
RUN <<EOF
  addgroup --gid 1001 quaglia
  adduser --home /home/mauro --shell /bin/bash --uid 1099 --gid 1001 --disabled-password mauro
  echo "mauro:password-di-mauro" | chpasswd
EOF
