#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

[ -d /etc/apt/keyrings ] || sudo mkdir -p -m 755 /etc/apt/keyrings

download_to_stdout "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg" | sudo tee /etc/apt/keyrings/brave-browser-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/etc/apt/keyrings/brave-browser-archive-keyring.gpg]\
	https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update && sudo apt install brave-browser

success "Brave browser installed successfully"
