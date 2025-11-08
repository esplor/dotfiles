#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

[ -d /etc/apt/keyrings ] || sudo mkdir -p -m 755 /etc/apt/keyrings

download_to_stdout "https://packages.twingate.com/apt/gpg.key" | sudo gpg --dearmor -o /etc/apt/keyrings/twingate-client-keyring.gpg

echo "deb [signed-by=/etc/apt/keyrings/twingate-client-keyring.gpg]\
	https://packages.twingate.com/apt/ * *"| sudo tee /etc/apt/sources.list.d/twingate-client.list

sudo apt update -yq && sudo apt install twingate -yq

success "Twingate client successfully install, configure with 'sudo twingate setup'"

tip "Configure with 'sudo twingate setup'"
