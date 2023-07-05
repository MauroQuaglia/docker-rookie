# Log
* Demone:
  * Per vedere i log: `journalctl -u docker.service`
  * Verbosità: editare il `daemon.json` e cambiare il log-level, poi fare restart.
* Container:
  * Standalone container: `docker container logs`
  * Swarm service: `docker logs [nome-container]`, `docker service logs [nome-servizio]`.
* Docker:
  * `docker logs`: nel daemon,js c'è specificato il driver di log di default, tuttavia posso configurare un container o servizio con un particolare driver di log (`--log-driver`)