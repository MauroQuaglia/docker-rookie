# Network
* Comunicazione Client (docker) - Server (dockerd)
  * Se sono installati sulla stessa machina avviene tramite socket: `/var/run/docker.sock`
  * Se sono installati su macchine diverse, comunicano tramite le seguenti porte:
    * __2375/tcp__: traffico non criptato
    * __2376/tcp__: connessione sicura
* Comunicazione Client (docker) - Swarm
  * __2377/tcp__
* Comunicazione interna dello Swarm
  * __7946/tcp, udp__: Gestione interna Manager - Workers (Swarm)

# Esempio
* Tiro su un container con NginX: `docker run -p 8080:80 --name simply nginx:latest`
* Guardo l'IP: `docker container inspect simply` ---> "IPAddress": ...
* Se poi mi collego a un'altra macchina HostB e faccio curl della mio IP-HostA:8080 vedo che risponde il container.
