# Containers
* E' il runtime di un'immagine.
* Il comando di base è `docker container run -it <image> <app>` (`docker container run -it ubuntu:latest /bin/bash`)
* Il container rimane attivo finché l'app che sta esegundo (PID = 1) rimane in esecuzione.
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

## Esempio di uso di --pid=host
```
docker container run --name aaa -d ubuntu:latest /bin/bash -c "sleep infinity"
Console: ps -aux | grep infinity --color
docker container exec -it aaa /bin/bash
Container: ps -aux | grep infinity --color

docker container run --name bbb -d --pid=host ubuntu:latest /bin/bash -c "sleep infinity"
Console: ps -aux | grep infinity --color
docker container exec -it bbb /bin/bash
Container: ps -aux | grep infinity --color
```

# Rootles mode (alcune informazioni)
* Quando lancio il container con `-u`, i l processo nel container viene lanciato con quell'utente, che non è `root`. Tuttavia il processo che istanzia
il container (lanciato dal demone) viene lanciato con utente `root`.
Con il Rootless mode anche quest'ultimo processo viene lanciato senza i privilegi di `root`. Questo migliora la sicurezza.
* Il Rootless serve per lanciare il container senza i privilegi di `root`, ma non è banale da usare, servono alcuni setup e l'attivazione del `linger`!

# Capabilities
* Se uso `--privileged=true` sto dando al container molto potere. 
  * Piuttosto è meglio usare la capabilities `--cap-add` (si possono anche rimuovere con `--cap-drop`) 
  * Per un controllo sempre più raffinato, insieme alle capabilities si può usare il Secure Computing Mode (`seccomp`). 
  * Per esempio un `--cap-add=SYS_ADMIN --security-opt seccomp=my-file-configuration.json` dove `--cap-add=SYS_ADMIN` da molto potere, ma `--security-opt seccomp=my-file-configuration.json` controlla ogni singola azione che si può fare.

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
* `docker container diff` bello perché fa vedere la differenza del sistema opertativo prima e dopo il lancio di un comando così si può vedere se quel comando ha aggiunto o modificato cose nel container.

# Per costruire container - cose da fare
* I setting del `Dockerfile` sono i default che poi ogno container può sovrascrivere a suo piacimento.
* Se faccio `mount` dentro un container posso vedere tutto ciò che è linkato come risorsa dall'host (`/var/lib/docker/container`) al container
  * ES: `/dev/sda9` (che sta nel filesystem dell'host) on `/etc/hostname` (che sta nel container) 
* `--name` dare un nome al container
* `--label` per aggiungere dei metadati al container oltre a quelli che eredita dall'immagine
* `--user` (il default è root) per cambiare l'utente all'interno del container
* `--hostname` per dare un hostname al container invece dell'ID alfanumerico
* `--rm` per buttare il container una volta che sono uscito
* `-i` per abilitare una sessione interattiva e tenere lo STDIN aperto
* `-t` per allocare una tty
* `--dns`, `--dns-search` per modificare il file `resolv.conf` che di default è uguale a quello dell'host. FQDN --> DNS(`resolv.conf`) --> IP
* `-v`, `--mounbt` per montare volumi. 
  * Usare i path completi. 
  * Di default i volumi vengono montati read-write.
* Resource Quotas (devo sfruttare i `cgroup` = gestione delle risorse dei processi per il container)
  * CPU SHARES: `-cpu-share`, 1024 = 100%, 512 significa che il container non può usare più del 50% delle risorse della CPU. Ha effetto solo quando c'è competizione sulle risorse. 
  * CPU PINNING: `--cpuset-cpus=[0-8]` vincolare un container a girare solo su alcuni core e non su latri.
  * `--cpus` è il comando più moderno
  * `--memory`, `--memory-swap` controllo e limitazione sull'uso della memoria
  * block I/O limit: `--device-read-iops`, ...
* `--read-only`: se voglio essere sicuro che il container non scriva nel file system
* ulimits (prima dell'avvento dei cgroupo ma ancora validi e usati)
  * `ulimit -a` sull'host per vedere su cosa posso avere effetto 
  * Posso mettere un default al `dockerd` per fare in modo che tutti i container partano con delle limitazioni. Volendo posso anche impostarlo al singolo container.
* `--restart` è la politica di restart del container.
* `pause` e `unpause`, posso mettere in pausa un attimo un container, per liberare un po' di risorse e poi riabilitarlo.
* `run (-it da non mettere)`: posso vedere l'output del container direttamente sulla console
* `--init`: lancia `tini` (PID=1) nel container che è un leggerissimo sistema operativo che si occupa di eliminare eventuali processi zoombie.
  * PID=1 è colui che in Linux si occupa anche degli zoombie.
* `diff`: utile per vedere se il processo  principale effettua degli Added/Changed di file o directory rispetto al filesystem originale.
* `--pid=host`: il container condivide il namespace dei PID dell'host così che vedo lo stesso PID da dentro e da fuori il container.