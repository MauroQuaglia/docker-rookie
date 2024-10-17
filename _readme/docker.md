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
    * Gestisce il ciclo di vita dei container.
  * __runc__
    * Il livello più basso che parla con il SO e aderisce agli standard OCI - Open Container Initiative
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
  * Client (`docker`) ---> Server (`dockerd`)
  * La comunicazione avviene tramite socket `/var/run/docker.sock` quando Client e Server sono sullo stesso host.
  * Tipicamente il Client e l'Engine sono sullo stesso Docker Host (il PC) ma volendo si possono anche dividere e mettere su macchine separate facendoli comunicare via https.
  * Il Server è chiamato anche __demone__ o __engine__ ed è costituito da `demone` + `containerd` + `runc`.
* Il Client può parlare anche con più server remoti. Vedere il comando `docker context`. 
  * Dato che l'immagine la fa il server (Il client invia al server i file per fare la build), io potrei deployare una mia immagine su un host remoto.
* La configurazione del Server è in `/etc/docker/daemon.json`
* Guardare qui /etc/apt/sources.list.d per vedere da dove apt va a scaricare il pacchetto di docker.

# Comandi
* Per vedere che la comunicazione tra Client e Server funzioni correttamente:
  `docker --info`

* Per vedere la versione di Docker:
  `docker --version`

* Per vedere informazioni riguardo ai container attivi sull'host e al processo del `containerd`:
  `ps -aux | grep 'docker'`

* Per fare il restart di Docker sull'host:
  `systemctl restart docker`
* `docker version`:
  * Tutte le informazioni riguardanti il Client e il Server di Docker.
* `docker info`:
  * Tutte le informazioni rigurado il numero attuale dei container, immagini, e altro presenti sulla macchina.
* `systemctl is-active docker`
  * Check dello status del demone Docker.
* `systemctl restart docker`
  * Far ripartire il demone.
* Per fare partire il demone docker al boot dell'host:
  * `systemctl enable docker`