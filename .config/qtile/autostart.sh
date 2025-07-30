#!/usr/bin/env sh 
dex -a

gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

gnome-keyring-daemon -s
/opt/qtile/bin/wal -i /home/eslo/Wallpapers/ --recursive -a 75 -b 000000
