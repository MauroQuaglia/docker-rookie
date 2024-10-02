FROM ruby:latest

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

RUN <<EOF
mkdir -p /usr/local/bundle
chown -R root:root /usr/local/bundle
chmod -R 777 /usr/local/bundle
EOF

WORKDIR /app