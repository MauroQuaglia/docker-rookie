# Swarm
* Creo uno Swarm su macchine vagrant.

# Premessa
* Il playbook è migliorabile perché ora è tutto dentro ai ruolo, per esempio per portainer o l'init dello Swarm.
* Si potrebbe fare un playbook con diversi Play che girano sul Manager e sui Worker, però fa niente, va bene anche così.

## Configurazione
* Basta lanciare un ansible: 
  * `ansible-playbook playbook.yml --ask-vault-pass -e 'ansible_ssh_common_args="-o StrictHostKeyChecking=no"'`

## Manager
* Mi collego al Manager in SSH: `vagrant ssh vagrant-mng01`
  * Divento root: `su - root`
* Posso collegarmi anche con `ssh vagrant@localhost -p 2310 -i ./.vagrant/machines/vagrant-mng01/virtualbox/private_key` 
  
## Worker
* Mi collego ai worker in SSH:
  * `vagrant ssh vagrant-wrk01`
  * `vagrant ssh vagrant-wrk02`

## Servizio
* Posso fare partire un servizio (qui l'ho fatto entrando nel manager)
 * `docker service create --detach=true --name quantum --replicas 2 --publish=80:8080 --network default-net spkane/quantum-game:latest`
  * `docker service ls`
  * `docker service ps quantum`
  * `docker service inspect --pretty quantum`
  *  `curl http://192.168.56.10`
  * `Ma anche da browser si vede! http://192.168.56.10/`

## Portainer 
* Se creo lo Swarm ma non mi collego, dopo 5 minuti Portainer si lamenta e richiede un restart.
  * [your-portainer-instance-has-timed-out-for-security-purposes](https://portal.portainer.io/knowledge/your-portainer-instance-has-timed-out-for-security-purposes)
* Nel caso basta andare sul manager e riavviare i container di portainer:
  * Esempio: `docker container restart 574b80cdfb9b b29a1a5d16ca`
* Per vederloin locale: `http://localhost:19000/#!/home`

## Deploy
* Bisogna configurare il demone per accettare anche connessioni tcp:
```
  "hosts": [
    "tcp://0.0.0.0:2375",
    "unix:///var/run/docker.sock"
    ]
```
* Basta configurare il Manager in questo modo, perché la cosa giusta è deployare lo stack verso il manager.
* Il Manager dovrebbe essere messo in `drain` perché lui dovrebbe occuparsi solo della gestione dello Swarm e i worker di fare il lavoro.
* Lo posso anche mettere a mano da Portainer.

## Stack prova
* Posso provare a clonare questo: `git clone https://github.com/spkane/rocketchat-hubot-demo.git --config core.autocrls=input`
* `docker context use vagrant`
* Dalla directory `stacks/rocketchat-hubot-demo/stack`
* Fare `docker stack deploy --compose-file docker compose-stack.yaml rocketchat`
* Da Portainer dello Swarm dovrei vedere cose.