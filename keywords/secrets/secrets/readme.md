* I secrets non sono salvati come file sul disco dei nodi del cluster, ma vengono gestiti in memoria, per sicurezza, meglio non scrivere niente.
* Sono in sola lettura
* Accessibili solo dai container autorizzati.
* I secrets non sono esposti tramite variabili d'ambiente, che sono visibili a chiunque abbia accesso al container, come pure nei log di sistema e in altre tracce di debug.
* Non funziona senza Swarm: In modalità standalone di Docker (fuori da Swarm), la protezione completa dei secrets non è garantita

Riassumento
* O li creo preventivamente sullo Swarm con (docker secrect create) e poi utilizzo il flag External: "true".
  * che però è scomodo da fare.
* O li carico con un file che percò deve essere in chiaro anche in locale.
  * che è poco sicuro
* La varibile di ambiente ha il problema che è meno sicura di un secrect ma alla fine è  sicuramente più pratica.