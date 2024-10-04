# Swarm

# Manager
* Mi collego al Manager in SSH: `vagrant ssh vagrant-mng01`
  * Divento root: `su - root`
  * Inizializzo il manager: `sudo docker swarm init --advertise-addr 192.168.56.10`
  * Questo mi restituira il comando per aggiungere i worker: 
    * `docker swarm join --token xxx 192.168.56.10:2377`
* Creo una rete di overlay:
 * `docker network create --driver=overlay default-net`

# Worker
* Mi collego ai worker in SSH:
  * `vagrant ssh vagrant-wrk01`
  * `vagrant ssh vagrant-wrk02`
  * Su entrambe le macchine lancio il comando `docker swarm join --token xxx 192.168.56.10:2377`

# Servizio
* Posso fare partire un servizio (qui l'ho fatto dal manager)
 * `docker service create --detach=true --name quantum --replicas 2 --publish=80:8080 --network default-net spkane/quantum-game:latest`
  * docker service ls
  * docker service ps quantum
  * docker service inspect --pretty quantum
  *  curl http://192.168.56.10
  * Ma anche da browser si vede! http://192.168.56.10/
