#!/usr/bin/env sh

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Source utility functions if available
if [ -f "$SCRIPT_DIR/dot-debian/.debian-scripts/utils/functions.sh" ]; then
    . "$SCRIPT_DIR/dot-debian/.debian-scripts/utils/functions.sh"
else
    # Fallback if functions.sh is not available
    alert() { printf "=== %s ===\n" "$1" >&2; }
    success() { printf "=== %s ===\n" "$1"; }
fi

# Check if stow is installed
if ! command -v stow >/dev/null 2>&1; then
    alert "stow is not installed."
    printf "Would you like to install stow now? (y/n): "
    read -r reply
    if [ "$reply" = "y" ] || [ "$reply" = "Y" ]; then
        sudo apt install stow
    else
        alert "stow is required to continue. Exiting."
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

# Function to get package description
get_description() {
    case "$1" in
        "dot-config") echo "Configuration files (.config, bash aliases, git config)" ;;
        "dot-debian") echo "Debian installation and setup scripts" ;;
        "dot-local") echo "Local user data (flatpak overrides)" ;;
        "dot-vim") echo "Vim configuration files and plugins" ;;
        "dot-wallpapers") echo "Wallpaper collection" ;;
        *) echo "Unknown package" ;;
    esac
}

# Define package order
PACKAGES="dot-config dot-debian dot-local dot-vim dot-wallpapers"

echo ""
echo "=== Dotfiles Stow Menu ==="
echo ""
echo "Select which packages to stow:"
echo ""

# Display options
echo "  0) All packages"
num=1
for pkg in $PACKAGES; do
    echo "  $num) $pkg - $(get_description "$pkg")"
    num=$((num + 1))
done
echo ""

# Get user selection
printf "Enter selection (0 for all, or comma-separated numbers like 1,3): "
read -r selection

# Parse selection
SELECTED_PACKAGES=""

if [ "$selection" = "0" ]; then
    # Select all packages
    SELECTED_PACKAGES="$PACKAGES"
    echo ""
    echo "Stowing all packages..."
else
    # Parse comma-separated selections
    # Replace commas with spaces
    selections=$(echo "$selection" | tr ',' ' ')

    for sel in $selections; do
        # Trim whitespace
        sel=$(echo "$sel" | xargs)

        # Validate selection
        if [ "$sel" -ge 1 ] 2>/dev/null && [ "$sel" -le 5 ] 2>/dev/null; then
            # Convert number to package name
            count=1
            for pkg in $PACKAGES; do
                if [ "$count" -eq "$sel" ]; then
                    SELECTED_PACKAGES="$SELECTED_PACKAGES $pkg"
                    break
                fi
                count=$((count + 1))
            done
        else
            echo "Warning: Invalid selection '$sel' ignored"
        fi
    done
fi

# Check if any packages were selected
if [ -z "$SELECTED_PACKAGES" ]; then
    alert "No valid packages selected. Exiting."
    exit 1
fi

# Display selected packages
echo ""
echo "Selected packages:"
for pkg in $SELECTED_PACKAGES; do
    echo "  - $pkg"
done
echo ""

# Confirm before stowing
printf "Proceed with stowing? (y/n): "
read -r reply
if [ "$reply" != "y" ] && [ "$reply" != "Y" ]; then
    echo "Cancelled."
    exit 0
fi

# Run stow
echo ""
echo "Running stow..."
if stow --restow --verbose $SELECTED_PACKAGES; then
    echo ""
    success "Done!"
else
    echo ""
    alert "Stow failed with errors"
    exit 1
fi
