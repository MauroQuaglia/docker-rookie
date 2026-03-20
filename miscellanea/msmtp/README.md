# msmtp

* `msmtp --version`
  * System configuration file name: /etc/msmtprc
  * User configuration file name: /home/dockeruser/.msmtprc

* Quando viene mandata una mail con `msmtp`:
  * Viene letto il file `msmtprc` per capire a chi inviarla.

* DOCS:
  * `apt show msmt`p -> https://marlam.de/msmtp/

# Test
* Facevo `echo "hello there username." | msmtp -a default username@domain.com`
* Ma continuava a dare errore!
* Poi con `docker compose logs -f` ho beccato l'errore che era perché mancava il Subject.
* Così funziona: `echo -e "Subject: test mail\n\nhello there username" | msmtp -a mailpit test@domain.com`