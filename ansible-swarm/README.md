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


# Portainer 
se metto portainer sul manager:
sudo docker run -d \
-p 9000:9000 \
--name=portainer \
--restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data portainer/portainer-ce
e poi mappo in vagrant current.vm.network('forwarded_port', id: 'tcp', guest: 9000, host: 19000, protocol: "tcp", auto_correct: false)
dovrei vedere ilportainer dello SWARM!


# Stack wip
* Posso provare a clonare questo: git clone https://github.com/spkane/rocketchat-hubot-demo.git --config core.autocrls=input
* TODO mappare la porta in locale:
* e poi fare docker -H 192.168.56.10 stack deploy --compose-file /home/xpuser/mauro-quaglia/docker-rookie/stacks/rocketchat-hubot-demo/stack/docker-compose-stack.yaml rocketchat
* poi dal manager fare docker stack ls

