# Cgroup
* Capire che tipo di cgroup sto usando: `docker info | grep Cgroup`
* I più moderni sono i `cgroup v2` con il driver `systemd`
* Li troviamo per esempio qui: `/sys/fs/cgroup/system.slice/docker-ID.scope`
* Per esempio se faccio: `docker container run -d ubuntu:latest bash -c "sleep infinity"`
    * Se vado vedere nel cgroup `cpuset.cpus` non vedrò nulla.
* Per esempio se faccio: `docker container run -d ubuntu:latest --cpuset-cpus=0 bash -c "sleep infinity"`
    * Se vado vedere nel cgroup `cpuset.cpus` vedrò 0.
