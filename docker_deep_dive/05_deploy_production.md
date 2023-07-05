# Deploy production
* Bisogna avere uno Swarm inizializzato.
* Il file chiave è il __docker-stack.yml__, che non crea un'immagine ma la vuole già pronta e deploya l'App fatta da più microservizi.
* In questo caso siamo in swarm mode, ossia siamo su un Docker host che fa parte di uno swarm.
* Di solito un servizio parte in un container, ma qui ci possono essere delle repliche, quindi può succedere che lo stesso servizio sia replicato in più container.
  * In production il concetto si servizio e container è diverso, possiamo pensare a un servizio come a un container rafforzato.
  * 
* Ci sono due modalità per replicare un servizio:
  * "Replicated": che deploya il numero di repliche specificato uniformemente nello Swarm
  * "Global": che deploya il servizio su tutti i nodi dello Swarm.

* Ci sono due modalità di esposizione delle porte:
  * "Ingress Mode" (default): cioè viene pubblicata la porta di ascolto su tutti i nodi, anche su quelli in cui il servizio non è presente.
  * "Host Mode": viene pubblicata la porta solo sui nodi su cui c'è effettivamente il servizio.


Aggiungere i comandi di #services... e dello stack

