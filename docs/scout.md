# Docker Scout
* E' un plugin della CLI che va installato, vedi ansible.
* Poi devi avere un account su Docker Hub e ti devi loggare.
* A quel punto puoi usare Docker Scout.

Esempio:
* Se guardo: https://hub.docker.com/layers/library/nginx/stable-alpine/images/sha256-68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03
* Vedo determinate vulnerabilità.

* Se faccio: `docker scout quickview nginx@sha256:68b4297e20ca0f8cd692bf948cfe7b367abd8c33c55aea134aa275e8fd8ebe03`
* Vedo le vulnerabilità!