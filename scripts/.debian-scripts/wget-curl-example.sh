#!/usr/bin/env sh

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source the functions from utils/functions.sh
# This works regardless of where the script is called from
. "$SCRIPT_DIR/utils/functions.sh"

echo "===== Download Tools Example Script ====="
echo ""

# Example 1: Check if download tools are available
echo "Example 1: Checking for curl or wget..."
check_download_tools
echo "✓ Download tools are available!"
echo ""

# Example 2: Download content to stdout
echo "Example 2: Downloading example.com to stdout (first 5 lines)..."
download_to_stdout "https://example.com" | head -n 5
echo "..."
echo ""

# Example 3: Download to a file
echo "Example 3: Downloading to /tmp/example.html..."
download_to_file "https://example.com" "/tmp/example.html"
if [ -f "/tmp/example.html" ]; then
    echo "✓ File downloaded successfully! Size: $(wc -c < /tmp/example.html) bytes"
    rm /tmp/example.html
else
    echo "✗ Download failed"
fi
echo ""

echo "===== Examples completed successfully! ====="
