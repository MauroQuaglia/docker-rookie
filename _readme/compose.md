# Documentazione
[reference](https://docs.docker.com/reference/compose-file/)
[awesome-compose](https://github.com/docker/awesome-compose)

# Deploy development
* Il `compose.yml` è per il Single Engine Mode.
* Il file chiave è il __compose.yml__, che crea un'immagine a partire dal __Dockefile__ e deploya l'App fatta da più microservizi.
* In questo caso siamo in single-engine mode, ossia siamo su un Docker host che non fa parte di uno Swarm.
* Per il deploy `docker compose up`
  * `-f` per un file con un nome custom
  * `-d` per farlo partire in background
* Ogni servizio parte in un container, in development il concetto di servizio e container è praticamente simile.
* Il tool Docker compose (command line docker compose) è un plugin imbullonato sul Docker Engine e deve essere installato esplicitamente sul Docker host.

## keywords
* https://docs.docker.com/reference/compose-file/
* Le keyword base del compose.yml sono: services, networks, volumes, secrets, config.
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
* `docker compose up &`:
  * Tiro su la App in foreground ma senza bloccare il terminale.
  * Crea tutta l'infrastruttura: build immagine, crea reti, crea volumi e poi fa partire i container.
  * E' utile poi vedere tutto ciò che ha creato con i soliti comandi del tipo `docker image|container|network|volume ls|inspect`
  * Anche qui sono molto utili i comandi:
    * `docker compose ps`: Stato corrente dell'App
    * `docker compose top`: Vedere il processo attivo all'interno di ogni container. Il PID che si vede non è quello dentro il container altrimenti sarebbero tutti 1.
* `docker compose up -d`:
  * Tiro su la App in background.
* `docker compose down`:
  * Ferma e cancella l'App.
  * Butta container e reti
  * Non butta immagini e volumi
* `docker compose stop`:
  * Ferma l'App ma non cancella nulla.
  * Se poi la voglio cancellare devo fare `docker compose rm`
  * Se poi la voglio fare ripartire devo fare `docker compose restart`
* `docker compose config`: fa il check della configurazione
* `docker compose build`: build preventivo delle immagini necessarie
* `docker compose logs`: mi fa vedere un po' di messaggistica
* `docker compose exec [name] [cmd]`: anche in questo caso posso collegarmi a un singolo container (non serve passare il -it) perché il docker compose è un tool a parte che fa cose diverse del comando "docker".
* `docker compose logs [name]`: i log di un service
* `docker compose start|stop|pause|unpause [name]|[tutto]`: di un singolo servizio o di tutto!
* Nel docker compose si possono usare delle variabili `$` che fanno riferimento a un file specifico `.env` e che vengono prese in automatico.