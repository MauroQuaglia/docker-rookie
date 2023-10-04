ARG alpine="alpine@sha256:eece025e432126ce23f223450a0326fbebde39cdf496a85d8c016293fc851978"
FROM $alpine

RUN addgroup \
    -g 1000 dockergroup

RUN adduser \
    -h /home/dockeruser \
    -s /bin/bash \
    -u 1000 \
    -G dockergroup \
    -S dockeruser

USER dockeruser
