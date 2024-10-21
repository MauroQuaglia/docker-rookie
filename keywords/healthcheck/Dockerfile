# https://docs.docker.com/reference/dockerfile/#healthcheck

# docker image build --tag healthcheck:v1 .
# docker image inspect healthcheck:v1
# docker container run --publish 8080:80 healthcheck:v1
# docker container logs 893... -f

FROM nginx:latest

# Up 2 minutes (healthy)
# Riesco a connettermi con exec
# http://localhost:8080/ risponde
#HEALTHCHECK --interval=3s CMD curl --fail http://localhost:80 || exit 1

# Up 2 minutes (unhealthy)
# Riesco a connettermi con exec
# http://localhost:8080/ risponde
HEALTHCHECK --interval=3s CMD curl --fail http://localhost:90 || exit 1


