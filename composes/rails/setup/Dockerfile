#ARG RUBY_VERSION="3.3.3"
#ARG BUNDLER_VERSION="2.5.20"
#ARG RAILS_VERSION="7.2.1"

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