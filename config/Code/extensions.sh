#!/bin/sh

code --install-extension Braver.vscode-solarized
code --install-extension EugenWiens.bitbake
code --install-extension GitHub.vscode-pull-request-github
code --install-extension KnisterPeter.vscode-github
code --install-extension PeterJausovec.vscode-docker
code --install-extension ZixuanWang.linkerscript
code --install-extension chrislajoie.vscode-modelines
code --install-extension fatihacet.gitlab-workflow
code --install-extension keroc.hex-fmt
code --install-extension marus25.cortex-debug
code --install-extension matthias-schwarze.vimter
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ryuta46.multi-command
code --install-extension vscodevim.vim
code --install-extension ziyasal.vscode-open-in-github

# These are unofficial
# code --install-extension particle.particle-vscode-core
# code --install-extension particle.particle-vscode-snippets
# code --install-extension particle.particle-vscode-theme

# This will generate the list of extensions in installable syntax.
code --list-extensions | xargs -L 1 echo code --install-extension
