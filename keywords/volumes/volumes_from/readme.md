* Creo e monto il volume sul primo container: `docker compose -f compose-step-1.yml up -d`.
* E poi uso lo stesso volume anche per il secondo container: `docker compose -f compose-step-1.yml up -d`.
* Infatti se poi faccio `docker container inspect step_2` e guardo i volumi montati lo vedo.
* Anche se entro nel container lo vedo montato nello stesso path del container step_1.
