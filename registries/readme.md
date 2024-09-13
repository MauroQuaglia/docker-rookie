# Registry

* Per fare la login al DockerHub: `docker login docker.io -u mauroquaglia`
  * Posso scaricare tutto liberamente, il vantaggio  di loggarmi è che è più veloce e che posso scaricare più immagini.
  * Se non mi loggo le immagini si possono scaricare ma è più lento e c'è un limite giornaliero sul numero delle immagini scaricabili.

* Per caricare una immagine sul mio DockerHub devo taggare l'immagine per bene.
  * Il path è: `registry/repository/image:tag`
  * `docker image tag doqer:test_1 mauroquaglia/example:hello`
  * `docker push docker.io/mauroquaglia/example:hello`