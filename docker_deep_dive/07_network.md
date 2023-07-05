# Network
* Da Internet:
    * __None__: il container riceve uno stack di rete, che però è privo di connessione esterna. Questa modalità è utile per testare i container, predisporre un container per una successiva connessione di rete e per l'assegnazione ai container che non richiedono comunicazioni esterne.
    * __Bridge__: container collegati a un bridge su una rete host interna e autorizzati a comunicare con altri container sullo stesso host. Non è possibile accedere ai container dall'esterno dell'host. La rete bridge è quella predefinita per i container Docker.
    * __Host__: questa configurazione consente a un container creato di condividere lo spazio dei nomi di rete dell'host, concedendo al container l'accesso a tutte le interfacce di rete dell'host. È la meno complessa tra le configurazioni di rete esterna, ma è soggetta a conflitti tra le porte dovuti all'uso condiviso delle interfacce di rete.
    * __Underlay__: gli underlay aprono le interfacce host direttamente ai container in esecuzione sull'host ed eliminano la necessità di mappatura delle porte, rendendoli più efficienti dei bridge.
    * __Overlay__: gli overlay utilizzano i tunnel di rete per la comunicazione tra gli host, consentendo ai container di agire come se si trovassero sulla stessa macchina quando sono ospitati su host diversi.
* Dal libro:
    * __single-host bridge__ (default): comune a tutti i container sullo stesso docker host.
    * __multi-host overlay__: comune a tutti i container su host differenti.
      Sulla bridge di default i container __non si possono parlare per nome__ perché non viene usato il Docker DNS Service. Se invece creo una bridge custom invece sì perché verrà usato il Docker DNS Service.
      Provare da dentro un container a fare `ipconfig` e poi dal docker host a fare `docker network inspect localhost`.

# Comandi
* `docker networks ls`
    * Per vedere tutte le reti.
* `docker network create -d brige [nome-rete]`
    * Per creare una nuova rete bridge
* `docker network create -d overlay [nome-rete]`
    * Per creare una nuova rete overlay
* Per ispezionare i dettagli di rete (per esempio la bridge):
    * `docker inspect bridge`
    * `ip link show docker0`
    * `brctl show` (apt-get install bridge-utils)