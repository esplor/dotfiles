#/usr/bin/env bash

LOCAL_DIR=/usr/local

. ./functions

sudo apt install -y ripgrep luarocks make build-essential libtree-sitter0

if [ ! -d $LOCAL_DIR ]; then
    echo "Directory $LOCAL_DIR does not exist, creating.."
    mkdir -p $LOCAL_DIR
fi
url_stdout https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | sudo tar xz -C $LOCAL_DIR --strip-components=1

print_dots
echo Latest nvim downloaded and extracted to: $LOCAL_DIR/bin
print_dots
