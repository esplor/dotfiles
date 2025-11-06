#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo apt-get update
sudo apt-get install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

success "Flatpak installed successfully"
tip "For Gnome users: sudo apt install gnome-software-plugin-flatpak"
