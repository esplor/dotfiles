#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

if ! command -v uv >/dev/null 2>&1; then
    alert "uv is not installed. Run uv-install.sh first."
    exit 10
fi

uv tool install pywal16
uv tool install tldr

success "uv tools installed: pywal16, tldr"
tip "Run 'uv tool update-shell' if the tools are not in your PATH"
