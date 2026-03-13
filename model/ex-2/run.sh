#! /bin/bash

echo 'Scarica e fai partire il modello'
docker model pull ai/gemma3:4B-Q4_K_M
docker model run ai/gemma3:4B-Q4_K_M -d

docker compose up -d