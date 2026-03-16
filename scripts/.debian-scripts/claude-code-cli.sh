#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

#is_root #Script doesn't require sudo for now at least.
alert "Starting claude code installer"
download_to_stdout "https://claude.ai/install.sh" | bash

success "Claude code installer finished with no errors"
