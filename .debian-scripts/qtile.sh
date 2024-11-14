sudo apt install python3-venv xinit libglib2.0-bin build-essential libpangocairo-1.0-0 libgdk-pixbuf2.0-0 \
	libpython3-dev libiw-dev feh picom x11-utils fonts-recommended kitty dex python3-pip python3-dbus-next python3-cffi \
	python3-cairocffi libxcb-render0-dev libffi-dev python3-cffi psutils
sudo python3 -m venv /opt/qtile --upgrade-deps
sudo /opt/qtile/bin/pip install --upgrade qtile[widgets] qtile-extras
cat <<EOF> $HOME/example.xinitrc
# Rename file to .xinitrc
# something cool & # Remember "and" at the end.
# Have a look at xprofile

exec /opt/qtile/bin/qtile start
EOF
