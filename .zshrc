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
  if [ -d .git ] || [ -d ../.git ]; then
    git status
  else
    dot status
  fi
}

git_add() {
  if [ -d .git ] || [ -d ../.git ]; then
    git add .
  else
    dot add .
  fi
}

git_checkout() {
  if [ -d .git ] || [ -d ../.git ]; then
    git checkout $1
  else
    dot checkout $1
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

# amapet aliases
alias amas='lua ~/.config/kscripts/amapet_start.lua'
alias amac='lua ~/.config/kscripts/amapet_start_clean.lua'

# ripgrep
alias rg='~/Repos/rust/third-party/ripgrep/target/release/rg'

# python3 alias
set_python_runtime

# fzf searcher
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey '^[[A' fzf-history-widget
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# atlassian confluence
alias constart='lua ~/.config/kscripts/confluence_start.lua'
alias constop='lua ~/.config/kscripts/confluence_stop.lua'

# java
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-17.0.9.0.9-3.fc39.x86_64

# atlassian sdk
export ATLAS_HOME=/opt/atlassian-plugin-sdk

# atlassian sdk
export MAVEN_HOME=/opt/atlassian-plugin-sdk/apache-maven-3.9.5

# path
export PATH=$JAVA_HOME/bin:$ATLAS_HOME/bin:$MAVEN_HOME/bin:$PATH

# rust (custom location: usr/bin/rustrover/RustRover-{version}/bin)
export RUST_HOME=/usr/local/bin/rustrover/RustRover-233.15026.24
export PATH=$PATH:$RUST_HOME/bin

# codex (custom location: /opt/codex-2.0.4/Codex)
alias codex=/opt/codex-2.0.4/Codex

# rustrover 
alias rover=/usr/local/RustRover-2024.3.1/bin/rustrover
