#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo apt install virt-manager virt-viewer
sudo usermod -aG libvirt "$(whoami)"

success "Virt-manager installed successfully"
tip "Run 'newgrp libvirt' to activate group membership immediately, or log out and back in"
