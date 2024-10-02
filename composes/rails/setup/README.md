# Rails setup per development
* Copiare la directory `setup` nella `root` del progetto che si vuole creare.
* Se si vogliamo versioni particolari di __Ruby__, __Bundler__ o __Rails__ basta specificarle nel `Dockerfile` altrimenti prende tutte le versioni __latest__:
```
FROM ruby:3.3.3
gem install bundler -v=2.5.20 --no-document
gem install rails -v=7.2.1
```
* Se si vuole creare una configurazione di __Rails__ particolare basta cambiare il `command` di `setup/compose.yml`, altrimenti di default fa tutto: `rails new .`
* Lanciare lo script `setup/run.sh`.
* A setup avvenuto posso cancellare la directory `setup`.
* Eventualmente controllare la directory `.git`.