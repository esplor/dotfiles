### Enhancements

#### Code Quality & Standards
- Add shellcheck validation to all scripts for catching common shell scripting errors
- Create a test suite to verify all scripts can source functions.sh correctly from any directory
- Add error handling wrapper function that catches failures and provides meaningful error messages
- Implement logging functionality to track script execution and errors to /var/log or ~/.local/share/logs

#### User Experience
- Create a confirm/prompt function that displays what the script will do before execution
- Add dry-run mode (--dry-run flag) to show what would be executed without making changes
- Implement verbose mode (--verbose flag) for detailed output during execution
- Add --help flag support to all scripts showing usage and description
- Create a master menu.sh that lists and executes all available installation scripts interactively

#### Functionality Enhancements
- Add rollback/uninstall scripts for each installation script
- Create backup function that saves current config before overwriting (e.g., sources.list)
- Add version checking to skip re-installation if package already installed
- Implement parallel execution support for installing multiple packages simultaneously
- Add dependency resolution - check if required packages are installed before proceeding

#### Repository Management
- Standardize all keyrings to /etc/apt/keyrings across all scripts
- Create a cleanup function to remove old/deprecated keyring files
- Add GPG key verification before importing to keyrings
- Implement automatic apt update after adding new repositories

#### Script-Specific Improvements
- **docker-install.sh**: Add Docker post-installation steps (enable service, test with hello-world)
- **nerd-fonts.sh**: Make font list configurable via argument or config file
- **vscode.sh**: Add option to install VS Code extensions after installation
- **nvim-build.sh**: Add option to choose build type (Release/Debug/RelWithDebInfo) via argument
- **virtualbox.sh**: Complete the installation by actually installing VirtualBox package

#### Color & Output
- Add YELLOW color for warnings
- Add BLUE color for informational messages
- Create a spinner/progress indicator function for long-running operations
- Add table formatting function for displaying system information

### Todos

#### High Priority
- [x] Create a function to check for wget or curl, and provide as download client, if not found exit with error code
- [x] Refactor remaining scripts (uv-install.sh, docker-compose-plugin.sh) to use SCRIPT_DIR sourcing
- [x] Fix docker-compose-plugin.sh - uses deprecated `is_user_root` function (should be `is_root`)
- [x] Add proper variable quoting to docker-compose-plugin.sh (e.g., "$DC_PATH" instead of $DC_PATH)
- [ ] Test all scripts on fresh Debian installation to ensure they work correctly

#### Medium Priority
- [ ] Make a function to display what the script does, then choose confirm/exit
- [ ] Create script documentation with examples in README.md
- [ ] Add --version flag support showing script and functions.sh version
- [ ] Implement configuration file support (~/.config/debian-scripts/config.sh) for customization
- [ ] Create installation script that sets up the entire debian-scripts environment

#### Low Priority
- [ ] Add completion scripts for bash/zsh to autocomplete script names
- [ ] Create GitHub Actions workflow to validate scripts with shellcheck
- [ ] Add update-all.sh script to update all installed packages/tools
- [ ] Create status.sh to show which tools are installed and their versions
- [ ] Add support for non-Debian distributions (Ubuntu, Mint, etc.)

### Changelog
- 06.11.2025 - Refactored all scripts to use SCRIPT_DIR for portable sourcing
- 06.11.2025 - Added tip() function for user-friendly tips and suggestions
- 06.11.2025 - Standardized colors to bold bright (more visible)
- 06.11.2025 - Created download_to_stdout() and download_to_file() functions
- 06.11.2025 - Refactored is_root() to properly validate sudo privileges
- 08.11.2024 - Single source of scripts inside .dotfiles
- 08.11.2024 - esplor/debian deleted, files consolidated
