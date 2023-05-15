# Comandi Utili

* `docker version`: 
  * Tutte le informazioni riguardanti il Client e il Server di Docker.
* `docker info`:
  * Tutte le informazioni rigurado il numero attuale dei container, immagini, e altro presenti sulla macchina.
* `systemctl is-active docker`
  * Check dello status del demone Docker.  

---
# Immagini
* `docker images` oppure `docker image ls`:
  * Mi fa vedere tutte le immagini in locale
  * Un'immagine ha un unico IMAGE_ID ma può avere più TAG.
* `docker image ls --filter dangling=true`
  * Per vedere le immagine senza repository e tag... può succedere in caso di duplicati che Docker tolga dei tag.
* `docker image pull ubuntu:latest`:
  * Formato: `docker image pull repository:tag` 
  * Scarica l'ultima versione di ubuntu.
  * Tendenzialmente meglio non usare il tag "latest". Che a volte neppure è veramente l'ultima uscita visto che ci sono anche le "edge"
  * La cosa più sicura in assoluto è usare il digest dell'immagine. L'image-id.
* `docker build .`
  * Crea l'immagine a partire dal Dockerfile
* `docker build -t test:latest .`
  * Crea un'immagine a partire dal Dockerfile, dove -t gli da un nome
* `docker image prune -a`
  * Cancella tutte le immagini dangling e tutte quelle non associate a container che stanno girando.
* `docker search nigelpoulton`
  * Si può anche cercare nel DockerHub da riga di comando.
  * Esempio, tutti i repositori con nigelpoulton nel loro nome... 25 righe
* `docker image inspect 3735d52b5c9e`, `docker image history 3735d52b5c9e` 
  * Per vedere tutti i dettagli di un'immagine.
* `docker manifest inspect busybox` (per esempio busybox)
  * Fa vedere le piattaforme e SO disponibili compatibili con quell'immagine che sto scaricando.
---
# Container
* `docker container ls`
  * Mi fa vedere tutti i container attivi.
* `docker container ls -a`
  * Mi fa vedere tutti i container, attivi e non.
* `docker container run -it ubuntu:latest /bin/bash`
  * Il `-it` mi fa entrare direttamente nella shell del container dopo che l'ho avviato partendo dall'immagine.
  * Con `Ctrl-PQ` posso uscire dal container senza ucciderlo. Questo perché viene lasciato attivo il processo principale `/bin/bash` del container.
  * Con `exit` uccido anche il container. Questo perché viene ucciso il processo principale `/bin/bash` e il container non ha più senso di esistere.
* `docker container exec -it heuristic_roentgen /bin/bash`
  * Mi riaggancio ad un container che è ancora in stato running.