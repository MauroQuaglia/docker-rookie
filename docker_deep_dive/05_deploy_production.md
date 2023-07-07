# Deploy production

* Bisogna avere uno Swarm inizializzato.
* Il file chiave è il __docker-stack.yml__, che non crea un'immagine ma la vuole già pronta e deploya l'App fatta da più
  microservizi.
* In questo caso siamo in swarm mode, ossia siamo su un Docker host che fa parte di uno swarm.
* Di solito un servizio parte in un container, ma qui ci possono essere delle repliche, quindi può succedere che lo
  stesso servizio sia replicato in più container.
    * In production il concetto si servizio e container è diverso, possiamo pensare a un servizio come a un container
      rafforzato.
    *
* Ci sono due modalità per replicare un servizio:
    * "Replicated": che deploya il numero di repliche specificato uniformemente nello Swarm
    * "Global": che deploya il servizio su tutti i nodi dello Swarm.

* Ci sono due modalità di esposizione delle porte:
    * "Ingress Mode" (default): cioè viene pubblicata la porta di ascolto su tutti i nodi, anche su quelli in cui il
      servizio non è presente.
    * "Host Mode": viene pubblicata la porta solo sui nodi su cui c'è effettivamente il servizio.

# Deploy
* Tiro giù il codice nell swarm e lo deployo con il `docker stack deploy`
* Se un servizio non specifica una rete, viene  creata una rete nome-app_default e il servizio viene asegnato a quella.

# Keyword
* version, services,networks, volumes, secrets
* Si possono specificare varibili di ambiente nel container con `environment` e specificare cose come dove voglio deployare il container `deploy -> placement -> constraint -> "node.role == worker"` ma sono solo esempi di una infinità di cose che posso fare.

# secrets
* `external` 
  * devono esistere nello swarm prima che lo stack venga deployato.
  * e devono essere definite nello stack-file.
  * verrano montate nel container come file regolari con il nome che specifico in "target" e veranno salvate nel container sotto "/run/secrets". 
* `file: <file-name>`
  * creati al momento dell deploy. Ma non è il massimo per la sicurezza.

# Comandi
* `docker service logs [nome-servizio]`
* Per vedere il log del servizio.
* `docker secret ls`
* Per vedere tutti i secret.

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
* `docker stack deploy -c docker-stack.yml [nome stack]`
 * Per deployare 
* `docker stack ls`
* Per vedere tutti gli stack sul Docker swarm.
* `docker stack ps [nome-servizio]`
* Per vedere tutte le caratteristiche di uno stack deployato (servizi, volumi, reti, ...)

