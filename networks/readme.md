# Senza Docker
```
> ip a

1: lo
2: eth0
```

# Con Docker
* Tutto pulito senza container
```
> ip a

1: lo
2: enp1s0 - Connessione via cavo
3: wlp2s0 - Connessione Wi-Fi
4: docker0 - Rete virtuale creata da Docker, mappata alla bridge 16780082b1dc
5: vboxnet0 - Rete virtuale creata da VirtualBox
```

```
>docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
16780082b1dc   bridge    bridge    local
9ccaf266a33a   host      host      local
a8b034b71b50   none      null      local
```

* Creo un container:
```
> ip a

Viene aggiunta solo:
6: veth8ef351f@if1384
```

E da dentro al container ho:
```
1: lo:
2: eth0@if1393:
```

* In sostanza per ogni contianer viene aggiunta la coppia __veth - eth__.


# Pulisco tutto e creo una network
* `docker network create localnet` (driver bridge)
```
> ip a

Rispetto alla base viene creata la
6: br-186d3bde2770
```

```
> docker network ls

NETWORK ID     NAME       DRIVER    SCOPE
16780082b1dc   bridge     bridge    local
9ccaf266a33a   host       host      local
186d3bde2770   localnet   bridge    local
a8b034b71b50   none       null      local
```

* Dal punto di vista di Docker abbiamo: __localnet-186d3bde2770__
* Dal punto di vista di Linux abbiamo: __br-186d3bde2770__

`> docker container run -it --network localnet  ubuntu:latest bash`

Dentro al container non cambia c'è sempre:
```
1: lo: <LOOPBACK,UP,LOWER_UP> 
2: eth0@if1393: <BROADCAST,MULTICAST,UP,LOWER_UP>
```






