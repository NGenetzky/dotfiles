#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

source "${SCRIPTDIR}/_ansible.bash"

bootstrap(){
  local localenv="${SCRIPTDIR}/.local"
  python3 -m venv "${localenv}"

  set +u
  source "${localenv}/bin/activate"
  set -u

  fetch_ansible "${localenv}/share/ansible"
  bootstrap_ansible "${localenv}/share/ansible"
  install_ansible "${localenv}/share/ansible"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    bootstrap "$@"
fi

