#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
source "${SCRIPTDIR}/_downloads.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://download.teamviewer.com/download/linux/teamviewer_amd64.deb' \
	'teamviewer_amd64.deb'

