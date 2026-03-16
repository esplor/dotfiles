#!/usr/bin/env sh

# ANSI color codes - bold and bright for visibility
RED='\033[1;91m'    # Bold bright red
GREEN='\033[1;92m'  # Bold bright green
NC='\033[0m'        # No Color

# check for root or sudo privileges, if not exit
is_root() {
    alert "Checking root permissions..."
    if [ "$(id -u)" -eq 0 ]; then
        success "You have root or sudo privileges, continuing..."
    else
        if ! sudo --validate --prompt="Validating sudo privileges: "; then
            alert "Sudo validation failed"
            exit 10
        fi
        success "You have root or sudo privileges, continuing..."
    fi
}

# Verify that curl or wget is installed
# Exits with code 10 if neither is found
check_download_tools() {
    if ! command -v curl >/dev/null 2>&1 && ! command -v wget >/dev/null 2>&1; then
        echo "${RED}Curl or Wget is required${NC}" >&2
        exit 10
    fi
}

# Download URL content to stdout using available tool
# Usage: download_to_stdout "https://example.com/file"
download_to_stdout() {
    check_download_tools
    local url="$1"

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$url"
    fi
}

# Download URL to a file
# Usage: download_to_file "https://example.com/file" "/path/to/destination"
download_to_file() {
    check_download_tools
    local url="$1"
    local dest="$2"

    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$url" -o "$dest"
    elif command -v wget >/dev/null 2>&1; then
        wget -q "$url" -O "$dest"
    fi
}

success() {
    printf "${GREEN}=== %s ===${NC}\n" "$1"
}

alert() {
    printf "${RED}=== %s ===${NC}\n" "$1"
}

tip() {
    printf "${GREEN}*** TIP! %s ***${NC}\n" "$1"
}
