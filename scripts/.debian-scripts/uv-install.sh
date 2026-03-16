#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

download_to_stdout "https://astral.sh/uv/install.sh" | sh

success "uv (Python package installer) installed successfully"
tip "Restart your shell or run 'source ~/.bashrc' (or ~/.zshrc) to use uv"
