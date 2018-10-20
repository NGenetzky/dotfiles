FROM alpine:latest as builder

# References:
# https://github.com/JAremko/alpine-vim/blob/4af4a960da56344e52f38b8ea9feae0f374fd557/alpine-vim-base/Dockerfile

WORKDIR /tmp

# Install dependencies
RUN apk add --no-cache \
    build-base \
    ctags \
    git \
    libx11-dev \
    libxpm-dev \
    libxt-dev \
    make \
    ncurses-dev \
    python \
    python-dev

# Build vim from git source
RUN git clone https://github.com/vim/vim \
 && cd vim \
 && ./configure \
    --disable-gui \
    --disable-netbeans \
    --enable-multibyte \
    --enable-pythoninterp \
    --with-features=big \
    --with-python-config-dir=/usr/lib/python2.7/config \
 && make install

FROM alpine:latest

COPY --from=builder /usr/local/bin/ /usr/local/bin
COPY --from=builder /usr/local/share/vim/ /usr/local/share/vim/
# NOTE: man page is ignored

RUN apk add --no-cache \
  diffutils \
  libice \
  libsm \
  libx11 \
  libxt \
  ncurses

ENTRYPOINT ["vim"]
