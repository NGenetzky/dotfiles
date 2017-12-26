#!/bin/bash -x

# global

GITROOT="$(git rev-parse --show-toplevel)"
BASEDIR="${GITROOT}/bash/bash-it/"
# BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

# functions

do_fetch() {
    [[ -d ~/.bash_it ]] && return 0
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
}

do_install() {
    [[ -d ~/.bash_it ]] || return 1
    ~/.bash_it/install.sh --silent --no-modify-config

    for file_type in "aliases" "plugins" "completion"
    do
        ln -fTs \
            "${BASEDIR}/custom/${file_type}" \
            "${HOME}/.bash_it/custom/${file_type}"
    done
}

do_clean() {
    [[ -d ~/.bash_it ]] || return 0
    ~/.bash_it/uninstall.sh
    rm -r ~/.bash_it/
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
