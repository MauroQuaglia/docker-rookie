# docker image build -t run:network .
FROM ubuntu:latest

RUN apt update

# RUN --network=default apt install -y curl
RUN --network=none apt install -y curl