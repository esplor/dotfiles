#!/usr/bin/env sh

# TODO: 
# Check if wget installed else curl or return error.

wget -O /tmp/latest-vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install /tmp/latest-vscode.deb
