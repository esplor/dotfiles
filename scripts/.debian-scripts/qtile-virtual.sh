#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo apt install curl wget stow xserver-xorg-core xserver-xorg-input-kbd xserver-xorg-input-libinput xserver-xorg-video-qxl libpython3-dev build-essential libiw-dev python3-venv imagemagick network-manager-applet xinit kitty pipewire-pulse pavucontrol dunst libglib2.0-bin

sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install qtile[widgets] pywal16

success "Qtile window manager installed successfully for virtual guest"
tip "Includes QXL video driver and essential packages for VM environments"
