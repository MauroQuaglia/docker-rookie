# Docker

* `docker version`: 
  * Tutte le informazioni riguardanti il Client e il Server di Docker.
* `docker info`:
  * Tutte le informazioni rigurado il numero attuale dei container, immagini, e altro presenti sulla macchina.
* `systemctl is-active docker`
  * Check dello status del demone Docker.  
* `systemctl restart docker`
  * Far ripartire il demone.
---
# Compose
* `docker-compose --version`
  * Il Compose è un software costruito sopra Docker e va installato a parte, non fa parte dell'installazione originale.
* `docker-compose up &`:
  * Tiro su la App in foreground ma senza bloccare il terminale.
  * Crea tutta l'infrastruttura: build immagine, crea reti, crea volumi e poi fa partire i container.
  * E' utile poi vedere tutto ciò che ha creato con i soliti comandi del tipo `docker image|container|network|volume ls|inspect`
  * Anche qui sono molto utili i comandi:
    * `docker-compose ps`: Stato corrente dell'App
    * `docker-compose top`: Vedere il processo attivo all'interno di ogni container. 
* `docker-compose up -d`:
  * Tiro su la App in background.
* `docker-compose down`:
  * Ferma e cancella l'App.
  * Butta container e reti
  * Non butta immagini e volumi
* `docker-compose stop`:
  * Ferma l'App ma non cancella nulla.
  * Se poi la volgio cancellare devo fare `docker-compose rm` 
  * Se poi la volgio fare ripartire devo fare `docker-compose restart`

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
* `docker container run --name xxx(nome container) -it(shell interattiva) ubuntu:latest(image) /bin/bash(app)`
  * Il `-it` mi fa entrare direttamente nella shell del container dopo che l'ho avviato partendo dall'immagine.
  * Con `Ctrl-PQ` posso uscire dal container senza ucciderlo. Questo perché viene lasciato attivo il processo principale `/bin/bash` del container.
  * Con `exit` uccido anche il container. Questo perché viene ucciso il processo principale `/bin/bash` e il container non ha più senso di esistere.
* `docker container exec -it heuristic_roentgen /bin/bash`
  * Mi riaggancio ad un container che è ancora in stato running.
  * In tal caso viene lanciata una nuova bash, anche se quella preesistente è ancora attiva.
* `docker container inspect 78baeb5f6588`
  * Tante cose interessanti sul container in esecuzione. 
* `docker container stop 78baeb5f6588` + `docker container rm 78baeb5f6588`
  * Per rimuovere il container è meglio fare prima stop. 
* volumi
  * I volumi sono importanti perché permettono di salavri dati al di fuori di un container. Se il container viene cancellato i dati sul volume rimangono.
  * Si possono salavre dati anche all'interno del container. Se fermo e faccio ripartire il container i dati rimangono ma se cancello il container i dati vengono persi... anche se fisicamente presenti sul docker host questi alla cancellazione del container vengono cancellati.
* restart
  * E' sempre una buona idea avviare un container con una politica di restart: always, unless-stopped, on-failed.
---
# Volumes
* `docker volume ls`
  * Per vedere tutti i volumi montati.
---
# Networs
* `docker networks ls`
  * Per vedere tutte le reti. 