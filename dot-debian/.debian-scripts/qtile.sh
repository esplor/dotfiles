#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo apt install \
	bibata-cursor-theme libpython3-dev python3-venv \
	libiw-dev libglib2.0-bin xinit build-essential picom \
	x11-utils xdg-desktop-portal xdg-desktop-portal-gtk mpv \
	fonts-recommended kitty psmisc imagemagick \
	pipewire-pulse pavucontrol upower feh rofi gnome-themes-extra easyeffects

sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install --upgrade qtile[widgets] pywal16

success "Qtile installed successfully to /opt/qtile"

