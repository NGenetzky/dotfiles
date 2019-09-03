#!/bin/sh
# https://askubuntu.com/questions/575631/how-do-i-find-all-key-bindings-in-ubuntu-14-04
# https://askubuntu.com/a/576511/984871
gsettings list-recursively  org.gnome.desktop.wm.keybindings \
    | sort \
    > 'org.gnome.desktop.wm.keybindings.log'
