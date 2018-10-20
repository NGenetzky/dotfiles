#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

# source "${SCRIPTDIR}/_ansible.bash"

default_hosts(){
  local dest="${1?}"
  install -d "$(dirname ${dest})"
cat << EOF > "${dest}"
[local]
localhost ansible_connection=local
EOF
}

setup(){
  local localenv="${SCRIPTDIR}/.local"
  local inventory="${localenv}/etc/ansible/hosts"

  set +u
  source "${localenv}/bin/activate"
  set -u

  if [ ! -f "${inventory}" ]; then
    default_hosts "${inventory}"
  fi

  ansible-playbook \
    -i "${inventory}" \
    setup.yaml
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    setup "$@"
fi

