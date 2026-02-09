if not set -q XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME $HOME/.config
end

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias onotes="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
alias brain="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/COG-second-brain"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH $HOME/.lmstudio/bin
