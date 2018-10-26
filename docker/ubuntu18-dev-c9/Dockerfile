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

# Set up SSH. We set up SSH forwarding so that transactions like git pushes
# from the container happen magically.
RUN apt-get update && apt-get install -y \
    nodejs \
    openssh-server \
    sshfs \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir /var/run/sshd \
    && echo "AllowAgentForwarding yes" >> /etc/ssh/sshd_config

ARG UID_DEV=1000
ARG REV=master

RUN useradd --shell /bin/bash --create-home \
    --uid "${UID_DEV}" dev
USER dev

RUN mkdir -p "${HOME}/.local/share/" \
    && git clone "https://github.com/c9/core.git" "${HOME}/.local/share/c9" \
    && cd "${HOME}/.local/share/" \
    && "${HOME}/.local/share/c9/scripts/install-sdk.sh" \
    && sed -i -e 's@127.0.0.1@0.0.0.0@g' "${HOME}/.local/share/c9/configs/standalone.js"

RUN git clone "https://github.com/NGenetzky/dotfiles" "${HOME}/.dotfiles" \
    && cd "${HOME}/.dotfiles" \
    && git checkout "${REV}" \
    && "${HOME}/.dotfiles/dotfiles.bash" 'install'

WORKDIR "/home/dev/"
EXPOSE 8181
EXPOSE 3000

# → ./server.js  --help
# Starting standalone
# Usage: /usr/bin/node ./server.js standalone
#
# Options:
#   --settings          Settings file to use                                                                     [default: "devel"]
#   --dump              dump config file as JSON
#   --domains           Primary and any secondary top-level domains to use (e.g, c9.io,c9.dev)                   [default: null]
#   --exclude           Exclude specified service
#   --include           Include only specified service
#   --helpWithSudo      Ask for sudo password on startup
#   --help              Show command line options.
#   -t                  Start in test mode
#   -k                  Kill tmux server in test mode
#   -b                  Start the bridge server - to receive commands from the cli                               [default: false]
#   -w                  Workspace directory                                                                      [default: "/home/dev/.local/share/c9"]
#   --port              Port                                                                                     [default: 8181]
#   --debug             Turn debugging on                                                                        [default: false]
#   --listen            IP address of the server                                                                 [default: "127.0.0.1"]
#   --workspacetype     The workspace type to use
#   --readonly          Run in read only mode
#   --packed            Whether to use the packed version.                                                       [default: false]
#   --hosted            Use default config of the hosted version                                                 [default: false]
#   --auth              Basic Auth username:password
#   --collab            Whether to enable collab.                                                                [default: false]
#   --cache             use cached version of cdn files                                                          [default: true]
#   --setting-path      The path to store the settings.
#   --inProcessLocalFs  Whether to run localfs in same process for debugging.
#   --useBrowserCache   Use window.caches api if available for faster loading, requires https://
#   --secure            path to file containing ssl certificate (can be generated using scripts/create-cert.sh)
ENTRYPOINT [ \
  "/home/dev/.local/share/c9/server.js", \
  "-w", "/home/dev/", \
  "--port", "8181", \
  "--setting-path", "/home/dev/.config/c9/" \
  ]
