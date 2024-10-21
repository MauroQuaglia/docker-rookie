# Healthcheck
* L'healthcheck non impedisce all'app di rispondere, mi sta solo dicendo che c'è qualcosa che non va nel container.
* E' solo un segnale, che eventualmente qualcuno può intercettare e agire di conseguenza ma di per se non fa altro.

# Esempio
* Usando solo `Dockerfile` per locale.
* Usando solo `compose.yml` per locale.
* Usamdo solo `stack.yml` per produzione.

* In locale non ci sono effetti se non il vedere il container nello stato unhealthy.
* Nello Swarm invece, impostando bene la `failure_action` del processo di deploy, si vede che se c'è su un container buono e faccio un deploy con un nuovo stack con
  un container che ha un healthcheck che fallisce, ci prova a fare deploy... ma poi alla fine fa `rollback`.
