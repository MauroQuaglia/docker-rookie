# Deploy development
* Il file chiave è il __docker-compose.yml__, che crea un'immagine a partire dal __Dockefile__ e deploya l'App fatta da più microservizi.
* In questo caso siamo in single-engine mode, ossia siamo su un Docker host che non fa parte di uno Swarm.
* Per il deploy `docker-compose up`
    * `-f` per un file con un nome custom
    * `-d` per farlo partire in background
* Ogni servizio parte in un container, in development il concetto si servizio e container è praticamente simile.
* Il tool Docker compose (command line docker-compose) è un tool esterno imbullonato sul Docker Engine e deve essere installato esplicitamente sul Docker host.

## keywords
* Le keyword base del docker-compose.yml sono: version, services, networks, volumes, secrets, config.
* version: 
  * versione del formato della sintassi del file. 
  * Normalmente il Docker Engine, il Docker Compose e il Compose File Format devono essere compatibili.
* services: 
  * elenca le definizioni dei microservizi che compongono l'App. 
  * Ogni servizio viene deployato in un container.
* network: 
  * di default crea una rete bridge, cioè una rete single host che connette i container sullo stesso host. 
  * Se vogliamo una rete differtente dobbiamo usare la proprietà "driver".
* volume:
* secret:
* config:

## Comandi
* `docker-compose --version`
  * Per vedere se il tool è installato correttamente.
* `docker-compose up &`:
  * Tiro su la App in foreground ma senza bloccare il terminale.
  * Crea tutta l'infrastruttura: build immagine, crea reti, crea volumi e poi fa partire i container.
  * E' utile poi vedere tutto ciò che ha creato con i soliti comandi del tipo `docker image|container|network|volume ls|inspect`
  * Anche qui sono molto utili i comandi:
    * `docker-compose ps`: Stato corrente dell'App
    * `docker-compose top`: Vedere il processo attivo all'interno di ogni container. Il PID che si vede non è quello dentro il container altrimenti sarebbero tutti 1.
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