#!/bin/sh

code --install-extension Braver.vscode-solarized
code --install-extension chrislajoie.vscode-modelines
code --install-extension EugenWiens.bitbake
code --install-extension keroc.hex-fmt
code --install-extension marus25.cortex-debug
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension PeterJausovec.vscode-docker
code --install-extension vscodevim.vim
code --install-extension ZixuanWang.linkerscript

# These are unofficial
# code --install-extension particle.particle-vscode-core
# code --install-extension particle.particle-vscode-snippets
# code --install-extension particle.particle-vscode-theme

# This will generate the list of extensions in installable syntax.
code --list-extensions | xargs -L 1 echo code --install-extension
