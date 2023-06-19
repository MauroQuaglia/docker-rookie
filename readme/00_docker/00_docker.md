# Docker
* Comunicazione: Client (`docker`) ---> Server (`dockerd`)
* La comunicazione avviene tramite socket `/var/run/docker.sock` quando Client e Server sono sullo stesso host.
* Il Server è chiamato anche __demone__ o __engine__ ed è costituito da `demone` + `containerd` + `runc`.

* Per vedere che la comunicazione tra Client e Server funzioni correttamente:
  `docker --info`

* Per vedere la versione di Docker:
  `docker --version`

* Per vedere informazioni riguardo ai container attivi sull'host e al processo del `containerd`:
  `ps -aux | grep 'docker'`

* Per fare il restart di Docker sull'host:
  `systemctl restart docker`