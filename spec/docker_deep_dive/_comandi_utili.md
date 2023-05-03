# Comandi Utili
* __Il demone di Docker__
    * E' un __processo unico__ che permette di gestire volumi, immagine ad altro e sta al di sopra di __containerd__
    * `> dockerd`
* __Il gestore dei container containerd__
    * E' un __processo unico__ che permette di gestire i container e sta al di sopra di __runc__
    * `> docker-containerd`
* __Il runtime del singolo container runc__
    * Un processo per ogni container attivo.
    * `> docker-runc`
---
* `docker version`: 
  * Tutte le informazioni riguardanti il Client e il Server di Docker.
* `docker info`:
  * Tutte le informazioni rigurado il numero attuale dei container, immagini, e altro presenti sulla macchina.
---
* `docker image ls`:
  * Mi fa vedere tutte le immagini in locale
* `docker image pull ubuntu:latest`:
  * Scarica l'ultima versione di ubuntu. 
* `docker container run -it ubuntu:latest /bin/bash`
  * Il `-it` mi fa entrare direttamente nella shell del container dopo che l'ho avviato partendo dall'immagine.
  * Con `Ctrl-PQ` posso uscire dal container senza ucciderlo.
* `docker container exec -it heuristic_roentgen /bin/bash`
  * Mi riaggancio ad un container che è ancora in stato running.
* `docker container ls -a`
  * Mi fa vedere tutti i container, anche quelli fermi.
---
* `docker build -t test:latest .`
  * Crea un'immagine a partire dal Dockerfile, dove -t gli da un nome, e . è perché il Dokerfile è nella directory corrente. 