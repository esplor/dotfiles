#!/usr/bin/env sh

# ANSI color codes
RED='\033[0;31m'
NC='\033[0m' # No Color

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
