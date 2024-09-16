# Il contesto di build è la cartella dove c'è il Dockerfile.
# Se non metto il .dockerignore, tutto ciò che c'è in questa cartella viene mandato al demone per fare la build.
# Bisogna mandare solo il necessario.
# Devo fare "cd" nella directory per vedere tutte le cose inutili, pensiamo per esempio alla cartella .git.
# Poi, sperimentalmente sembra intelligente e senza la COPY carica solo il Dockerfile, però comunque la cosa giusta è:
# Dove c'è un Dockerfile ci deve essere un .dockerignore.



FROM alpine:latest

COPY . .