sudo apt install curl wget stow xserver-xorg-core xserver-xorg-input-kbd xserver-xorg-input-libinput xserver-xorg-video-qxl libpython3-dev build-essential libiw-dev python3-venv imagemagick network-manager-applet xinit kitty pipewire-pulse pavucontrol dunst
sudo apt install libglib2.0-bin

sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install qtile[widgets] pywal16
