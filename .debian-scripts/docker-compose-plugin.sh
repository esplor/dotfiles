#!/usr/bin/env bash
# Clean this..

DC_PATH="/usr/local/bin"

# DC_PATH="$HOME/.docker/cli-plugins"

if [ ! -d $DC_PATH ]; then
    echo $DC_PATH directory does not exist, creating..
    mkdir -p $DC_PATH
    curl --silent -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o $DC_PATH/docker-compose
    chmod +x $DC_PATH/docker-compose
    echo Done! Check version by cli command: $DC_PATH/docker-compose version
else
    echo $DC_PATH exists, continue download...
    curl --silent -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o $DC_PATH/docker-compose
    chmod +x $DC_PATH/docker-compose
    echo -e "---\nDone!\n---\nCheck version by cli command:\n$DC_PATH/docker-compose version\nURL: https://github.com/docker/compose/releases/"
fi
