# .zshrc

# profile config & load git info
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ':%F{70}%b%f'
setopt PROMPT_SUBST
PROMPT='%F{39}%2~%f${vcs_info_msg_0_} '

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find ."

# custom commands
source ~/.myCommands.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jcmunday/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jcmunday/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jcmunday/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jcmunday/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# aliases
alias ll="ls -al"
alias gs="git status"
alias gc="git commit -m"
alias gca="git commit -am"
# rosetta x86 equivalent commands
alias condax86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/condabin/conda"
alias pipx86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/envs/pytorch_x86/bin/python -m pip"
alias pythonx86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/envs/pytorch_x86/bin/python"

# named directories
hash -d personal=/Users/jcmunday/Documents/personal/
hash -d books=/Users/jcmunday/Documents/computing/books
hash -d go=/Users/jcmunday/Documents/computing/go/src/

# go
GOPATH=/Users/jcmunday/Documents/computing/go
export GOPATH
PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting
export GO111MODULE=on
