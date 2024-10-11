Per la connessione con il demone remoto devo modificare anche il file del servizio oltre alla configurazione del demone.
Se non faccio nulla si ottiene:
```
PRIMA DEL SERVIZIO
root@pg-vagrant:~# sudo systemctl status docker
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
Ma se deployo con ansible anche il file del servizio abbiamo
```
DOPO IL SERVIZIO
root@pg-vagrant:~# sudo systemctl status docker
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

* Se faccio poi `docker context list` vedo che posso deployare anche sulla macchina remota.
  
* Esempio 1:
  * Guardo da portainer preventivamente cosa c'è.
  * Faccio `docker context use default`
  * Faccio `docker -H 127.0.0.1:12375 container run -d ubuntu:latest bash -c "sleep infinity"` e vedo che su portainer si aggiunge un nuovo container!

* Esempio 2:
    * Guardo da portainer preventivamente cosa c'è.
    * Faccio `docker context use vagrant`
    * Faccio `docker container run -d nginx:latest bash -c "sleep infinity"` e vedo che su portainer si aggiunge un nuovo container!
