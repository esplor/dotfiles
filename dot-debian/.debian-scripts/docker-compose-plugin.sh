#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

DC_PATH="/usr/libexec/docker/cli-plugins"
# DC_PATH="$HOME/.docker/cli-plugins"

[ -d "$DC_PATH" ] || sudo mkdir -p "$DC_PATH"

download_to_file "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m)" "$DC_PATH/docker-compose"

sudo chmod +x "$DC_PATH/docker-compose"

success "Docker Compose plugin installed successfully"
tip "Check version: $DC_PATH/docker-compose version"
tip "GitHub releases: https://github.com/docker/compose/releases/"
