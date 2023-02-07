export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    gitfast 
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

ALIASES=~/.zsh_aliases
EXPORTS=~/.zsh_exports
UTILS=~/.zsh_utils

if [ -f "$ALIASES" ]; then
    source $ALIASES
fi

if [ -f "$EXPORTS" ]; then
    source $EXPORTS
fi

if [ -f "$UTILS" ]; then
    source $UTILS
fi

source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/moritz/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/moritz/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/moritz/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/moritz/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f "/home/moritz/.ghcup/env" ] && source "/home/moritz/.ghcup/env" # ghcup-env

export PATH="/home/moritz/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# binding for history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

eval "$(zoxide init zsh --cmd j)"
