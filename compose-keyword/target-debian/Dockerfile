FROM debian:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install libcap -y

RUN mkdir -p /app
COPY text-a.txt /app

# Se faccio "getcap /app/text-a.txt" nel container ottengo /app/text-a.txt cap_setgid=ep
RUN setcap cap_setgid=ep /app/text-a.txt