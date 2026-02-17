# In questa immagine ho tutto il golang installato ma non è necessario.
# Posso copiare l'eseguibile su una macchina che non ha Go installato ed eseguirlo con /bin/hello.
# Funziona senza runtime, interpreter, ...
FROM golang:1.25 AS build
WORKDIR /src
COPY ./main.go ./main.go
RUN go build -o /bin/hello ./main.go
# CMD ["/bin/hello"] 880 MB

# Alleggeriamo l'immagine e otteniamo lo stesso risultato!
FROM scratch
COPY --from=build /bin/hello /bin/hello
CMD ["/bin/hello"]
# 2.25MB! E fa la stessa cosa!

# docker image build -t g:3 .
# docker container run g:3
