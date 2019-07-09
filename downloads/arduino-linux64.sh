#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
source "${SCRIPTDIR}/_downloads.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://downloads.arduino.cc/arduino-1.8.9-linux64.tar.xz' \
	'arduino-1.8.9-linux64.tar.xz'
