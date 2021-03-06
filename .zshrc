# .zshrc

# profile config & load git info
autoload -Uz vcs_info
function precmd() {
    vcs_info
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
        echo ""
    fi
}
zstyle ':vcs_info:git:*' formats ':%F{70}%b%f'
setopt PROMPT_SUBST
PROMPT='%F{39}%2~%f${vcs_info_msg_0_} '

# aliases
alias vim="nvim"
alias python="python3"
alias ll="ls -al"
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gca="git commit -am"
alias gp="git push"
alias glo="git log --oneline"
# alias k="minikube kubectl --"
alias k="kubectl"
alias tx="tmuxinator"
alias txw="tmux list-windows | sed -n 's/.*layout \(.*\)] @.*/\1/p'"
# colourise test outputs for golang
alias gtc='''sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' '''
# rosetta x86 equivalent commands
# alias condax86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/condabin/conda"
# alias pipx86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/envs/pytorch_x86/bin/python -m pip"
# alias pythonx86="arch -x86_64 /Users/jcmunday/miniforge_x86_64/envs/pytorch_x86/bin/python"

export EDITOR='vim'

# zsh-completions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^\' autosuggest-execute

# fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    vim)          fzf "$@" --preview 'bat --color=always --style=numbers --line-range :300 {} | head -200' --preview-window=down,40% ;;
    *)            fzf "$@" ;;
  esac
}

# bat
alias cat="bat"
export BAT_THEME='gruvbox-dark'
export BAT_STYLE='numbers,changes'

# custom commands
source ~/.dotfiles/.zsh-commands.sh

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


# named directories
hash -d personal=/Users/jcmunday/Documents/personal/
hash -d books=/Users/jcmunday/Documents/computing/books
hash -d src=/Users/jcmunday/Documents/computing/
hash -d go=/Users/jcmunday/Documents/computing/go/

# go
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export GO111MODULE=on

export PATH="$PATH:/Users/jcmunday/.local/bin"

source "$(brew --prefix)/etc/profile.d/z.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jcmunday/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jcmunday/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jcmunday/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jcmunday/google-cloud-sdk/completion.zsh.inc'; fi
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
