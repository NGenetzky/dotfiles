#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

source "${SCRIPTDIR}/_bashit.bash"

bootstrap(){
  local localfiles="${SCRIPTDIR}/files"

  fetch_bashit "${localfiles}/bash_it"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    bootstrap "$@"
fi

