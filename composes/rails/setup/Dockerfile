FROM ruby:3.3.3

RUN <<EOF
apt update
apt upgrade -y
apt autoremove --purge -y
apt clean
EOF

RUN <<EOF
gem update --system
gem install bundler --no-document
gem install rails
EOF
