#! /bin/bash

# Se l'intero sistema non è sotto stress è difficile vedere i limiti imposti da questa configurazione.

# Limita la % di utilizzo della CPU. Quanta CPU sul totale disponibile un container può usare.
# Non sto vincolando il container a una sola CPU, lo sto solo vincolando sul totale disponibile.
# Decide il sistema come distrinuire il carico tra le varie CPU.
# 1 = 100% di un core
# Esempio supponiamo di avere 4 core:
  # 0,5 => 50% di un core
   # Possibili configurazioni:
   # 50% 0% 0% 0%
   # 10% 10% 20% 10%
   # ...

docker container run --rm --cpus="0.5" spkane/train-os stress --verbose --cpu 2 --io 1 --vm 2 --vm-bytes 128 --timeout 120s
