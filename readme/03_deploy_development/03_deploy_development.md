# Deploy development
* Il file chiave è il __docker-compose.yml__, che crea un'immagine a partire dal __Dockefile__ e deploya l'App fatta da più microservizi.
* In questo caso siamo in single-engine mode, ossia siamo su un Docker host che non fa parte di uno swarm.
* Per il deploy `docker-compose up`
    * `-f` per un Dockerfile con un nome custom
    * `-d` per farlo partire in background
* Ogni servizio parte in un container, in development il concetto si servizio e container è praticamente simile.

* Il tool Docker compose (command line docker-compose) è un tool esterno imbullonato sul Docker Engine e deve essere installato esplicitamente sul Docker host.
* `docker-compose --version` per vedere se il tool è installato correttamente.

## keywords
* Le keyword base del docker-compose.yml sono: version, services, networks, volumes, secrets, config.
* version: versione del formato della sintassi del file. Normalmente il Docker Engine, il Docker Compose e il Compose File Formato devono essere compatibili.
* services: elenca le definizioni dei microservizi che compongono l'App. Ogni servizio viene deployato in un container.
* network: di default crea una rete bridge, cioè una rete single host che connette i container sullo stesso host. Se volgimao una rete differtente dobbiamo usare la proprietà "driver".
* volume:
* secret:
* config:

## Comandi
* `docker-compose down`: Per tirare giù l'applicazione. Rimuove container e reti ma non i volumi perché pensati apposta per persistere.
* `docker-compose ps`: Stato corrente dei container dell'App.
* `docker-compose top`: Il processo attivo dentro ogni container dell'App. Il PID che si vede non è quello dentro il container altrimenti sarebbero tutti 1.
* `docker-compose stop`: Per fermare l'App senza cancellare nulla.
* `docker-compose restart`: Per fare ripartire l'App.
* `docker-compose rm`: Cancella containe e reti ma non volumi. Meglio fare prima lo stop.