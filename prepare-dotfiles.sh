#!/usr/bin/env sh

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    echo "stow is not installed."
    read -p "Would you like to install stow now? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo apt install stow
    else
        echo "stow is required to continue. Exiting."
        exit 1
    fi
fi

# Create necessary directories if they don't exist
if [ ! -d "$HOME/.config" ]; then
    echo "Creating $HOME/.config directory..."
    mkdir -p "$HOME/.config"
fi

if [ ! -d "$HOME/.local" ]; then
    echo "Creating $HOME/.local directory..."
    mkdir -p "$HOME/.local"
fi

# Run stow to symlink dotfiles
stow -R .
