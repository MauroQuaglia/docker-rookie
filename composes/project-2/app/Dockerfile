FROM ruby:3.2.2

RUN <<EOF
  apt-get update -qq
  apt-get install -y build-essential apt-utils libpq-dev nodejs
EOF

WORKDIR /app

RUN gem install bundler -v=2.5.20 --no-document

COPY Gemfile ./

RUN bundle install

ADD . /docker/app

ARG DEFAULT_PORT 3000

EXPOSE ${DEFAULT_PORT}

CMD [ "bundle","exec", "puma", "config.ru"] # CMD ["rails","server"] # you can also write like this.


docker container run -it --rm -v "/home/xpuser/mauro-quaglia/docker-rookie/composes/project-2/app:." ruby:3.2.2 bash