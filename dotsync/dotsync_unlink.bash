#!/bin/bash

removelink() {
	[ -L "$1" ] && cp --remove-destination "$(readlink "$1")" "$1"
}

set -eux
cd "${HOME}"

#removelink '.bash_logout'
#removelink '.bashrc'
#removelink '.bash_profile'
#removelink '.profile'
#removelink '.dircolors'
#removelink '.gitconfig'
#removelink '.config/Code/User/keybindings.json'
#removelink '.config/Code/User/settings.json'
#removelink '.tmux.conf'
#removelink '.tmux/plugins.tmux.conf'
removelink '.dotsyncrc'


# TODO: Handle directory
#removelink '.config/Code/User/snippets/'
