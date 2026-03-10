# Model
* Bisogna installare il plugin `docker-model-plugin` e poi si ha a disposizione la CLI `docker model`.
* Esempi:
  * `docker model pull ai/smollm2:360M-Q4_K_M`
  * `docker model run ai/smollm2:360M-Q4_K_M`
* Per vedere i modelli:
  * `docker model ls`

# Note
* `llama.cpp` è l'inference engine.
* Il container del DMR è l’ambiente di esecuzione isolato per i modelli:
  * Host = tuo computer reale
  * Container = ambiente dove gira il LLM
  * Modello = il LLM effettivo (può essere locale o scaricato)