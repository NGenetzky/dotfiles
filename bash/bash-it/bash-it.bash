#!/bin/bash -x

# global

GITROOT="$(git rev-parse --show-toplevel)"
BASEDIR="${GITROOT}/bash/bash-it/"
# BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

SRCDIR="${HOME}/.bash_it/"

# functions

do_fetch() {
    [[ -d "${SRCDIR}" ]] && return 0
    git clone --depth=1 https://github.com/Bash-it/bash-it.git "${SRCDIR}"
}

do_install() {
    [[ -d "${SRCDIR}" ]] || return 1
    "${SRCDIR}/install.sh" --silent --no-modify-config

    ln -fTs \
        "${BASEDIR}/custom" \
        "${SRCDIR}/custom/custom"

    bash -l "${GITROOT}/config/bashit/bashit-config.sh"
}

do_clean() {
    [[ -d "${SRCDIR?}" ]] || return 0
    "${SRCDIR?}/uninstall.sh"
    rm -r "${SRCDIR?}"
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
