FROM alpine:3.7
RUN apk add --no-cache \
      bash \
      git

RUN adduser -D -s /bin/bash -u 1000 -g 1000 dev
USER dev

RUN git clone https://github.com/NGenetzky/dotfiles ~/.dotfiles \
      && ~/.dotfiles/bash/bash-it/bash-it.bash \
      && cp ~/.dotfiles/config/bash/bashrc ~/.bashrc \
      && cp ~/.dotfiles/config/bash/profile ~/.bash_profile \
      && cp ~/.dotfiles/config/bash/bash_logout ~/.bash_logout

ENTRYPOINT ["/bin/bash"]
