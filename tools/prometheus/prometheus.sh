#! /bin/bash

sudo docker container run --rm --name=prometheus_2 -d -p 9099:9090 \
    -v ./prometheus.yaml:/etc/prometheus.yaml \
    prom/prometheus --config.file=/etc/prometheus.yaml