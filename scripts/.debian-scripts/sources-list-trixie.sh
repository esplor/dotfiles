#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
. "$SCRIPT_DIR/utils/functions.sh"

is_root

sudo sh -c 'cat <<EOF> /etc/apt/sources.list
deb http://deb.debian.org/debian                trixie                        main contrib non-free non-free-firmware
deb http://deb.debian.org/debian                trixie-updates                main contrib non-free non-free-firmware
deb http://deb.debian.org/debian-security/      trixie-security               main contrib non-free non-free-firmware

# *** Optional ***
#deb http://deb.debian.org/debian                trixie-backports              main contrib non-free non-free-firmware
#deb http://deb.debian.org/debian                trixie-backports-sloppy       main contrib non-free non-free-firmware
#deb http://deb.debian.org/debian                trixie-proposed-updates       main contrib non-free non-free-firmware
EOF'

success "Trixie sources.list configured successfully"
tip "Run 'sudo apt update' to refresh package lists"
