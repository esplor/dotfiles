#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

[ -d /etc/apt/keyrings ] || sudo mkdir -p -m 755 /etc/apt/keyrings

download_to_stdout "https://www.virtualbox.org/download/oracle_vbox_2016.asc" | gpg --dearmor | sudo tee /etc/apt/keyrings/oracle-virtualbox.gpg > /dev/null

echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/oracle-virtualbox.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/oracle-virtualbox.list > /dev/null

sudo apt update
sudo apt install virtualbox

success "VirtualBox repository configured successfully"
tip "Add your user to vboxusers group: sudo usermod -aG vboxusers \$(whoami) && newgrp vboxusers"
