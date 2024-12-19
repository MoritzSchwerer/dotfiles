export PATH="$HOME/.miniconda3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$Home/.cargo/bin:$PATH"

# cuda toolkit
if [[ "$(hostname)" == "workstation" ]]; then
    export PATH="/usr/local/cuda-12.1/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64:$LD_LIBRARY_PATH"
fi

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

