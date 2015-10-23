FROM ubuntu-debootstrap:latest

MAINTAINER Anton Vasiljev <antono.vasiljev@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.2.0
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN apt-get update && apt-get install -y -q --no-install-recommends \
  build-essential \
  ca-certificates \
  curl \
  git \
  htop \
  strace \
  ltrace \
  libssl-dev \
  python \
  software-properties-common \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /usr/share/doc \
  && rm -rf /usr/share/locale \
  && apt-get clean \
  && curl https://raw.githubusercontent.com/creationix/nvm/v0.28.0/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install -g bower gulp
