# compose-test-2

# Compose (DEV) locale
* Per il development basta fare `docker compose  up -d`.
* Per vederel'app: http://0.0.0.0:7654/hello

# STACK (PRO) simulato in locale
* Faccio un `docker swarm init` e creo uno Swarm in locale.
* Preparo l'immagine di frontend: `docker image build -t app:1 .`
* Faccio `docker stack deploy --compose-file stack.yaml swarmie` e deployo in locale.
* Per vederel'app: http://0.0.0.0:7654/hello