#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
GITROOT="${SCRIPTDIR}/../"
# BASEDIR="${SCRIPTDIR}"

source "${SCRIPTDIR}/_dotsync.bash"

do_bootstrap() {
  local datadir="${HOME}/.local/share/"
  local bindir="${HOME}/.local/bin/"
  local srcdir="${datadir}/dotsync"

  dotsync_fetch "${srcdir}"

  ln -fTs \
      "${srcdir}/bin/dotsync" \
      "${HOME}/bin/dotsync"
}

do_setup() {
  local rcfile="${HOME}/.dotsyncrc"

  ln -fTs \
    "${GITROOT}/config/dotsync/dotsyncrc" \
    "${rcfile}"

  grep "^$(hostname)" ${rcfile} \
    || add_this_host "${rcfile}"

  dotsync -l
}

do_install() {
    [[ -d ~/.dotphiles ]] || return 1
    ~/.dotphiles/dotsync/bin/dotsync -L
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
