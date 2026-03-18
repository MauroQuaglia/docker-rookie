FROM debian:bookworm

ARG DOCKER_GROUP=dockeruser
ARG GID=1000

ARG DOCKER_USER=dockeruser
ARG UID=1000

RUN addgroup -gid $GID $DOCKER_GROUP && \
    adduser --disabled-password --uid 1000 --ingroup $DOCKER_GROUP --shell /bin/bash $DOCKER_USER

COPY msmtprc /home/$DOCKER_USER/.msmtprc

RUN chown $DOCKER_USER:$DOCKER_GROUP /home/$DOCKER_USER/.msmtprc && \
    chmod 600 /home/$DOCKER_USER/.msmtprc
