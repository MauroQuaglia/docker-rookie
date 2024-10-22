# depends_on
* compose, stack 
* Manda un segnale di avvia prima a un servizio piuttosto che a un altro.
Non aspetta che il container sia running prima di fare partire il secondo servizio, anzi non si cura di nulla.
Se anche fallisce il container lui avvia comunque anche l'altro servizio.
Se si vogliono controlli più soft sono da fare a mano.
Nella fase di down i segnali di stop sono mandati in ordine inverso.
* C'è una differenza importante però, nel compose.yml si possono impostare delle condizioni per cui il servizio dipendente aspetta
 veramente che il primo container sia healthy.
* Nello stack.yml non c'è nessun equivalente e questa cosa non si può fare, a meno di farla a mano con degli script custom.


# healthcheck
* Dockerfile, compose, stack
* Solo nello stack si possono intraprendere azioni concrete a rigurado.
Quando l'healthcheck fallisce, la failure_action: rollback interviene e viene rimesso un container funzionante.

