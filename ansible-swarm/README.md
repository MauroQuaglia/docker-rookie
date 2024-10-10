# Swarm

## Configurazione
* Basta lanciare un ansible: 
  * `ansible-playbook swarm-playbook.yml --ask-vault-pass -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"'`

## Manager
* Mi collego al Manager in SSH: `vagrant ssh vagrant-mng01`
  * Divento root: `su - root`
* Posso collegarmi anche con `ssh vagrant@localhost -p 2310 -i ./.vagrant/machines/vagrant-mng01/virtualbox/private_key` 
  
## Worker
* Mi collego ai worker in SSH:
  * `vagrant ssh vagrant-wrk01`
  * `vagrant ssh vagrant-wrk02`

## Servizio
* Posso fare partire un servizio (qui l'ho fatto dal manager)
 * `docker service create --detach=true --name quantum --replicas 2 --publish=80:8080 --network default-net spkane/quantum-game:latest`
  * docker service ls
  * docker service ps quantum
  * docker service inspect --pretty quantum
  *  curl http://192.168.56.10
  * Ma anche da browser si vede! http://192.168.56.10/

## Portainer 
* Se creo lo swarm ma non mi collego, dopo 5 minuti Portainer si lamenta e richiede un restart.
  * [your-portainer-instance-has-timed-out-for-security-purposes](https://portal.portainer.io/knowledge/your-portainer-instance-has-timed-out-for-security-purposes)
* Nel caso bsata andare sul manager e riavviare i container di portainer:
  * Esempio: `docker container restart 574b80cdfb9b b29a1a5d16ca`

## Deploy
* Bisogna configurare il demone per accettare anche connessioni tcp:
```
  "hosts": [
    "tcp://0.0.0.0:2375",
    "unix:///var/run/docker.sock"
    ]
```
* Verificare il mapping delle porte: `vagrant port vagrant-mng01`
* Loggarsi sul manager con `vagrant ssh vagrant-mng01` e fare `ss -tulpn`
* Da locale `telnet localhost 12375`

  
## Stack wip
* Posso provare a clonare questo: git clone https://github.com/spkane/rocketchat-hubot-demo.git --config core.autocrls=input
* TODO mappare la porta in locale:
* e poi fare docker -H 192.168.56.10 stack deploy --compose-file /home/xpuser/mauro-quaglia/docker-rookie/stacks/rocketchat-hubot-demo/stack/docker-compose-stack.yaml rocketchat
* poi dal manager fare docker stack ls

# TMP
Se stai cercando di deployare uno stack Docker da remoto, devi configurare Docker per ascoltare su 2375 (non sicura) o 2376 (sicura con TLS).
La porta 2377 è invece utilizzata internamente da Docker Swarm per la comunicazione tra i nodi del cluster.