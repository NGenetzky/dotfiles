FROM ubuntu:18.04
LABEL \
    maintainer="Nathan@Genetzky.us"

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

ARG UID_DEV=1000
ARG REV=master

RUN useradd --shell /bin/bash --create-home \
    --uid "${UID_DEV}" dev
USER dev

RUN git clone "https://github.com/NGenetzky/dotfiles" "${HOME}/.dotfiles" \
    && cd "${HOME}/.dotfiles" \
    && git checkout "${REV}" \
    && "${HOME}/.dotfiles/dotfiles.bash" 'install'

ENTRYPOINT ["/bin/bash"]
