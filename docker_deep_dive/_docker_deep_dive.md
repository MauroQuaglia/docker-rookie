# Docker
* Default:
    * 1 server -> 1 App (App, SO)
    * Spreco di soldi e risorse
* VMware:
    * 1 server -> + App (App1, SO1) (App2, SO2) (App3, SO1) ...
    * Ogni App ha il suo SO
    * Comunque spreco di risorse, lentezza, manutenzione e licenze di ogni SO
* Container:
    * 1 server -> + App (App1, SO) (App2, SO) ...
    * Tutte le App condividono lo stesso SO di base
    * Ottimizzazione delle risorse, facile per manutenzione e licenze. Veloce e portabile.
    * Difficile da usare
* Docker:
    * Software che crea, gestisce e orchestra i containere.
    * Curiosità sul nome: DOCKER = DOCK workER = scaricatore di porto
* Kubernetes:
    * Coordina i deploy e gestisce le App containerizzate.
    * Può usare como motore sottostante `docker` o `containerd` che sarebbe la parte fondamentale di docker che permette la creazione, l'avvio e lo spegnimento dei container.

# Windows e Linux | macOS
  * L'uso ad alto livello è lo stesso.
  * Può non essere facile portare una App containerizzata da un sistema ad un altro perché il funzionamento dell'App si basa sul SO sottostante.

# Prodotti di Docker, Inc.
  * Docker
  * Doker Desktop (versione di docker per Windows e Mac) 
  * Docker Hub

# L'architettura `docker` è composta di vari livelli:
  * __Runtime__: start e stop dei container
    * __containerd__
      * Il runtime dei container. Gestisce il ciclo di vita dei container.
      * `docker-containerd` è un solo processo
    * __runc__
      * Il livello più basso che parla con il SO e aderisce agli standard OCI - Open Container Initiative
      * `docker-runc` un processo per ogni container
  * __Engine o demone__
    * Parla con i container, gestisce le reti, i volumi, le immagini, ...
    * `dockerd` un solo processo
  * __Docker Swarm__:
    * La gestione dei "cluster di nodi Docker" (swarm)

# Come usare Docker
* Ci sono due livelli:
  * Docker Client
  * Docker Engine (che sarebbe il demone dokerd)
* Il tipico flusso è questo:
  * Client (1) -> demone (dockerd) (1) -> containerd (1) -> runc (n) 
  * Il Client comunica con l'Engine tramite socket (`/var/run/docker.sock`)
  * Tipicamente il Client e l'Engine sono sullo stesso Docker Host (il PC) ma volendo si possono anche dividere e mettere su macchine separate facendoli comunicare via https.

# Immagini
* Pensiamola come a un oggetto che contiene un filesystem di un SO, un'applicazione e tutte le sue dipendenze.
* Nel mondo Docker una immagine è un container fermo.
* Uno dev la può pensare come a una classe.

# Swarm
* E' un insieme di docker host configurati per l'orchestrazione.
* Docker Swarm (è più semplice ma fa meno cose) di Kubernetes (che è più complesso ma fa più cose)
  * Alla fine se non ho cose molto complesse il Docker Swarm è la soluzione migliore. 
* Il mio docker host è in single-engine mode. Se faccio `docker swarm init` diventa in swarm-mode. E' stato creato uno swarm e il mio docker host è il primo manager dello swarm. Poi a questo manager posso aggiungere
altri manager o worker tramite un token di configurazione.

# Servizi
* I servizi si applicano sono alla modalità swarm, e permettono di specificare il numero delle replice. Ci sono due modi di creare un servizio:
da linea di comando `docker service create` oppure tramite uno stack file.
* 
# Reti
* Da Internet:
  * __None__: il container riceve uno stack di rete, che però è privo di connessione esterna. Questa modalità è utile per testare i container, predisporre un container per una successiva connessione di rete e per l'assegnazione ai container che non richiedono comunicazioni esterne.
  * __Bridge__: container collegati a un bridge su una rete host interna e autorizzati a comunicare con altri container sullo stesso host. Non è possibile accedere ai container dall'esterno dell'host. La rete bridge è quella predefinita per i container Docker.
  * __Host__: questa configurazione consente a un container creato di condividere lo spazio dei nomi di rete dell'host, concedendo al container l'accesso a tutte le interfacce di rete dell'host. È la meno complessa tra le configurazioni di rete esterna, ma è soggetta a conflitti tra le porte dovuti all'uso condiviso delle interfacce di rete.
  * __Underlay__: gli underlay aprono le interfacce host direttamente ai container in esecuzione sull'host ed eliminano la necessità di mappatura delle porte, rendendoli più efficienti dei bridge.
  * __Overlay__: gli overlay utilizzano i tunnel di rete per la comunicazione tra gli host, consentendo ai container di agire come se si trovassero sulla stessa macchina quando sono ospitati su host diversi.
* Dal libro:
  * __single-host bridge__ (default): comune a tutti i container sullo stesso docker host.
  * __multi-host overlay__: comune a tutti i container su host differenti.
Sulla bridge di default i container __non si possono parlare per nome__ perché non viene usato il Docker DNS Service. Se invece creo una bridge custom invece sì perché verrà usato il Docker DNS Service.
Provare da dentro un container a fare `ipconfig` e poi dal docker host a fare `docker network inspect localhost`.

# Log
* Demone:
  * Per vedere i log: `journalctl -u docker.service`
  * Verbosità: editare il `daemon.json` e cambiare il log-level, poi fare restart.
* Container:
  * Standalone container: `docker container logs`
  * Swarm service: `docker logs [nome-container]`, `docker service logs [nome-servizio]`.
* Docker:
  * `docker logs`: nel daemon,js c'è specificato il driver di log di default, tuttavia posso configurare un container o servizio con un particolare driver di log (`--log-driver`)