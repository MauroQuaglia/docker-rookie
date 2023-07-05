# Deploy production
* Il file chiave è il __docker-stack.yml__, che non crea un'immagine ma la vuole già pronta e deploya l'App fatta da più microservizi.
* In questo caso siamo in swarm mode, ossia siamo su un Docker host che fa parte di uno swarm.
* Di solito un servizio parte in un container, ma qui ci possono essere delle repliche, quindi può succedere che lo stesso servizio sia replicato in più container.
  * In production il concetto si servizio e container è diverso, possiamo pensare a un servizio come a un container rafforzato.

