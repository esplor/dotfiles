#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo sh -c 'cat <<EOF> /etc/apt/sources.list
deb http://deb.debian.org/debian                bookworm                        main contrib non-free non-free-firmware
deb http://deb.debian.org/debian                bookworm-updates                main contrib non-free non-free-firmware
deb http://deb.debian.org/debian-security/      bookworm-security               main contrib non-free non-free-firmware

# *** Optional ***
#deb http://deb.debian.org/debian                bookworm-backports              main contrib non-free non-free-firmware
#deb http://deb.debian.org/debian                bookworm-backports-sloppy       main contrib non-free non-free-firmware
#deb http://deb.debian.org/debian                bookworm-proposed-updates       main contrib non-free non-free-firmware
EOF'

success "Bookworm sources.list configured successfully"
tip "Run 'sudo apt update' to refresh package lists"
