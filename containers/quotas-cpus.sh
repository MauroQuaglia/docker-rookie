#! /bin/bash

# Sulle CPU sono dei soft-limit.
# https://docs.docker.com/engine/containers/resource_constraints/

# Quante CPU vorrei avere disponibil nel container. Docker fa i conti per impostare i cgroups correttamente.
# cpus=[0.01...num-tot-di-cpu]
# C'è da dire che se la macchina non è particolarmente carica e c'è disponiblità l'impostazione non viene considerata.
# Avrà effetto quando il sistema sarà sotto stress e in questo modo sappiamo che a questo container più di 2 CPU non gli diamo.
# Queste impostazioni non sono degli hard-limits, hanno effetto solo quando c'è competizione tra i container per l'utilizzo delle CPU.

docker container run \
    --rm -it \
    --cpus="2" \
    spkane/train-os stress --verbose --cpu 2 --io 1 --vm 2 --vm-bytes 128 --timeout 120s
