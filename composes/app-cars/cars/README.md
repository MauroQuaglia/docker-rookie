# Cars

* Dopo aver fatto 
  * `docker compose build`
  * `docker compose up`
* Mi collego al container `cars` da RubyMine:
  * `Tasto DX > Create Terminal > As Container User`
  * Creo il database e faccio la migrazione  da dentro il container:
    * `rails db:migrate`
    * `rails db:seed`
* Poi da browser per vedere il risultato:
  * http://0.0.0.0:3700/