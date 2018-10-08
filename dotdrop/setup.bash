#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

# source "${SCRIPTDIR}/_dotdrop.bash"

setup(){
  local localenv="${SCRIPTDIR}/.local"

  set +u
  source "${localenv}/bin/activate"
  set -u

  if [ ! -f "config.yaml" ]; then
    install -m 664 --no-target-directory \
      "${localenv}/share/dotdrop/config.yaml" \
      "config.yaml"
  fi

  dotdrop list
  dotdrop listfiles
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    setup "$@"
fi

