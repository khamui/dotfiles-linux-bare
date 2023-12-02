# Updated 8.10.22 (manually, curl)
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# functions
set_python_runtime() {
    if [ "$1" = "for_venv" ]; then
        alias python='venv/bin/python3'
        echo 'On '"$(python --version)"' (local)'
    else
        alias python="/bin/python3"
        echo 'On '"$(python --version)"' (global)'
    fi
}

# navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias k='cd ~'
alias dt='cd ~/Desktop'

# command aliases
alias v='nvim'
alias ls='ls -alrt -G'
alias s='git status'
alias b='git branch'
alias a='git add .'
alias co='git checkout '
alias po='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias hist='git log --oneline --graph --decorate --all'
alias soz='source ~/.zshrc'
alias pip=pip3
alias makepy='make clean && /usr/local/bin/python -m venv venv && make install && make watch'

# tmux aliases
alias :q='exit'
alias tmx='tmux'

# lazygit aliases
alias lg='lazygit'

# work aliases
alias wd='cd $ENV'

# dotfiles-bare alias
alias dot='/usr/bin/git --git-dir=$HOME/Repos/dotfiles-bare/ --work-tree=$HOME'

# python3 alias
set_python_runtime

# fzf searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^[[A' fzf-history-widget

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
