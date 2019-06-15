#!/bin/bash

GITROOT="$(git rev-parse --show-toplevel)"
# SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
SCRIPTDIR="${GITROOT}/dotsync/"
BINDIR="${HOME}/.local/bin/"
DOTSYNC="${HOME}/.local/bin/dotsync"

dotsync_fetch(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone --depth=1 \
        'https://github.com/dotphiles/dotsync.git' \
        "${dest}"
  fi
}

do_bootstrap() {
  local datadir="${HOME}/.local/share/"
  local srcdir="${datadir}/dotsync"

  install -d "${BINDIR}"
  dotsync_fetch "${srcdir}"

  ln -fTs \
      "${srcdir}/bin/dotsync" \
      "${BINDIR}/dotsync"
}

do_setup() {
  local rcfile="${HOME}/.dotsyncrc"

  ln -fTs \
    "${GITROOT}/config/dotsync/dotsyncrc" \
    "${rcfile}"

  "${DOTSYNC}" -l
}

do_install() {
  local relpath="${GITROOT/${HOME}/}"

  "${DOTSYNC}" -L \
    -d "${relpath}"
}

do_clean() {
  local datadir="${HOME}/.local/share/"
  local bindir="${HOME}/.local/bin/"

  rm -r --interactive=never "${datadir}/dotsync" || true
  rm "${bindir}/dotsync" || true
  rm "${HOME}.dotsyncrc" || true
}

# main

main() {
    local action="${1-default}"

    case $action in
        bootstrap)
            do_bootstrap
            ;;
        setup)
            do_setup
            ;;
        install)
            do_install
            ;;
        clean)
            do_clean
            ;;
        default)
            do_bootstrap
            do_setup
            do_install
    esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    main "$@"
fi
