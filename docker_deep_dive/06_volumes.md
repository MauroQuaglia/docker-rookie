# Volumes
* `docker volume ls`
    * Per vedere tutti i volumi montati.
* * volumi
* I volumi sono importanti perché permettono di salvare dati al di fuori di un container. Se il container viene cancellato i dati sul volume rimangono.
* Si possono salavre dati anche all'interno del container. Se fermo e faccio ripartire il container i dati rimangono ma se cancello il container i dati vengono persi... anche se fisicamente presenti sul docker host questi alla cancellazione del container vengono cancellati.