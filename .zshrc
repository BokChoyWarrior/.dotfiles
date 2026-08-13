## prompt stuff
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '${PRE_DIR}%r/%S<M>${POST_DIR} %Bgit:%F{cyan}%b%f%%b'
setopt PROMPT_SUBST
PRE_DIR="%B%F{blue}"
POST_DIR="%f%b"
precmd() {
  vcs_info
  # dir
  local path_part=""
  if [[ -n $vcs_info_msg_0_ ]]; then
      path_part="${${vcs_info_msg_0_/\/.<M>/}/<M>/}"
  else
      local p="${PWD/#$HOME/~}"
      local parts=("${(@s:/:)p}")
      local short=()
      for part in $parts[1,-2]; do
        short+=($part[1,5])
      done
      short+=($parts[-1])
      path_part="${PRE_DIR}${(j:/:)short}${POST_DIR}"
  fi
  # show user&host if in ssh
  local ssh_host_part=""
  [[ -n $SSH_TTY ]] && ssh_host_part="%F{red}<${USER}@${HOST%%.*}>%f"
  RPROMPT="$ssh_host_part"

  PROMPT="${path_part} %F{green}❯%f "
}

export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export _ZO_DATA_DIR="$HOME/.config"

# ZSH
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHAREHISTORY
setopt AUTO_CD
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
DISABLE_MAGIC_FUNCTIONS="true"

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
[[ -f /usr/share/nvm/init-nvm.sh ]] && . /usr/share/nvm/init-nvm.sh
[[ -f $LLAMA_CPP/.llama-completion.bash ]] && . $LLAMA_CPP/.llama-completion.bash

export EDITOR='nvim'
bindkey -e

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Aliases ###
alias v='nvim'
alias zshconfig='v ~/.zshrc && source ~/.zshrc'

alias ls='ls --color=auto -hv'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -c=auto'
alias l='ls'
alias ll='ls -l'
alias ld='ls -ld'
alias la='ls -la'
alias la='ls -lA'
alias mv='mv -i'

# git aliases
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gcb='git checkout -b'
alias gcom='git checkout $(git branch --format="%(refname:short)" | grep -E "^(main|master)" | head -1)'
alias gcam='git commit --all --message'
alias gcaA='git commit --verbose --all --amend'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias gtree='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gpf!='git push --force'
alias gpsup='git push --set-upstream origin $(git branch --show-current)'
alias gpristine='git reset --hard && git clean --force -dfx'

# systemd capitulation
alias scu='systemctl --user'
alias ssc='sudo systemctl'
alias scud='scu daemon-reload'
alias sscd='ssc daemon-reload'
alias jc='journalctl'
alias jcu='jc --user'
alias sjc='sudo jc'
alias sjcf='sjc -f --no-pager -u'
alias jcuf='jcu -f -u'

### Plugins ###

# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

# https://github.com/junegunn/fzf
source <(fzf --zsh)

### Should be in package managers, else brew, else git.
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
# https://github.com/zsh-users/zsh-autosuggestions/tree/master
# https://github.com/zsh-users/zsh-history-substring-search



# linux package manager or mac homebrew
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh # sMack OS

# arch btw
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # arch linux btw
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# RedHat based # cringe # based
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=""
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=""

