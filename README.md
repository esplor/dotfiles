# Dotfiles

Personal dotfiles managed with GNU Stow for Debian-based systems.

## Structure

- `dot-config/` - Configuration files (.config, bash aliases, git config)
- `dot-debian/` - Debian installation and setup scripts
- `dot-local/` - Local user data (flatpak overrides)
- `dot-vim/` - Vim configuration and plugins
- `dot-wallpapers/` - Wallpaper collection

## Installation

```bash
# Clone repository
git clone --recurse-submodules https://github.com/esplor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run interactive setup script
./prepare-dotfiles.sh
```

The setup script will prompt you to select which packages to install and handle the stow process.
