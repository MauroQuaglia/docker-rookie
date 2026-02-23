# Digest
* Per esempio in https://hub.docker.com/layers/library/nginx/stable-alpine/images/sha256-68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03
* Secondo me se uso l'`INDEX DIGEST -> sha256:15e96e59aa3b0aada3a121296e3bce117721f42d88f5f64217ef4b18f458c6ab`
  * Posso usare il Dockerfile che contiene l'immagine su tutte le piattaforme.
* Se uso il `MANIFEST DIGEST -> sha256:68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03`
  * Il Dockerfile lo posso buildare solo su una Linux AMD64.