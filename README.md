# Dotfiles

Personal dotfiles managed with GNU Stow for Debian-based systems.

## Structure

- `shell/` - Shell config (.bash_aliases, .bash_functions, .gitconfig, starship)
- `editors/` - Editor config (vim, neovim)
- `terminal/` - Terminal emulators (kitty, foot, alacritty, tmux)
- `wm/` - Window managers (sway, hypr, niri, qtile, waybar, rofi)
- `apps/` - Application config (bat, gh, gtk, easyeffects, autostart)
- `scripts/` - Debian installation and setup scripts
- `wallpapers/` - Wallpaper collection
- `local/` - Local user data (flatpak overrides)

## Installation

```bash
# Clone repository
git clone --recurse-submodules https://github.com/esplor/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Run interactive setup script
./prepare-dotfiles.sh
```

The setup script will prompt you to select which packages to install and handle the stow process.
