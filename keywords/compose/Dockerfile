FROM nginx:latest

RUN mkdir -p health
COPY healthcheck.sh /health
RUN chmod 777 /health/healthcheck.sh
