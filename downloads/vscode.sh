

SCRIPTDIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)"
source "${SCRIPTDIR}/_downloads.bash"

# Bash Strict Mode
set -eu -o pipefail

wget_download  \
	'https://go.microsoft.com/fwlink/?LinkID=760868' \
	'vscode.deb'
