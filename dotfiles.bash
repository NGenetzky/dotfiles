#!/bin/bash -x

# global

BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

# functions

link_dotfile(){
    local dest="${1?}"
    local src="${2?}"
    if [ -f ${src} ]; then
        ln -sfT \
            ${src} \
            ${dest}
    fi
}

do_install() {
    link_dotfile "${HOME}/.bashrc" "${BASEDIR}/config/bash/bashrc"
    link_dotfile "${HOME}/.tmux.conf" "${BASEDIR}/config/tmux/tmux.conf"
}

# main

main() {
    local action="${1-default}"

    case $action in
        install)
            do_install
            ;;
        default)
            do_install
    esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    main "$@"
fi
