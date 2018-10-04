#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"

source "${SCRIPTDIR}/_dotdrop.bash"

bootstrap_python3_venv(){
  # Python3-venv not installed ubuntu 14.04
  # https://askubuntu.com/questions/760177/python3-venv-not-installed-ubuntu-14-04
  sudo apt-get install python3.4-venv
}

bootstrap(){
  local localenv="${SCRIPTDIR}/.local"
  python3 -m venv "${localenv}"

  set +u
  source "${localenv}/bin/activate"
  set -u

  fetch_dotdrop "${localenv}/share/dotdrop"
  bootstrap_dotdrop "${localenv}/share/dotdrop"
  install_dotdrop "${localenv}/share/dotdrop"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # Bash Strict Mode
    set -eu -o pipefail

    # set -x
    bootstrap "$@"
fi

