ARG latest="sha256:3246518d9735254519e1b2ff35f95686e4a5011c90c85344c1f38df7bae9dd37"
FROM $latest

COPY . ./

RUN mkdir -p /data
WORKDIR /data
COPY . /data

#RUN apt-get update \
   # && apt-get upgrade -y \
   # && apt-get install ruby -y

#RUN apt-get remove ruby --purge -y


ENTRYPOINT ["/bin/bash"]

# CMD ["echo", "Hello!"]
#RUN apt-get update \
#    && apt-get upgrade -y \
#    && apt-get install -y stress \
#    && apt-get clean

#RUN mkdir -p /app
#WORKDIR /app


#CMD ["sleep", "infinity"]