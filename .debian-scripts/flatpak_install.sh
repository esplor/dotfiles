#!/usr/bin/env sh

. ./functions

sudo apt-get update
sudo apt-get install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

print_dots
echo "Optional:\nInstall gnome-software-plugin-flatpak if gnome is preferred desktop"
print_dots
