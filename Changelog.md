# Changelog

All notable changes to this dotfiles repository will be documented in this file.

## [Unreleased] - 2025-11-03

### Changed
- Enhanced `prepare-dotfiles.sh` script with improved error handling
  - Added check for stow installation with user prompt before installing
  - Added checks to create `$HOME/.config` and `$HOME/.local` directories if they don't exist
  - Improved script structure with comments and better organization
  - Script now exits gracefully if user declines to install stow

## 2025-11-03

### Added
- Initial `utils/functions.sh` with claude-sonnet as helper

## 2025-10-17

### Changed
- Ignored prepare script from version control

### Added
- Initial prepare dotfiles script
- Initial qtile virtual guest configuration
- Initial virt-manager setup

### Changed
- Updated GTK settings
- Added more git aliases

## 2025-10-13

### Changed
- Rearranged brightness buttons in configuration

## 2025-09-24

### Added
- Initial uv install script
- Screen dimmer functionality
