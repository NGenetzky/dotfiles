FROM alpine:3.7
RUN apk add --no-cache \
      bash \
      git

ARG UID=1000
ARG GID=1000
ARG REV=master

RUN adduser -D -s /bin/bash -u "${UID}" -g "${GID}" dev
USER dev

RUN git clone "https://github.com/NGenetzky/dotfiles" "${HOME}/.dotfiles" \
      && git -C "${HOME}/.dotfiles" checkout "${REV}" \
      && ~/.dotfiles/bash/bash-it/bash-it.bash \
      && cp ~/.dotfiles/config/bash/bashrc ~/.bashrc \
      && cp ~/.dotfiles/config/bash/profile ~/.bash_profile \
      && cp ~/.dotfiles/config/bash/bash_logout ~/.bash_logout

ENTRYPOINT ["/bin/bash"]
