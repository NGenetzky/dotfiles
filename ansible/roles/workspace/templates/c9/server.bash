#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
LOCALENV="${LOCALENV-{{ workspace_localenv }}}"
WORKSPACE="${WORKSPACE-{{ workspace_rootdir }}}"
HOME="${WORKSPACE-{{ workspace_rootdir }}}"

activate() {
  . "${LOCALENV}/bin/activate"
}

server() {
  # -w "${workspace}" ${args}
  local args=$@
  local localenv_c9="{{ workspace_localenv }}/share/c9sdk/"

  set +u
  activate
  set -u

  node "${localenv_c9}/server.js" ${args}
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    server "$@"
fi

