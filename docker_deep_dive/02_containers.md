# Containers
* E' il runtime di un'immagine.
* Il comando di base è `docker container run -it <image> <app>` (`docker container run -it ubuntu:latest /bin/bash`)
* Il container rimane attivo ficnhé l'app che sta esegundo (PID = 1) rimane in esecuzione.
* `docker container stop ID\name` -> fermo il processo con PID = 1 nel container.
* `docker container start ID\name`
* `docker container rm ID\name -f` -> il `-f` è brutale meglio fare prima `stop` e poi `rm` del container per dare tempo al processo (max 10 secondi) di terminare. Se in 10 secondi non termina in automatico viene fatto kill del processo e termina per forza. Di fatto questo comando uccide il processo con PID = 1 e quando non c'è più nessun processo nel container, il container muore.
* Se lancio un `ps` all'interno del container vedrò un solo processo attivo, quello con PID = 1.
* Se faccio `exit` all'interno del container la bash termina, il container non ha più ragione di esistere senza il suo processo principale e muore.
* Se faccio `Ctrl-PQ` esco dal container senza terminare il processp (app) nel container, per cui il container non termina ma continuerà a funzionare in background.
* Per vedere tutti i container attivi: `docker container ls`
* Per vedere tutti i container attivi e non: `docker container ls -a`
* Per riaggianciarmi ad un container attivo: `docker container exec -it ID|name /bin/bash`
    * Se ora faccio `ps` vedrò due shell attive, quella originale che sta mantenendo il container attivo e quella nuova con cui mi sono riagganciato. Se ora faccio `exit` il container non muore perché la bash originale è ancora attiva, mentre viene chiusa solo quella nuova.
* Se volgio dare un nome al container: `docker container run --name=mq -it ubuntu:latest /bin/bash`

## Accessi
* Se non ho gli accessi per accedere al Server di Docker (il demone) devo entrare nel gruppo "docker" di utenti: `username -aG docker <user>` e poi chiudere e riaprire il terminale.
 * Oppure anche per lanciare i comandi senza `sudo`. 

## Restart Policy
* E' sempre bene fare partire un container con una policy di restart.
* ALWAYS:
    * Riparte sempre a meno che non lo si fermi esplicitamente con uno `stop`.
    * Fa il restar del container stesso senza crearne uno nuovo.
    * Se il container è fermo e rifaccio ripartire il demone, il container riparte.
* UNLESS-STOPPED:
    * Riparte sempre a meno che non lo si fermi esplicitamente con uno `stop`.
    * Fa il restar del container stesso senza crearne uno nuovo.
    * Se il container è fermo e rifaccio ripartire il demone, il container NON riparte.
* ON-FAILURE:
    * Riparte tutte le volte che fallisce.
    * Fa restart del container (indipendentemente se attivo o no) se faccio ripartire il demone.

## Pulizia
* Per pulire tutti i container con forza bruta: `docker container rm $(docker container ls -aq) -f`
    * Cancella tutti i container, sia quelli attivi che quelli fermi (stopped)

## Comandi
* Per avere informazioni dettagliate sulla configurazione, sul runtime e i metadati: `docker container inspect ID|nome`
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
