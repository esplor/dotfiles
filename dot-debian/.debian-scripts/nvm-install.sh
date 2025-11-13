#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

#is_root #Script doesn't require sudo for now at least.
alert "Starting nvm installer"
download_to_stdout "https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh" | bash

success "nvm install script finished"
tip "Homepage: https://github.com/nvm-sh/nvm"
tip "Run 'nvm install --lts' for latest long term support"
