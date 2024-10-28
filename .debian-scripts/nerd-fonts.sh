#!/bin/bash

. ./functions

NERD_DIR=$HOME/.fonts/nerdfonts

[ -d $NERD_DIR ] || mkdir -p $NERD_DIR

# https://github.com/ryanoasis/nerd-fonts
fonts=(
    "CascadiaCode"
    "FiraCode"
)

for font in ${fonts[*]} 
do
    url_stdout https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz | tar -xJf - -C $NERD_DIR
    print_dots
    echo $font unpacked to $NERD_DIR
done
print_dots
echo "Updating fonts cache..." && fc-cache -f && echo "Done!"
