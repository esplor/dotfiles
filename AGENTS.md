# AGENTS.md

This file provides guidance to *Claude Code* and *Google Gemini* when working with code in this repository.

# Overview
- Git repository with collection of dotfiles and Debian scripts for Debian-based systems
- GNU Stow symlinks package directories one level up to `$HOME`
- `prepare-dotfiles.sh` installs stow if missing, creates `~/.config` and `~/.local`, then interactively stows selected packages

## Stow Packages
| Package | Contents |
|---------|----------|
| `shell/` | `.bash_aliases`, `.bash_functions`, `.gitconfig`, starship |
| `editors/` | vim, neovim |
| `terminal/` | kitty, foot, alacritty, tmux |
| `wm/` | sway, hypr, niri, qtile, waybar, rofi |
| `apps/` | bat, gh, gtk, easyeffects, autostart |
| `scripts/` | Debian installation and setup scripts |
| `wallpapers/` | Wallpaper collection |
| `local/` | Local user data (flatpak overrides) |

## Deploying Changes

```sh
# Deploy a single package
stow --restow shell

# Deploy all packages
./prepare-dotfiles.sh
```

## Guidelines

### Code Style
- Use long arguments: `sudo --prompt="text"` not `sudo -p "text"`
- Prioritize POSIX compliance and failsafe operations
- Prefer `apt` over `apt-get`

### Documentation
- Enhancement suggestions: Add as H3 "### Enhancements" section in README.md
- Todo items: Add as H3 "### Todos" section in README.md
- Keep documentation minimal and actionable

### Repository Structure
- Config files go in the appropriate package directory (e.g. `apps/`, `wm/`, `terminal/`)
- Debian scripts go in `scripts/`
