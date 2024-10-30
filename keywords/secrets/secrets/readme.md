* I secrets non sono salvati come file sul disco dei nodi del cluster, ma vengono gestiti in memoria, per sicurezza, meglio non scrivere niente.
* Sono in sola lettura
* Accessibili solo dai container autorizzati.
* I secrets non sono esposti tramite variabili d'ambiente, che sono visibili a chiunque abbia accesso al container, come pure nei log di sistema e in altre tracce di debug.
* Non funziona senza Swarm: In modalità standalone di Docker (fuori da Swarm), la protezione completa dei secrets non è garantita