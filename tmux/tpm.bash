#!/bin/bash -x

# global

GITROOT="$(git rev-parse --show-toplevel)"
BASEDIR="${GITROOT}/tmux/"
# BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

SRCDIR="${HOME}/.tmux/plugins/tpm"

# functions

do_fetch() {
    [[ ! -d "${SRCDIR}" ]] || return 0
    git clone --depth=1 https://github.com/tmux-plugins/tpm.git "${SRCDIR}"
}

do_install() {
    [[ -d "${SRCDIR}" ]] || return 1
     "${SRCDIR}/bin/install_plugins" || true
    install -d "${HOME}/.tmux/themes/"
    ln -fTs \
        "${GITROOT}/config/tmux/themes/lateo.conf" \
        "${HOME}/.tmux/themes/lateo.conf"
}

do_clean() {
    [[ -d "${SRCDIR}" ]] || return 0
    rm -r \
        ~/.tmux/plugins/ \
        ~/.tmux/sidebar/ \
        ~/.tmux/themes/
}

# main

main() {
    local action="${1-default}"

    case $action in
        fetch)
            do_fetch
            ;;
        install)
            do_install
            ;;
        clean)
            do_clean
            ;;
        default)
            do_fetch
            do_install
    esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    main "$@"
fi
