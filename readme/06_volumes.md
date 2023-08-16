# Volumes
* Ci sono i:
  * data-volume (4h4j39823j...), gestiti da Docker che servono per archiviare i dati (condivisione gratis nello Swarm)
  * bind-volume (/var:/app...), da gestire, che servono per mettere in comunicazione un file o una cartella dell'host con il container (qui la condivisone nello swarm è da vedere perché dipendono dal file sull'host.)
* Ogni container viene creato aggiungendo un piccolo layer read-write sulla cima dell'immagine.
* Questo writable layer esise nel file-system del Docker Host in "/var/lib/docker/<storage-driver>".
* Docker crea i volumi con il local driver. Se voglio specificare un driver diverso devo usare il `-d`.
  * Si possono scaricare diversi driver, bisogna guardare su Docker Hub e scaricarli come plugin.
  * `docker plugin install ...`
  * `docker plugin ls`
  * `docker volume create -d [nome-plugin]`
  * `docker volume ls`
    * Per vedere tutti i volumi montati.
* I volumi sono importanti perché permettono di salvare dati al di fuori di un container. Se il container viene cancellato i dati sul volume rimangono.
* Si possono salvare dati anche all'interno del container. Se fermo e faccio ripartire il container i dati rimangono ma se cancello il container i dati vengono persi... anche se fisicamente presenti sul docker host questi alla cancellazione del container vengono cancellati.