FROM ubuntu:18.04
LABEL \
    maintainer="Nathan@Genetzky.us"

# References:
# https://github.com/NGenetzky/dev-shell/tree/ab85b632c8ef554dd49a85e7db067bcc2a7eca2b/dev-base

RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    cmake \
    ctags \
    curl \
    git \
    make \
    man \
    python \
    tmux \
    vim \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Locale set to en_US.UTF-8
RUN apt-get update && apt-get install -y \
    locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && locale-gen --purge en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8

ENTRYPOINT ["/bin/bash"]
