export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export _ZO_DATA_DIR="$HOME/.config"

# ZSH
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHAREHISTORY
setopt AUTO_CD
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
[[ -f /usr/share/nvm/init-nvm.sh ]] && . /usr/share/nvm/init-nvm.sh
[[ -f $LLAMA_CPP/.llama-completion.bash ]] && . $LLAMA_CPP/.llama-completion.bash

### Keybinds ###
export EDITOR='nvim'
export VISUAL='nvim'
bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Aliases ###
alias v='nvim'
alias zshconfig='v ~/.zshrc && source ~/.zshrc'

# git aliases
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gp='git push'
alias gl='git pull'
alias gcb='git checkout -b'
alias gcom='git checkout $(git branch --format="%(refname:short)" | grep -E "^(main|master)" | head -1)'
alias gcam='git commit --all --message'
alias gca!='git commit --verbose --all --amend'
alias gd='git diff'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias gtree='log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gpf!='git push --force'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpristine='git reset --hard && git clean --force -dfx'


# ZSH config
DISABLE_MAGIC_FUNCTIONS="true"
# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history.
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

### Plugins ###

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# https://github.com/junegunn/fzf
source <(fzf --zsh)

# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
# linux package manager or mac homebrew
# echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
# echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-autosuggestions/tree/master
# linux package manager or mac homebrew
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://github.com/zsh-users/zsh-history-substring-search
# linux package manager or mac homebrew
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=""

