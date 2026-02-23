# Digest
* Per esempio in https://hub.docker.com/layers/library/nginx/stable-alpine/images/sha256-68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03
* Secondo me se uso l'`INDEX DIGEST -> sha256:15e96e59aa3b0aada3a121296e3bce117721f42d88f5f64217ef4b18f458c6ab`
  * Posso usare il Dockerfile che contiene l'immagine su tutte le piattaforme.
* Se uso il `MANIFEST DIGEST -> sha256:68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03`
  * Il Dockerfile lo posso buildare solo su una Linux AMD64.

----

* Creo una immagine in locale, per esempio da `images/small/alpine`:
    * `docker image build -t quaglia:latest .`

* Controllo il digest:
    * `docker image ls --digests`
    * Non vedo il digest, perché questo viene calcolato su un manifest che non ho.

* Controllo l'immagine:
    * `docker image inspect quaglia:latest`
    * Vedo un image Id, quello c'è sempre.

* Faccio push sul mio Docker Hub:
    * `docker login docker.io -u mauroquaglia`

* Quando faccio push, per vivere sul Docker Hub l'immagine deve avere un manifest, per cui me lo crea lui.
    * `docker image tag quaglia:latest mauroquaglia/example:quaglia`
    * `docker image push docker.io/mauroquaglia/example:quaglia`

* Ora sul dockerHub la vedo.
* Pulisco tutto in locale!

* Riprendo l'immagine:
  *` docker image pull docker.io/mauroquaglia/example:quaglia`

* Controlo il manifest
    * `docker image inspect mauroquaglia/example:quaglia`
    * Ora lo vedo!
    * `docker manifest inspect mauroquaglia/example:quaglia`