FROM ruby:latest

WORKDIR /app

RUN <<EOF
  apt update
  apt install --no-install-recommends -y curl libjemalloc2 build-essential git pkg-config
  rm -rf /var/lib/apt/lists /var/cache/apt/archives
EOF

ENV BUNDLE_PATH="/usr/local/bundle"

COPY . .

RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git



#RUN groupadd --system --gid 1000 rails && \
#    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
#    chown -R rails:rails log tmp
USER 1000:1000

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]