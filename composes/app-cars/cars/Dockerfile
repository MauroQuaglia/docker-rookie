FROM ruby:latest

WORKDIR /app

COPY . .

#ENV BUNDLE_PATH="/usr/local/bundle"
RUN bundle install --jobs="$(nproc)"

USER 1000:1000

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]