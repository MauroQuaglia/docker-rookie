# Immagini
* L'immagine contiene codice applicativo, dipendenze e costrutti del SO. Tutto quello che serve per avviare un'applicazione. In generale l'immagine è una somma di read-only layer indipendenti.
* Pensiamola come a un oggetto che contiene un filesystem di un SO, un'applicazione e tutte le sue dipendenze.
* Nel mondo Docker una immagine è un container fermo.
* Un dev la può pensare come a una classe.

## Registry
* Il principale, ma non unico, Image Registry è Docker Hub. Un Image Registry può avere più Repository da cui scaricare le immagini. Nel Docker Hub ci sono:
  * Repository Ufficiali: troviamo immagini validate e verificate.
  * Repository non Ufficiali: non è detto che le immagini siano validate, ben strutturate e sicure.

### Image Registry Remoto
* Per scaricare un'immagine in locale si usa: `docker image pull alpine:latest`. Se non specifico il tag, in automatico viene preso il tag `latest`.
* Il tag `latest` non garantisce che l'immagine sia l'ultima, è solo un tag come un altro.
* Se voglio scaricare un'immagine da un altro Registry glielo devo esplicitare: `docker image pull gcr.io/google-containers/...`
* Ad un'immagine posso associare più tag, tanto sono solo dei metadati.
* Scaricare un'immagine per tag è il metodo più comune ma può essere rischioso perché i tag sono mutabili ne tempo. Allo stesso tag, nel tempo, possono corrispondere immagini diverse.
* Il __digest__ invece è univoco nel tempo, quindi più sicuro. Esempio:
  * `docker image pull alpine:latest` (guardo che digest ha, si vede quando scarica l'immagine)
  * Ora che ho il digest posso fissare la situazione: `docker image pull alpine@sha256:82d1e9d7ed48a7523bdebc18cf6290bdb97b82302a8a9c27d4fe885949ea94d1`
* OSS: L'immagine Alpine Linux (__alpine:latest__) è la più piccola immagine Linux ufficiale. Se non devo fare quasi nulla è meglio usare questa.
  * Anche molte altre immagini si basano su questa.
  * Alpine Linux si basa su __musl__ standard library invece che sulla tradizionale __glibc__ (GNU C Library). Non è mai un grosso problema ma è bene saperlo.

### Image Registri Locale
* Sull'host le immagini sono archiviate da qualche parte sotto `/var/lib/docker`.
* Sono visibili tramite comando `docker image ls`

## Dangling Images
* Sono quelle immagini che si presentano come Repository:Tag come `<none>:<none>`. Sono immagini non più taggate. Succede per esempio quando faccio la build di un'immagine con un Repository:Tag che già esiste. Docker toglie il tag alla vecchia immagine, lasciandola come `<none>:<none>` (dangling) e assegna il tag alla nuova immagine.

## Image Information
* Per vedere tutte le caratteristiche di un'immagine: `docker image inspect x:y`.
  * Nel __command__ e nell'__entrypoint__ si può vedere quale app è designata a partire.
* Per vedere le istruzioni usate per creare l'immagine: `docker image history x:y`
  * E' anche un modo per curiosare nel Dockerfile di un'immagine scaricata.
* I setting del Dockerfile sono dei default. Si possono overraidare da linea di comando quando lancio un container.

## Rimozione immagine
* Posso cancellare un'immagine solo se non ci sono container (attivi e non attivi) collegati ad essa.
* Per cancellare tutte le immagini dangling: `docker image prune`
* Per cancellare tutte le immagini dangling e quelle che non sono più usate da nessun container: `docker image prune -a`
* Per cancellare tutto: `docker image rm $(docker image ls -q) -f`

## Manifest
* `docker manifest inspect x:y`
* Se c'è il manifest (e almeno per le immagini ufficiali dovrebbe sempre esserci) ci dice per quale architettura (CPU) e piattaforma (SO) quell'immagine è disponibile. In Ogni caso è docker che si occupa della cosa quando si prova a scaricare un'immagine.
* Si può creare la propria immagine per differenti piattaforme usando il comando `docker buildx ...` e poi usare il `docker manifest create ...` per associargli un manifest.


## Build
* Basta fare `docker image build -t x:y .` mettendomi nella directory del Dockerfile, che normalmente deve stare nell root del progetto.
* Posso aggiungere il parametro `-f` se il Dockerfile sta da un'altra parte o non ha il nome convenzionale.
* Containerizzare un'app significa creare un'immagine pronta a girare in un container.
* Si possono avere delle single-container app o delle multi-container app (stack).

## Multi-Stage Build e come fare immagini piccole
* L'idea alla base di tutto è sempre quella di tenere le immagini il più piccolo possibile, quindi utilizzanzo i soliti trucchi come per esempio un solo RUN con `&&` e "\\" e così via.
* Usiamo il `no-install-recommends` nel `sudo apt install --no-install-recommends <pacakge-name>` che installa solo i pacchetti necessari e non anche quelli raccomandati o suggeriti.
* Per il multi-stage usiamo un singolo Dockerfile con più istruzioni FROM. Ogni istruzione FROM è un nuovo build stage che può copiare cose dagli stage precedenti.
* Un esempio di cosa serve il multi stage: devo scaricare un tool per creare un'immagine e poi lascio il tool nell'immagine anche se non serve più: non è una buona pratica. L'dea è quella di copiare solo le cose essenziali prodotte da immagini precedenti.
* Usiamo il multi-stage (esempio):
```
FROM x:y AS storefront
... (scarico un tool, compilo cose e creo un file aaa.txt)
FROM t:z AS appserver
... (scarico un tool, compilo cose e creo un file bbb.txt)
FROM w:k AS production
...
COPY --from=storefront ... mi prendo solo il file aaa.txt
COPY --from=appserver ... mi prendo solo il file bbb.txt
```
* Il comando `FROM scratch` permette di partire da una  immagine vuota.  

# Layer
* Sono additivi per cui due RUN di fila creano due layer distinti:
 * `RUN apt-get update`
 * `RUN apt-get clean`
* Il secondo RUN non pulisce i dati del primo layer, anzi crea  un altro layer!
 * Quello che si vuole fare in realtà sarebbe: `RUN apt-get update && RUN apt-get clean`


## Push Image su DockerHub
* Devo avere un account Docker ID = Docker Hub username.
* Devo aggiungere un tag all'immagine per dirgli il Registry e poi pusharla.
* `docker login`
* `docker image tag x:y mq/x:y` per esempio aggiungo un tag all'immagine con il nome del mio repository `mq`.
* `docker image push mq/x:y`

## SQUASH IMAGE (--squash)
* Creo un immagine con più layer e alla fine faccio uno squash in un singolo layer.
* PRO: ho un'immagine con tanti layer che voglio usare per creare altre immagini. Posso usare lo squash e usare un solo layer.
* CONTRO: non c'è condivisione di layer, quindi una mancata ottimizzazione di layer condivisi.
* E' una funzionalità da verificare perché potrebbe essere cambiata nel tempo.

## .dockerignore
Questo file è importante per dire a Docker cosa escludere durante la build dell'immagine. 
Il `.dockerignore` serve per tenere l'immagine piccola cosi da non copiare tutti i file nell'immagine. In realtà mando al Server tutti i file tranne quelli del `.dockerignore` perché poi è il Server che fa la build dell'immagine.

## BuildKit
* BuildKit è il nuovo motore per costruire immagini. Per abilitarlo basta mettere come variabile di ambiente `DOCKER_BUILDKIT=1`.

# Comandi
* `docker images` oppure `docker image ls`:
  * Mi fa vedere tutte le immagini in locale
  * Un'immagine ha un unico IMAGE_ID ma può avere più TAG.
* `docker image ls --filter dangling=true`
  * Per vedere le immagine senza repository e tag... può succedere in caso di duplicati che Docker tolga dei tag.
* `docker image pull ubuntu:latest`:
  * Formato: `docker image pull repository:tag`
  * Scarica l'ultima versione di ubuntu.
  * Tendenzialmente meglio non usare il tag "latest". Che a volte neppure è veramente l'ultima uscita visto che ci sono anche le "edge"
  * La cosa più sicura in assoluto è usare il digest dell'immagine. L'image-id.
* `docker build .`
  * Crea l'immagine a partire dal Dockerfile
* `docker build -t test:latest .`
  * Crea un'immagine a partire dal Dockerfile, dove -t gli da un nome
* `docker image prune -a`
  * Cancella tutte le immagini dangling e tutte quelle non associate a container che stanno girando.
* `docker search nigelpoulton`
  * Si può anche cercare nel DockerHub da riga di comando.
  * Esempio, tutti i repositori con nigelpoulton nel loro nome... 25 righe
* `docker image inspect 3735d52b5c9e`, `docker image history 3735d52b5c9e`
  * Per vedere tutti i dettagli di un'immagine.
* `docker manifest inspect busybox` (per esempio busybox)
  * Fa vedere le piattaforme e SO disponibili compatibili con quell'immagine che sto scaricando.

# Per costruire immagine - cose da fare
* I comandi `apt-get update` e `apt-get upgrade` non rendono le immagini fisse.
* Per una immagine di base meglio usare uno sha256 così non ci sono dubbi.
* Esempio di comando `DOCKER_BUILKIT=1 docker image build -t x:y . --no-cache`:
  * `DOCKER_BUILKIT=1`: per utilizzare BuildKit (default è `0` quindi disabilitato)
  * `-t: repository:immagine`
  * `.`: 
    * E' il contesto di build, quello che c'è in questa directory viene mandato al server dockerd per costruire l'immagine. 
    * Il file `.dockerignore` permette di non inviare più file del necessario. 
    * Se il `Dockerfile` non si trova nella directory corrente posso usare il flag `-f`.
  * `--no-cache`
    * Esempio se ho un `RUN apt-get update|upgrade` nel `Dockerfile`, la prima volta lo fa veramente, poi se non faccio altri cambamenti al `Dockefile` vengono usati i layer in cache, perché Docker non vede altri cambiamenti del digest del `Dockerfile`.
    * In questo modo esegue veramente anche il `RUN apt-get update|upgrade`.
* E' bene tenere le immagine piccole, per cui di solito si usa farle partire da una Alpine Linux.
  * Questa contiene la `/bin/sh` invece della `/bin/bash` che è più pesante. 
* Ricordarsi che i layer sono __sempre__ additivi.
  * Sebbene si possano mascherare i file di strati precedenti, questi non si possono cancellare.
  * Non si possono creare immagini più piccole semplicemente cancellando i file aggiunti in passi precedenti.
  * L'unica cosa che posso fare è rimuovere i file prima di salvare il layer: `RUN apk install -y httpd && RUN apk clean all`.
* La Multi-Stage-Build è un altro trucco per tenere l'immagine piccola (1 `Dockerfile`, + `FROM`)
  * Mi posso spingere oltre, anche prendendo pezzi di più immagini costruite con `Dockerfile` diversi ma serve abilitare il plug-in `docker-buildx` che supporta contesti di build multipli.
  * Potrebbe essere utile il `FROM scratch`
* Per controllare i dati e il peso della mia immagine:
  * `docker image inspect x:y` (dati immagine)
  * `docker image history x:y` (anche con `--no-trunc`) (peso immagine)
* BuildKit ha anche la funzionalità di montare e poi smontare un layer di supporto per velocizzare la build. Questa funzionalità prende il nome di Directory Caching.
  * `RUN --mount=type=cache ...`
* Quando uso il comando `docker image build` posso specificare anche il `--target` se volgio provare a fare build di development, produzione, eccetere.
* Per capire quale immagine scaricare il server docker prima scarica il manifest di una immagine, lo legge, e poi in base all'architettura del sistema scarica l'immagine corretta.
* Una buona cosa è specificare sempre un utente nel Dockerfile.