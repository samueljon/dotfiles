if not set -q XDG_CONFIG_HOME
    set -x XDG_CONFIG_HOME $HOME/.config
end

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"
alias onotes="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
alias brain="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/COG-second-brain"

# macOS-specific functions
function hiddenon
    defaults write com.apple.finder AppleShowAllFiles TRUE
    killall Finder
end

function hiddenoff
    defaults write com.apple.finder AppleShowAllFiles FALSE
    killall Finder
end

# 1Password CLI - Enable Touch ID for biometric unlock
if type -q op
    set -gx OP_BIOMETRIC_UNLOCK_ENABLED true
end

if type -q pyenv
    set -gx PYENV_ROOT "$HOME/.pyenv"
    set -gx PATH "$PYENV_ROOT/bin" $PATH
    pyenv init --path | source
    pyenv init - | source
end

set -gx PATH $PATH /Applications/Obsidian.app/Contents/MacOS
