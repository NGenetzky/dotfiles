#!/usr/bin/env bash

set -e

CONFIG="dotbot.yml"
DOTBOT_DIR="tools/dotbot"

DOTBOT_BIN="bin/dotbot"
_REL_TO_BASE="/../"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")${_REL_TO_BASE}" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
