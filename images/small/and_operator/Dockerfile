# Di base ogni istruzione nel Dockerfile crea un nuovo layer.
# Per esempio il "dnf clean all" se messo in un RUN su una nuova riga maschera il layer precedente con una cache vuota, ma non
# la svuota veramente.


# docker image build -t fedy .
# docker image history fedy


FROM docker.io/fedora

# Così l'immagine è più pesante!
#RUN dnf install -y httpd
#RUN dnf clean all # + 156kB Perché ha aggiunto un nuovo layer per mascherare

# In questo modo invece si vede che l'immagine finale è decisamente più leggera!
RUN dnf install -y httpd && dnf clean all