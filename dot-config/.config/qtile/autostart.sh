#!/usr/bin/env sh
dex -a
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
exec --no-startup-id xset-s 180 120 && xss-lock -n slock
