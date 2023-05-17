* Stringata sintesi dei comandi principali di un Dockerfile.
* https://docs.docker.com/engine/reference/builder/

# COPY source destination
* COPY copia un file o directory dalla sorgente, il filesystem del docker host, alla destinazione, il filesystem del container.
* Tutti i nuovi file o directory sono creati con UID e GID a 0 (rispetto al filesystem del container), ma la cosa è configurabile e si può decidere l'utente e il gruppo dei file copiati.