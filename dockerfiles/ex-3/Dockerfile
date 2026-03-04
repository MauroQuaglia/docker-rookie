# docker image build -t run:bind .
# docker container run -it run:bind bash

FROM ruby:3.4.7

WORKDIR /code

COPY Gemfile Gemfile.lock ./

RUN bundle install