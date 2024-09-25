#! /bin/bash

running=$(docker container ls --quiet)
if [ -n "$running" ]; then
    echo "Stopping running containers..."
    docker container stop ${running}
else
    echo "No running containers to stop."
fi

# Rimuove tutti i container fermi
# tutte le reti non utilizzate
# tutte le immagini (non solo quelle dangling) (--all)
# tutti i volumi non utilizzati (--volume)
# tutte le cache delle build
docker system prune --all --volumes --force

# bisognerebbe però cancellare anche i volumi creati a mano.