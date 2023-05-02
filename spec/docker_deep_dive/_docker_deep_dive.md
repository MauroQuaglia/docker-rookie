# Docker
* Default:
    * 1 server -> 1 App (App, SO)
    * Spreco di soldi e risorse
* VMware:
    * 1 server -> + App (App1, SO1) (App2, SO2) (App3, SO1) ...
    * Ogni App ha il suo SO
    * Comunque spreco di risorse, lentezza, manutenzione e licenze di ogni SO
* Container:
    * 1 server -> + App (App1, SO) (App2, SO) ...
    * Tutte le App condividono lo stesso SO
    * Ottimizzazione delle risorse, facile per manutenzione e licenze. Veloce e portabile.
    * Difficile da usare
* Docker:
    * Software che crea, gestisce e orchestra i containere.
    * Curiosità sul nome: DOCKER = DOCK workER = scaricatore di porto
* Kubernetes:
    * Coordina i deploy e gestisce le App containerizzate.
    * Può usare como motore sottostante `docker` o `containerd` che sarebbe la parte fondamentale di docker che permette la creazione, l'avvio e lo spegnimento dei container.