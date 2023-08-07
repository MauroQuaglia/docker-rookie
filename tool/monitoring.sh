#!/usr/bin/env bash

# Il plug-in di default per development è: json-file.
# Tutto ciò che in un container viene scritto sullo STDOUT e STDERR viene catturato dal demone e convogliato al plug-in.

echo "ESEMPIO I LOG DI SOLR"
docker container logs solr

echo "ESEMPIO LE STATISTICHE SOLR"
docker container stats solr | head -n 2

#docker events