#!/bin/bash -x

# global

GITROOT="$(git rev-parse --show-toplevel)"
BASEDIR="${GITROOT}/git/dotphiles"
# BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

# functions

add_this_host(){
    local conf="${1?}"
    sed -i "/endhosts/i$(hostname) git=ANY" \
        "${conf}"
}

get_hosts(){
    local conf="${1?}"
    sed -n '/\[hosts\]/,/\[endhosts\]/p' $CONFIG \
        | grep -v '^\[.*hosts' \
        | grep -v '^#' \
        | awk '{print $1}' \
        | egrep "$chk"
}

do_fetch() {
    [[ -d ~/.dotphiles ]] && return 0
    git clone \
        --depth=1 \
        --recursive \
        https://github.com/dotphiles/dotphiles.git \
        ~/.dotphiles
}

do_configure() {
    [[ -d ~/.dotphiles ]] || return 1
    # add_this_host "${GITROOT}/config/dotsync/dotsyncrc"
    ln -fTs \
        "${GITROOT}/config/dotsync/dotsyncrc" \
        "${HOME}/.dotsyncrc"
}

do_install() {
    [[ -d ~/.dotphiles ]] || return 1
    ~/.dotphiles/dotsync/bin/dotsync -L
}

do_clean() {
    [[ -d ~/.dotphiles ]] || return 0
    rm -r ~/.dotphiles/
}

# main

main() {
    local action="${1-default}"

    case $action in
        fetch)
            do_fetch
            ;;
        configure)
            do_configure
            ;;
        install)
            do_install
            ;;
        default)
            do_fetch
            do_configure
            do_install
    esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Strict Mode
    set -euo pipefail
    IFS=$'\n\t'

    main "$@"
fi
