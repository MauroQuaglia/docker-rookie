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

# Risorse
* [Dockerfile](https://docs.docker.com/engine/reference/builder/)