# Overview
- Git repository with collection of dotfiles and Debian scripts
- GNU Stow symlinks files one directory up to $HOME
- Structure: dot-config/, dot-debian/, dot-local/, dot-vim/, dot-wallpapers/
- prepare-dotfiles.sh ensures stow is installed and required directories exist

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
- Config files go in dot-config/
- Debian scripts go in dot-debian/
- Never modify files directly in $HOME - edit in dotfiles repo
- Use stow to deploy changes
