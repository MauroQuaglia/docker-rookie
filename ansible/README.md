# Docker Standalone
* Crea una macchina con installato Docker, Portainer e un Terminato per il debug.
* Per vedere Portainer da locale: `http://localhost:49152/#!/home`
* Configura anche un demone remoto che io posso contattare dalla mia macchina locale dalla porta `12375`.

# Come ho configurato il demone remoto
* Per la connessione con il demone remoto devo modificare anche il file del servizio oltre alla configurazione del demone.
* Se non faccio nulla si ottiene:
```
SERVIZIO PRIMA DELLA MODIFICA
root@vagrant-dck:~# sudo systemctl status docker
● docker.service - Docker Application Container Engine
Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
Active: active (running) since Fri 2024-10-11 13:16:35 UTC; 55s ago
TriggeredBy: ● docker.socket
Docs: https://docs.docker.com
Main PID: 4001 (dockerd)
Tasks: 8
Memory: 83.0M
CPU: 328ms
CGroup: /system.slice/docker.service
└─4001 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```
* Ma se deployo con ansible anche il file del servizio abbiamo:
```
SERVIZIO DOP LA MODIFICA
root@vagrant-dck:~# sudo systemctl status docker
● docker.service - Docker Application Container Engine
Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
Drop-In: /etc/systemd/system/docker.service.d
└─docker.conf
Active: active (running) since Fri 2024-10-11 13:09:42 UTC; 21s ago
TriggeredBy: ● docker.socket
Docs: https://docs.docker.com
Main PID: 8862 (dockerd)
Tasks: 9
Memory: 32.0M
CPU: 394ms
CGroup: /system.slice/docker.service
└─8862 /usr/bin/dockerd
```

* Esempio 1:
  * Guardo da portainer preventivamente cosa c'è.
  * Faccio `docker context use default`
  * Faccio `docker -H 127.0.0.1:12375 container run -d ubuntu:latest bash -c "sleep infinity"` e vedo che su portainer si aggiunge un nuovo container!

* Esempio 2:
    * Guardo da portainer preventivamente cosa c'è.
    * Posso creare un context per il deploy: `docker context create vagrant --docker host=tcp://127.0.0.1:12375`
    * Faccio `docker context use vagrant`
    * Faccio `docker container run -d nginx:latest bash -c "sleep infinity"` e vedo che su portainer si aggiunge un nuovo container!

* Esempio 3:
  * Quando sono nel context di vagrant viene tutto inviato a quel demone remoto.
  * Per cui, anche su vado su un altro progetto e faccio `docker compose up --build` il tutto viene inviato a quel demone remoto e da portainer della macchina vedo il servizio creato con il docker compose.