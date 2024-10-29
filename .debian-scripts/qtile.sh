sudo apt install python3-venv xinit libglib2.0-bin build-essential libpangocairo-1.0-0 libgdk-pixbuf2.0-0 x11-xserver-utils libpython3-dev libiw-dev
sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install --upgrade qtile[widgets]
cat <<EOF> $HOME/.xinitrc
# Minimal startup
# Maybe add:
# xrandr --output DISP --mode WxH &
# something cool &
exec /opt/qtile/bin/qtile start
EOF

#sudo apt install firefox-esr-l10n-nb-no nautilus
