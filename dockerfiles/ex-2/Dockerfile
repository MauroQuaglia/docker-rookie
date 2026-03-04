# docker image build -t run:bind .
# docker container run -it run:bind bash

FROM ubuntu:latest

WORKDIR /code

# Montato solo per questo layer e solo per fare il cat.
# Non posso fare il mount in un RUN e il cat in quello successivo.
RUN --mount=type=bind,source=source/data.txt,target=code/data.txt,readonly \
    cat code/data.txt > result.txt
