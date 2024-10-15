# Shell Less container
* Possiamo entrare in bash anche in un container che la bash non ce l'ha.
* Per esempio se lancio portainer in locale e poi faccio:
```
> docker container exec -it portainer bash
OCI runtime exec failed: exec failed: unable to start container process: exec: "bash": executable file not found in $PATH: unknown
```
* Allora posso creare un altro container con tanti privilegi (`--privileged`, `--cap-add=SYS_ADMIN`, ...) che ha la bash e si aggancia al primo:
* Esempi:
```
docker container run --rm -it --pid=container:portainer --net=container:portainer --cap-add=SYS_ADMIN ubuntu bash
```
```
docker container run --rm -it --pid=container:portainer --net=container:portainer --privileged ubuntu bash
```
* Da dentro questo container, se faccio `ps -aux` vedo il processo di `portainer`.
* Anche se faccio `curl localhost:9000` mi risponde `portainer`, quindi sono dentro il container di `portainer`, anche se da `ls -a` non si direbbe.