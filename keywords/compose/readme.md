# Compose

[reference](https://docs.docker.com/reference/compose-file/)
[awesome-compose](https://github.com/docker/awesome-compose)


# Appunti
* Posso anchefare tante cose senza la necessità di un Dockerfile:
```
  proxy:
    image: nginx
    volumes:
        - type: bind
        source: ./proxy/nginx.conf
        target: /etc/nginx/conf.d/default.conf
        read_only: true
```