#! /bin/bash

sudo docker container run --rm --name=prometheus -d -p 9090:9090 \
    -v ./prometheus.yaml:/etc/prometheus.yaml \
    prom/prometheus --config.file=/etc/prometheus.yaml