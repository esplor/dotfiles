#/usr/bin/env bash

LOCAL_DIR=/usr/local

. ./functions.sh

if [ ! -d $LOCAL_DIR ]; then
    echo "Directory $LOCAL_DIR does not exist, creating.."
    mkdir -p $LOCAL_DIR
fi

wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | sudo tar xz -C $LOCAL_DIR --strip-components=1

_print_dots
echo Latest nvim downloaded and extracted to: $LOCAL_DIR/bin
_print_dots
