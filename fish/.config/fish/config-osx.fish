if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

if not set -q XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME $HOME/.config
end

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/samueljon/.lmstudio/bin
