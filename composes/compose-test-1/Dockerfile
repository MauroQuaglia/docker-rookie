FROM ruby:3.4.7

WORKDIR /code

COPY Gemfile Gemfile.lock app.rb ./

RUN bundle install

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]