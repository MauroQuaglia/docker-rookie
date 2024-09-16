# Le build multistage servono quando ho un eseguibile che "contiene tutto".
# In un container installo gli strumenti per creare l'eseguibile.
# Nel secondo container copio solo l'eseguibile dal primo ma non tutti gli strumenti usati per crearlo e l'immagine creata risulta più piccola.

# 869 MB
#FROM golang:1.23 AS build
#WORKDIR /src
#COPY golang_main.go ./main.go
#RUN go build -o /bin/hello ./main.go
#CMD ["/bin/hello"]

# 2.13 MB
FROM golang:1.23 AS build
WORKDIR /src
COPY golang_main.go ./main.go
RUN go build -o /bin/hello ./main.go

FROM scratch
COPY --from=build /bin/hello /bin/hello
CMD ["/bin/hello"]