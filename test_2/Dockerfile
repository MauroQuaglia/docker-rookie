ARG ubuntu="ubuntu@sha256:b060fffe8e1561c9c3e6dea6db487b900100fc26830b9ea2ec966c151ab4c020"
FROM $ubuntu

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