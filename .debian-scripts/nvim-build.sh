#!/usr/bin/env sh
NVIM_BUILD_DIR=/tmp/neovim-git/
# https://github.com/neovim/neovim/blob/master/BUILD.md
# The build type determines the level of used compiler optimizations and debug information:
# ---
# Release: Full compiler optimizations and no debug information. Expect the best performance from this build type.
# Often used by package maintainers.
# ---
# Debug: Full debug information; few optimizations. Use this for development to get meaningful output 
# from debuggers like GDB or LLDB. This is the default if CMAKE_BUILD_TYPE is not specified.
# ---
# RelWithDebInfo ("Release With Debug Info"): Enables many optimizations and adds enough debug info so that
# when Neovim ever crashes, you can still get a backtrace.

[ -d $NVIM_BUILD_DIR ] && rm -rf $NVIM_BUILD_DIR # If clone dir exist, delete before cloning

sudo apt-get update \
    && sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential luarocks python3-venv \
    && git clone --depth=1 --branch=stable https://github.com/neovim/neovim $NVIM_BUILD_DIR \
    && cd $NVIM_BUILD_DIR && make CMAKE_BUILD_TYPE=RelWithDebInfo && sudo make install
