sudo apt install libpython3-dev python3-venv xinit build-essential picom x11-utils fonts-recommended kitty psmisc imagemagick pipewire-pulse pavucontrol upower feh rofi gnome-themes-extra

sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install --upgrade qtile[widgets] pywal16
