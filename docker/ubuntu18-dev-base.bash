#!/bin/bash -x

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
BASEDIR="${SCRIPTDIR}/../../"

NAME='ubuntu18-dev-base'
UID='1000'

build() {
  local name="${NAME?}"
  local rev="$(git rev-parse HEAD)"

  [[ -d "${name}" ]] || return 1

  docker build \
    -t "${name}" \
    --build-arg "REV=${rev}" \
    --build-arg "UID=${UID}" \
    "${name}"
}

console() {
  local name="${NAME?}"

  [[ -d "${name}" ]] || return 1

  docker run -it --rm \
    --user "${UID}" \
    "${name}"
}

main() {
  local action="${1-default}"

  case $action in
    build)
      build
      ;;
    console)
      console
      ;;
    default)
      build
      console
  esac

}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  # Strict Mode
  set -euo pipefail
  IFS=$'\n\t'

  main "$@"
fi
