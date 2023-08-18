FROM alpine:latest AS base
COPY . /data-base-1

FROM base AS development
COPY . /data-development-1
COPY . /data-development-2

#Così non va, lui fa anche quelle prima... funziona solo se è incrementale del tipo: FROM development AS production
FROM base AS staging
COPY . /data-staging-1
COPY . /data-staging-2
COPY . /data-staging-2

# In sostanza posso dirgli dove fermarsi a fare la build dell'immagine ma deve andare ad aumentare, non posso dire quale immagine fare.
# Due FROM base non vanno bene!
# Ecco qui il perché: https://docs.docker.com/build/building/multi-stage/
