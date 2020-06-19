FROM debian:buster

LABEL name="git-crypt-unlock"
LABEL version="1.1.0"
LABEL maintainer="Anas Abou Allaban <aabouallaban@pm.me>"
LABEL com.github.actions.name="GitHub Action to unlock git-crypt secrets"
LABEL com.github.actions.description="Unlock secrets using git-crypt from encoded secret-key"
LABEL com.github.actions.icon="unlock"
LABEL com.github.actions.color="green"

ENV GIT_CRYPT_VERSION 0.6.0

# Dependencies from https://github.com/AGWA/git-crypt/blob/master/INSTALL.md#dependencies
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-utils \
  bash \
  curl \
  git \
  git-lfs \
  g++ \
  make \
  openssl \
  libssl-dev

RUN curl -k -L https://codeload.github.com/AGWA/git-crypt/tar.gz/$GIT_CRYPT_VERSION | tar zxv -C /tmp/
RUN cd /tmp/git-crypt-$GIT_CRYPT_VERSION && make && make install PREFIX=/usr/local && rm -rf /tmp/git-crypt-$GIT_CRYPT_VERSION

RUN git-crypt --version

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

