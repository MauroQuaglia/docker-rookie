#! /bin/bash

# Sulla memoria sono degli hard-limit


docker container run \
    --rm -it \
    --memory 6m \
    spkane/train-os stress --verbose --cpu 2 --io 1 --vm 2 --vm-bytes 128 --timeout 120s
