if status is-interactive
    # Commands to run in interactive sessions can go here
end
set --prepend PATH "$HOME/.local/bin"

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Autosuggestion color - brighter for better visibility
#   If you want to try different colors, here are some alternatives that work well with Catppuccin:
#
#  - Pink/Magenta: brmagenta (current setting) - bright and visible
#  - Green: brgreen - softer, nature-inspired
#  - Cyan: brcyan - cool and tech-like
#  - Yellow: bryellow - warm and high contrast
#
#  You can also use hex colors for more precise control. Some nice Catppuccin-compatible options:
#  - Pink: #f5c2e7
#  - Green: #a6e3a1
#  - Teal: #94e2d5
#  - Mauve: #cba6f7
set -g fish_color_autosuggestion #f5c2e7

# aliases
# Changing "ls" to "eza"
# Skip eza aliases inside Claude Code to avoid parsing issues
if type -q eza; and not set -q CLAUDECODE
    alias ls='eza -al --color=always --group-directories-first --icons'
    alias la='eza -a --color=always --group-directories-first'
    alias ll='eza -l -g --color=always --group-directories-first --icons'
    alias lt='eza -aT --color=always --group-directories-first'
    alias lla='ll -a'
    alias ltr='eza -l --sort=modified --reverse --color=always --icons'
    alias l.='eza -a | egrep "^\."'
    alias l..='eza -al --color=always --group-directories-first ../../'
    alias l...='eza -al --color=always --group-directories-first ../../../'
    alias tree='eza --tree'
end

set -gx EDITOR nvim

### HomeBrew
if test -d /home/linuxbrew/.linuxbrew
    # Homebrew is installed on Linux
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
else if test -d /opt/homebrew
    # Homebrew is installed on MacOS
    /opt/homebrew/bin/brew shellenv | source
end

function fish_user_key_bindings
    # Execute this onceer mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    #
    #         # Then execute the vi-bindings so they takerecedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

### SET MANPAGER
### Uncomment only one of these!

### "nvim" as manpager
set -x MANPAGER "nvim +Man!"

### "less" as manpager
# set -x MANPAGER "less"

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

zoxide init --cmd cd fish | source
starship init fish | source

# This needs to be added before "function ... --wraps kubectl"
kubectl completion fish | source

# 1Password CLI completion
if type -q op
    op completion fish | source
end

# adds alias for "kubectl" to "kubecolor" with completions
function kubectl --wraps kubectl
    command kubecolor $argv
end

# adds alias for "k" to "kubecolor" with completions
function k --wraps kubectl
    command kubecolor $argv
end

# reuse "kubectl" completions on "kubecolor"
function kubecolor --wraps kubectl
    command kubecolor $argv
end
