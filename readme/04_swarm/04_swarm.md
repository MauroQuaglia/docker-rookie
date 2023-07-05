## Swarm
E' un cluster di Docker host (nodi) che permette di orchestrare le varie App. Ogni nodo deve avere Docker installato e verrà poi configurato come "manager" o "worker". La configurazione
e lo stato dello Swarm e tenuta in un database distribuito (etcd) presente su ogni nodo "manager". Questo database non richiede
nessuna configurazione, tutto viene fatto automaticamente e tutto avviente in piena sicuezza (TLS) senza dover fare nulla.
L'oggetto base dello Swarm è il servizio che possiamo pensare come a un container rinforzato.
A livello di rete, tra i vari nodi, le seguenti porte devono essere aperte:
* 2377/tcp: Comunicazione Clinet -> Swarm
* 7946/tcp e udp: Gestione interna Manager - Workers
* 4789/udo: Rete di overlay VXLAN
Dopo aver sistemato le precedenti possiamo costruire lo Swarm.

# Inizializzazione dello Swarm
* Eleggiamo il primo manager, aggiungiamo manager, aggiungiamo worker... finito!
 * `docker swarm init`: fa passare il noso da single-engine-mode a swarm-mode, e il nodo diventa manager.
* L'aggiunta di manager e worker avviene tramite dei token:
 * `docker swarm join ...`
* Lo Swarm è High-Availability, uno o più nodi possono fallire e il tutto continua a funzionare.
* Un solo manger alla volta è attivo, il "leader". Se un altro "manager" (passive) riceve un comando, lo inoltra al manager leader.
  * Il numero giusto di manager è 3 o 5.
* Per sicurezza è meglio mettere un lock sullo Swarw. Cioè se un manager va giù, quando lo faccio risalire non si connetterà automaticamente allo Swarm. Questo 
è un bene perché così posso fare prima dei controlli perché aggiungere un manager con dei problemi può essere deleterio per tutto lo swarm.
Se poi è tutto OK lo posso aggiungere allo Swarm (..., `--autolock=true`, `unlock`, ...)
* Ricordiamo poi che i manager possono agire anche da worker.
* Gira costantemente in background un reconciliation-loop per mantenere allineati lo "stato osservato" con lo "stato desiderato".
* `docker node ls`: Per vedere tutti i ndoi dello Swarm. 