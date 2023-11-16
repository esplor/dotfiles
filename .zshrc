# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eslo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=$HOME/.local/bin:$PATH

#if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#  exec sway
#fi
#
source /usr/share/zsh-antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme agnoster
antigen apply
