#!/bin/bash -x

# global

BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"
PLUGINS=${BASEDIR}/plugins/*

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
    # ./config/bash
    link_dotfile "${HOME}/.bashrc" "${BASEDIR}/config/bash/bashrc"
    link_dotfile "${HOME}/.profile" "${BASEDIR}/config/bash/profile"
    link_dotfile "${HOME}/.bash_logout" "${BASEDIR}/config/bash/bash_logout"

    # ./config/tmux
    link_dotfile "${HOME}/.tmux.conf" "${BASEDIR}/config/tmux/tmux.conf"
}

do_for_each_plugin(){
    local action="${1-default}"

    for f in $PLUGINS
    do
      echo "Processing $f file..."
      $f
      echo "$?=exit($f)"
    done
}

# main

main() {
    local action="${1-default}"

    case $action in
        install)
            do_install
            do_for_each_plugin ${action}
            ;;
        clean)
            do_for_each_plugin ${action}
            ;;
        0000)
            do_install
            ${BASEDIR}/bash/bash-it/bash-it.bash
            ${BASEDIR}/tmux/tpm.bash
            ;;
        default)
            do_for_each_plugin
    esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    main "$@"
fi
