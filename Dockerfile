FROM debian:8.11

LABEL name="git-crypt-unlock"
LABEL version="1.0.0"
LABEL maintainer="Arnaud Rinquin <arnaud@slite.com>"
LABEL com.github.actions.name="GitHub Action to unlock git-crypt secrets"
LABEL com.github.actions.description="Unlock secrets using git-crypt from encoded secret-key"
LABEL com.github.actions.icon="unlock"
LABEL com.github.actions.color="green"

ENV GIT_CRYPT_VERSION 0.6.0

# Dependencies from https://github.com/AGWA/git-crypt/blob/master/INSTALL.md#dependencies
RUN apt-get update && apt-get install -y \
  bash \
  curl \
  git \
  g++ \
  make \
  openssl \
  libssl-dev

RUN curl -L https://github.com/AGWA/git-crypt/archive/debian/$GIT_CRYPT_VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-debian && make && make install PREFIX=/usr/local && rm -rf /var/tmp/git-crypt-debian

RUN git-crypt --version

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


