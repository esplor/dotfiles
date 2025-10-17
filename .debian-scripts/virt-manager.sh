#!/usr/bin/env sh
sudo apt install virt-manager virt-viewer
sudo usermod -aG libvirt $(whoami)
