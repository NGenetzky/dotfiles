#!/bin/bash
SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
ROLEDIR="${SCRIPTDIR}/../"

play_test(){
  ansible-playbook \
   -i "${ROLEDIR}/tests/inventory" \
    "${ROLEDIR}/tests/test.yml"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Bash Strict Mode
  set -eu -o pipefail

  # set -x
  play_test "$@"
fi
