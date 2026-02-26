#!/bin/bash

# Then visit http://localhost:9090/targets/

docker container stop prometheus
docker container rm prometheus

docker run --name my-prometheus \
    --mount type=bind,source=./prometheus.yml,destination=/etc/prometheus/prometheus.yml \
    -p 9090:9090 \
    --add-host host.docker.internal=host-gateway \
    prom/prometheus

