# Immagini
* L'immagine contiene codice applicativo, dipendenze e costrutti del SO. Tutto quello che serve per avviare un'applicazione. In generale l'immagine è una somma di read-only layer indipendenti.

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
* OSS: L'immagine Alpine Linux (__alpine:latest__) è la più piccola immagine Linux ufficiale.

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