#/usr/bin/env bash

dir=$HOME/.local

if [ ! -d $dir ]; then
    echo "Directory $dir doesn't exist, creating.."
    mkdir -p $dir
fi

wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar xvz -C $dir --strip-components=1

cat << EOF
`printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -`
Latest nvim downloaded and extracted.

NB: Remember to add $dir/bin to your path
`printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -`
EOF
