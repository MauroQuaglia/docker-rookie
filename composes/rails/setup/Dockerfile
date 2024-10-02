FROM ruby:${RUBY_VERSION}

RUN <<EOF
apt update
apt upgrade -y
apt autoremove --purge -y
apt clean
EOF

RUN gem update --system
RUN gem install bundler -v=${BUNDLER_VERSION} --no-document
RUN gem install rails -v=${RAILS_VERSION}