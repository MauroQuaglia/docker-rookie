# Comandi Utili

* `docker version`: 
  * Tutte le informazioni riguardanti il Client e il Server di Docker.
* `docker info`:
  * Tutte le informazioni rigurado il numero attuale dei container, immagini, e altro presenti sulla macchina.
---
# Immagini
* `docker images` oppure `docker image ls`:
  * Mi fa vedere tutte le immagini in locale
* `docker image pull ubuntu:latest`:
  * Scarica l'ultima versione di ubuntu.
* `docker build .`
  * Crea l'immagine a partire dal Dockerfile
* `docker build -t test:latest .`
  * Crea un'immagine a partire dal Dockerfile, dove -t gli da un nome
---
# Container
* `docker container ls`
  * Mi fa vedere tutti i container attivi.
* `docker container ls -a`
  * Mi fa vedere tutti i container, attivi e non.
* `docker container run -it ubuntu:latest /bin/bash`
  * Il `-it` mi fa entrare direttamente nella shell del container dopo che l'ho avviato partendo dall'immagine.
  * Con `Ctrl-PQ` posso uscire dal container senza ucciderlo.
* `docker container exec -it heuristic_roentgen /bin/bash`
  * Mi riaggancio ad un container che è ancora in stato running.