#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

[ -d /etc/apt/keyrings ] || sudo mkdir -p -m 755 /etc/apt/keyrings

download_to_stdout "https://dl.google.com/linux/linux_signing_key.pub" | sudo tee /etc/apt/keyrings/google-chrome.gpg > /dev/null

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null

sudo apt update && sudo apt install -y google-chrome-stable

success "Google Chrome installed successfully"
tip "Set as default browser: xdg-settings set default-web-browser google-chrome.desktop"
