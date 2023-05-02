# Comandi Utili
* __Il demone di Docker__
    * E' un __processo unico__ che permette di gestire volumi, immagine ad altro e sta al di sopra di __containerd__
    * `> dockerd`
* __Il gestore dei container containerd__
    * E' un __processo unico__ che permette di gestire i container e sta al di sopra di __runc__
    * `> docker-containerd`
* __Il runtime del singolo container runc__
    * Un processo per ogni container attivo.
    * `> docker-runc` 

* `docker version` tutte le informazioni riguardanti il demone, containerd, runc, ...
* `docker info` Informazioni rigurado lo stato attuale delle cose sulla macchina