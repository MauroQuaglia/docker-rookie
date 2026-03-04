# https://hub.docker.com/layers/library/ubuntu/latest/images/sha256-98ff7968124952e719a8a69bb3cccdd217f5fe758108ac4f21ad22e1df44d237
ARG IMAGE_TAG="sha256-98ff7968124952e719a8a69bb3cccdd217f5fe758108ac4f21ad22e1df44d237"
FROM ubuntu@${IMAGE_TAG}

# Se lo voglio usare IMAGE_TAG anche dopo il FROM lo devo ridefinire, altrimenti rimane vuoto!
# Se commento la riga dopo, l'echo rimane vuoto!
ARG IMAGE_TAG
RUN echo ${IMAGE_TAG}