#!/usr/bin/env bash

# All users (Debian):
# DC_PATH="/usr/libexec/docker/cli-plugins"

# Current user
DC_PATH="$HOME/.docker/cli-plugins"

if [ ! -d $DC_PATH ]; then
    echo "*** \n"
    echo $DC_PATH directory does not exist, creating
    mkdir -p $DC_PATH
    curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o $DC_PATH/docker-compose
    chmod +x $DC_PATH/docker-compose

    compose_version="$(docker compose version)"
cat << EOF
    ---- Version installed ----
    $compose_version
    ---- ----------------- ----
EOF

else
    compose_old="$(docker compose version)"
    echo $DC_PATH exists, continue download...
    curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 -o $DC_PATH/docker-compose
    chmod +x $DC_PATH/docker-compose
    compose_new="$(docker compose version)"
cat << EOF
    ---- Old version ----
    $compose_old
    ---- New version ----
    $compose_new
    ----
EOF
fi