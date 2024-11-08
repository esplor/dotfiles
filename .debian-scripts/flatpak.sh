#!/usr/bin/env sh

. ./functions

sudo apt-get update
sudo apt-get install flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

print_dots
echo "Gnome tip:\nsudo apt install gnome-software-plugin-flatpak"
print_dots
