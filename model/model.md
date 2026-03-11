# Model
* Bisogna installare il plugin `docker-model-plugin` e poi si ha a disposizione la CLI `docker model`.
* Esempi:
  * `docker model pull ai/smollm2:360M-Q4_K_M`
  * `docker model run ai/smollm2:360M-Q4_K_M`
* Per vedere i modelli:
  * `docker model ls`
* Docs image:
  * https://hub.docker.com/u/ai

# Note
* `llama.cpp` è l'inference engine.
* Il container del DMR è l’ambiente di esecuzione isolato per i modelli:
  * Host = tuo computer reale
  * Container = ambiente dove gira il LLM
  * Modello = il LLM effettivo (può essere locale o scaricato)

----
# Esempio
* docker model pull ai/gemma3:4B-Q4_K_M
* docker model run ai/gemma3:4B-Q4_K_M

AT 1 (host)
* http://localhost:12434

AT 2 (container)
* docker container run -it --rm --add-host=model-runner.docker.internal:host-gateway ubuntu:latest bash
* curl -I http://model-runner.docker.internal:12434/ ---> 200
----

# Formati API
| API       | origine                    |
| --------- | -------------------------- |
| OpenAI    | ecosistema GPT             |
| Anthropic | ecosistema Claude          |
| Ollama    | runtime locale open source |
