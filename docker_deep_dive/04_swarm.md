# Swarm
E' un cluster di Docker host (nodi) che permette di orchestrare le varie App. 
Ogni nodo deve avere Docker installato e verrà poi configurato come "manager" o "worker". 
La configurazione e lo stato dello Swarm è tenuta in un database distribuito (etcd) presente su ogni nodo "manager". 
Questo database non richiede nessuna configurazione, tutto viene fatto automaticamente e tutto avviente in piena sicuezza (TLS) senza dover fare nulla.
L'oggetto base dello Swarm è il servizio che possiamo pensare come a un container rinforzato.
* I servizi si applicano sono alla modalità swarm, e permettono di specificare il numero delle replice. Ci sono due modi di creare un servizio: da linea di comando `docker service create` oppure tramite uno stack file.

* A livello di rete, tra i vari nodi, le seguenti porte devono essere aperte:
  * __2377/tcp__: Comunicazione Client -> Swarm
  * __7946/tcp, udp__: Gestione interna Manager - Workers
  * __4789/udp__: Rete di overlay VXLAN
  
Dopo aver sistemato le precedenti possiamo costruire lo Swarm.

# Inizializzazione dello Swarm
* Docker Swarm (è più semplice ma fa meno cose) di Kubernetes (che è più complesso ma fa più cose)
  * Alla fine se non ho cose molto complesse il Docker Swarm è la soluzione migliore.
* Eleggiamo il primo manager, aggiungiamo manager, aggiungiamo worker... finito!
 * `docker swarm init`: fa passare il nodo da single-engine-mode a swarm-mode, e il nodo diventa manager.
* L'aggiunta di manager e worker avviene tramite dei token:
 * `docker swarm join ...`

* Lo Swarm è High-Availability, uno o più nodi possono fallire e il tutto continua a funzionare.
* Un solo manger alla volta è attivo, il "leader". Se un altro "manager" (passive) riceve un comando, lo inoltra al manager leader.
  * Il numero giusto di manager è 3 o 5.
* Per sicurezza è meglio mettere un lock sullo Swarm. 
  * Cioè se un manager va giù, quando lo faccio risalire non si connetterà automaticamente allo Swarm. 
  * Questo è un bene perché così posso fare prima dei controlli, perché aggiungere un manager con dei problemi può essere deleterio per tutto lo Swarm.
  * Se poi è tutto OK lo posso aggiungere allo Swarm (..., `--autolock=true`, `unlock`, ...)
* Ricordiamo poi che i manager possono agire anche da worker.
* Gira costantemente in background un reconciliation-loop per mantenere allineati lo "stato osservato" con lo "stato desiderato".

# Comandi

## Swarm
* `docker node ls`: Per vedere (da un manager) tutti i nodi dello Swarm, sia manager che worker.
* `docker service logs [nome-servizio]`
* Per vedere il log del servizio.
* `docker secret ls`
* Per vedere tutti i secret.
* 
## Services
* `docker service ls`
  * Per vedere tutti i servizi attivi nello swarm.
* `docker service ps [nome-servizio]`
  * Per vedere lo stato del servizio.
* `docker service inspect [nome-servizio]`
  * Per vedere i dettagli del servizio
* `docker service scale [nome-servizio]=1|2|3|...`
  * Per replicare il servizio il numero di volte che voglio
* `docker service rm [nome-servizio]`
  * Per rimuovere il servizio.
* `docker service logs [nome-servizio|replica ID]`
  * Per vedere tutti i log del servizio o solo quelli di una specifica replica.

## Stack
* `docker stack ls`
* Per vedere tutti gli stack sul Docker swarm.
* `docker stack ps [nome-servizio]`
* Per vedere tutte le caratteristiche di uno stack deployato (servizi, volumi, reti, ...)