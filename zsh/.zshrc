#!/bin/sh
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# my custom prompt
plug "MoritzSchwerer/zap-prompt"

# plugins
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/fzf"
plug "zap-zsh/vim"
plug "zap-zsh/exa"


# keybinds
bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH
