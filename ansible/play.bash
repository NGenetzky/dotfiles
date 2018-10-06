#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

# source "${SCRIPTDIR}/_ansible.bash"

play(){
  local localenv="${SCRIPTDIR}/.local"
  local inventory="${SCRIPTDIR}/hosts.conf"

  set +u
  source "${localenv}/bin/activate"
  set -u

  ansible-playbook \
    -i "${inventory}" \
    $@
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    play $@
fi
