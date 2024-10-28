#!/bin/bash

# https://github.com/ryanoasis/nerd-fonts
NERD_DIR=$HOME/.fonts/nerdfonts

[ -d $NERD_DIR ] || mkdir -p $NERD_DIR

fonts=(
    "CascadiaCode"
    "FiraCode"
)

for font in ${fonts[*]} 
do
    wget -O- https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz | tar -xJf - -C $NERD_DIR
done
