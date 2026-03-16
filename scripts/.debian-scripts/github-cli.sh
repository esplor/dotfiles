#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

[ -d /etc/apt/keyrings ] || sudo mkdir -p -m 755 /etc/apt/keyrings

download_to_stdout "https://cli.github.com/packages/githubcli-archive-keyring.gpg" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null

sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install gh -y

success "GitHub CLI installed successfully"
