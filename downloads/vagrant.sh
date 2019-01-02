

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
source "${SCRIPTDIR}/_downloads.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://releases.hashicorp.com/vagrant/1.8.4/vagrant_1.8.4_x86_64.deb' \
	'vagrant_1.8.4_x86_64.deb'
