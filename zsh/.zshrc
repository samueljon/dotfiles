export PATH=$PATH:/snap/bin
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#XDG_CONFIG_HOME="$HOME/.config"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
#zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
#alias vim='nvim'
alias c='clear'
alias tmux='TERM=xterm-256color tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias k="kubectl"
alias v="velero"
alias vim="nvim"
alias vi="nvim"
alias k="kubectl"
alias kubectl="kubecolor"
alias myip="curl wtfismyip.com/text"
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias syncbooks='rsync -avr ~/Library/Mobile\ Documents/com~apple~CloudDocs/calibre-lib calibre.villingaholt.nu:/opt/calibre-lib'
alias ls="eza"
alias ll="eza -l -g --icons"
alias lla="ll -a"

export OP_BIOMETRIC_UNLOCK_ENABLED=true
# get zsh complete kubectl
source <(kubectl completion zsh)
# make completion work with kubecolor
compdef kubecolor=kubectl


function pgexec() {
    pgcluster=$1
    shift
    /usr/local/bin/kubectl exec -c postgres -ti $(kubectl get pods -o custom-columns=:metadata.name --field-selector status.podIP=$(/usr/local/bin/kubectl get endpoints $pgcluster -o go-template='{{ (index (index .subsets 0).addresses 0).ip }}')) -- "$@"
}

function enansible() {
    source ~/_runtimes/ansible/bin/activate
}

function disansible() {
    source ~/_runtimes/ansible/bin/deativate
}

function flushcache(){
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
}

function hiddenoff(){
    defaults write com.apple.finder AppleShowAllFiles FALSE
    killall Finder
}

function hiddenon(){
    defaults write com.apple.finder AppleShowAllFiles TRUE
    killall Finder
}
