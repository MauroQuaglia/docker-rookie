# Local Swarm
* Tiro su in locale uno swarm al volo per provare i miei stack.yml.
* Se voglio una cosa molto raffinata e completa posso usare il mio Swarm su Vagrnat, se voglio una cosa rapida posso anche usare questo.
* Creazione: `docker swarm init --advertise-addr enp1s0`
* Distruzione: `docker swarm leave --force`
* Ci metto poi anche un Portainer che non fa mai male. 
  * Non serve mettere il portainer stack, questo che viene messo va bene. Capisce da solo che è su uno swarm.
* Dopodiche posso deployare in locale un eventuale stack, anche solo per prova.

# Esempio
* Se compilo con `docker compose build --no-cache` il SolrCoupon.
* Poi mi basta mettere l'immagine appena compilata `solr-coupon-solr` nel file dello stack e deployarlo in locale:
  * `docker stack deploy --compose-file compose.production.yml -d solr-coupon`