#!/bin/bash

# Tutte le immagini dangling e tutte quelle che non sono usate
docker image prune -af

# Tutti i container non attivi
docker container prune -f

# Tutti i volumi che nessun container usa.
docker volume prune -f

# Tutte le reti che nessun container sta usando
docker network prune -f

# La forma compatta di tutti i comandi precedenti
docker system prune --volumes -f