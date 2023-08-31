#!/usr/bin/env sh

# TODO: if ~/.apps not exist.. create
wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar xvz -C ~/.apps --strip-components=1
echo -e "remember to run 'export PATH=~.apps/bin:$PATH'"