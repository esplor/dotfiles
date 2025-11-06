#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

NERD_DIR=/usr/local/share/fonts/nerd-fonts

[ -d "$NERD_DIR" ] || sudo mkdir -p "$NERD_DIR"

# https://github.com/ryanoasis/nerd-fonts
fonts="CascadiaCode FiraCode"

for font in $fonts
do
    download_to_stdout "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz" | sudo tar -xJf - -C "$NERD_DIR" --wildcards "*.ttf"
    success "$font unpacked to $NERD_DIR"
done

success "Updating fonts cache..."
fc-cache -f
success "Nerd Fonts installed successfully"
