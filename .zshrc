# Updated 8.10.22 (manually, curl)
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
#
# dotfiles-bare alias
alias dot='/usr/bin/git --git-dir=$HOME/Repos/dotfiles-bare/ --work-tree=$HOME'

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

git_status() {
  if [ -d .git ]; then
    git status
  else
    dot status
  fi
}

git_add() {
  if [ -d .git ]; then
    git add .
  else
    dot add .
  fi
}

git_checkout() {
  if [ -d .git ]; then
    git checkout 
  else
    dot checkout 
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
alias l='ls -alrt -G'
alias r='rm -rfv'
alias s=git_status
alias b='git branch'
alias a=git_add
alias com='dot commit -m "quick commit dotfiles."'
alias co=git_checkout
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

# python3 alias
set_python_runtime

# fzf searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey '^[[A' fzf-history-widget
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
