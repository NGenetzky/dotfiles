#!/bin/bash -x

# global

GITROOT="$(git rev-parse --show-toplevel)"
BASEDIR="${GITROOT}/tmux/tpm.bash/"
# BASEDIR="$(readlink -f $(dirname $BASH_SOURCE))"

# functions

do_fetch() {
    [[ -d ~/.tmux/plugins/tpm ]] && return 0
    git clone --depth=1 https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
}

do_install() {
    [[ -d ~/.tmux/plugins/tpm ]] || return 1
    ~/.tmux/plugins/tpm/bin/install_plugins
    ln -fTs \
        "${BASEDIR}/themes" \
        "${HOME}/.tmux/themes"
}

do_clean() {
    [[ -d ~/.tmux/plugins/tpm ]] || return 0
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
