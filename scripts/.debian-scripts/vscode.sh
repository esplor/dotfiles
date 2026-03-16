#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

download_to_file "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" "/tmp/latest-vscode.deb"
sudo apt install /tmp/latest-vscode.deb

success "VS Code installed successfully"
