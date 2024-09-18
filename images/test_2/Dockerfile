FROM ubuntu:latest

# Sovrascrivibili con --build-arg al momento della build.
ARG mauro="MAURO"
# Se mauro è impostata il valore è quello di mauro altrimenti il valore è "mq7"
ENV mrx=${mauro:-"mq7"}



# Default
USER "root:root"


# Modo bello di fare più comandi in un layer solo.
RUN <<EOF
apt update
apt install -y curl
apt clean
EOF

# Copia anche da sorgenti remote. Quando posso uso la COPY, se proprio devo usa la ADD:
ADD https://www.google.com/robots.txt /tmp

# Non la espone veramente, ma è come una sorta di documentazione che esprime l'intento che dovrebbe avere il container.
# Posso anche mettere più istruzioni EXPOSE
# Nel container posso usare --port 80:80, oppure -P che mappa una porta libera a caso dell'host sull'80 del container.
EXPOSE "80/tcp"



RUN mkdir "/mydata"
RUN echo "hello world" > /mydata/greeting.txt
# Docker crea un volume anonimo associato alla directory /mydata all'interno del container
# Il docker volume ls farà vedere questo volume (anonimo)
VOLUME ["/mydata"]


# CMD exit 1 se lo voglio fare fallire
HEALTHCHECK --interval=5s --timeout=5s --retries=3 CMD exit 0


# Se voglio fare override: docker container run --rm -it --entrypoint bin/bash mq7:latest
ENTRYPOINT ["echo"]
CMD ["mauro quaglia"]
