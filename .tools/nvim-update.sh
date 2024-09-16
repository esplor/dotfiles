#/usr/bin/env bash

LOCAL_DIR=$HOME/.local

if [ ! -d $LOCAL_DIR ]; then
    echo "Directory $LOCAL_DIR does not exist, creating.."
    mkdir -p $LOCAL_DIR
fi

wget -qO- https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz | tar xvz -C $LOCAL_DIR --strip-components=1

cat << EOF
`printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -`
Latest nvim downloaded and extracted.

NB: Remember to add $LOCAL_DIR/bin to your path
`printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -`
EOF