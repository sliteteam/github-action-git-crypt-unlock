FROM debian:8.11

ENV VERSION 0.6.0

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

LABEL \
  org.label-schema.name="github-action-git-crypt-unlock" \
  org.label-schema.description="Github Action to unlock git-crypt secrets." \
  org.label-schema.usage="https://github.com/slite/slite/tools/github-actions/git-crypt-unlock/README.md" \
  org.label-schema.vcs-url="https://github.com/slite/slite/tools/github-actions/git-crypt-unlock" \
  org.label-schema.docker.schema-version="1.0" \
  com.github.actions.name="git-crypt unlock" \
  com.github.actions.description="Unlock secrets using git-crypt" \
  com.github.actions.icon="unlock" \
  com.github.actions.color="green"
