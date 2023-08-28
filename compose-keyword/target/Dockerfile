# Devo dichioarare il parametro che userò. Questo è passato dal docker-compose
ARG UBUNTU="ubuntu@sha256:b060fffe8e1561c9c3e6dea6db487b900100fc26830b9ea2ec966c151ab4c020"
FROM $UBUNTU AS base

RUN apt-get update \
    && apt-get install nano -y

COPY . /data-base-1

FROM base AS development
COPY . /data-development-1
COPY . /data-development-2

#Così non va, lui fa anche quelle prima... funziona solo se è incrementale del tipo: FROM development AS production
# Tuttavia se poi si guarda dentro al container fa la cosa giusta!
FROM base AS staging
RUN mkdir -p /data-staging-1
COPY text-1.txt /data-staging-1

RUN mkdir -p /data-staging-2
COPY . /data-staging-2

RUN mkdir -p /data-staging-3
RUN mkdir -p /data-staging-4

# CMD ["/bin/bash", "sleep infinity"]

# Due "FROM base" non vanno bene!
# Ecco qui il perché: https://docs.docker.com/build/building/multi-stage/
# Questa cosa funziona solo con BuildKit.

# Questo fa quello che ci si aspetta:
 # DOCKER_BUILDKIT=1 docker build --no-cache -f Dockerfile --target staging .

# Questo no:
 # DOCKER_BUILDKIT=0 docker build --no-cache -f Dockerfile --target staging .

# Per creare l'immagine con un tag dal "docker image build":
 # DOCKER_BUILDKIT=0 docker image build -t mq7:qoturnix --no-cache --target staging .
 # docker container run -it mq7:qoturnix /bin/bash
 # La cosa STRANA è che quando fa la build dell'immagine dice che compila anche development, ma poi se in realtà guardi nel container ha fatto la cosa giusta!
   # Perché ci sono solo le cartelle di base e staging e non quelle di development.
   # Quindi pare che sia solo l'output della build dell'immagine a scrivere cose sbagliate!

# DOCKER_BUILDKIT=1 docker image build -t mq7:qoturnix --no-cache --target staging .
 # docker container run -it mq7:qoturnix /bin/bash
 # Qui è tutto OK, sia l'output della build che il contenuto del container.

# Riassumendo
  # L'output della compilazione dell'immagine è sbagliato a meno che non si usi BuildKit... ma poi nel container le cose sono giuste!
  # Sembra un problema legato solo all'output della compilazione dell'immagine!
