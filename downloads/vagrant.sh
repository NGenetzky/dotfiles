#!/bin/bash

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
source "${SCRIPTDIR}/_downloads.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://releases.hashicorp.com/vagrant/2.2.2/vagrant_2.2.2_linux_amd64.zip' \
	'vagrant_2.2.2_linux_amd64.zip'

