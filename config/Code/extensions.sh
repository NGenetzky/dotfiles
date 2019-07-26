#!/bin/sh

code --install-extension Braver.vscode-solarized
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension EugenWiens.bitbake
code --install-extension PKief.material-icon-theme
code --install-extension PeterJausovec.vscode-docker
code --install-extension YoshinoriN.current-file-path
code --install-extension ZixuanWang.linkerscript
code --install-extension alefragnani.Bookmarks
code --install-extension alefragnani.project-manager
code --install-extension austin.code-gnu-global
code --install-extension chrislajoie.vscode-modelines
code --install-extension codezombiech.gitignore
code --install-extension eamodio.gitlens
code --install-extension emilast.LogFileHighlighter
code --install-extension fabiospampinato.vscode-terminals
code --install-extension keroc.hex-fmt
code --install-extension letmaik.git-tree-compare
code --install-extension maelvalais.autoconf
code --install-extension marus25.cortex-debug
code --install-extension matthias-schwarze.vimter
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension plorefice.devicetree
code --install-extension qezhu.gitlink
code --install-extension ryuta46.multi-command
code --install-extension vscodevim.vim
code --install-extension xaver.clang-format
code --install-extension yzhang.markdown-all-in-one
code --install-extension ziyasal.vscode-open-in-github


# Disabled, install on workspace-by-workspace basis.
# code --install-extension GitHub.vscode-pull-request-github
# code --install-extension KnisterPeter.vscode-github
# code --install-extension fatihacet.gitlab-workflow
# code --install-extension gioboa.jira-plugin
# code --install-extension jduponchelle.jira-link
# code --install-extension pstreule.codebucket

# These are unofficial
# code --install-extension particle.particle-vscode-core
# code --install-extension particle.particle-vscode-snippets
# code --install-extension particle.particle-vscode-theme

# This will generate the list of extensions in installable syntax.
code --list-extensions | xargs -L 1 echo code --install-extension
