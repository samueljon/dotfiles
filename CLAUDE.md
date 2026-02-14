# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository that manages configuration files for a development environment across macOS and Linux systems. The repository uses GNU Stow for symlink management and Ansible for automated installation of dependencies.

## Architecture

### Stow-Based Structure

Each top-level directory represents a "package" that Stow will symlink to the home directory:

- `fish/`, `zsh/` - Shell configurations
- `nvim/`, `vim/` - Editor configurations
- `git/` - Git configuration and aliases
- `tmux/` - Terminal multiplexer config
- `kitty/`, `ghostty/` - Terminal emulator configs
- `i3/`, `hypr/` - Window manager configurations (Linux)
- `starship/` - Cross-shell prompt
- `k9s/`, `superfile/` - CLI tool configs

The directory structure within each package mirrors the target location. For example:
- `fish/.config/fish/config.fish` → `~/.config/fish/config.fish`
- `git/.config/git/config` → `~/.config/git/config`

### Multi-OS Support

The fish shell configuration demonstrates the pattern used for OS-specific settings:
- `fish/.config/fish/config.fish` - Main config that sources OS-specific files
- `fish/.config/fish/config-osx.fish` - macOS-specific settings
- `fish/.config/fish/config-linux.fish` - Linux-specific settings
- `fish/.config/fish/config-local.fish` - Local machine overrides (not tracked in git)

The config detects the OS with `uname` and sources the appropriate file at runtime.

### Neovim Configuration

Based on LazyVim starter template. Structure:
- `nvim/.config/nvim/init.lua` - Entry point, sets transparent background
- `nvim/.config/nvim/lua/config/` - Core LazyVim configuration
- `nvim/.config/nvim/lua/plugins/` - Custom plugin configurations

Key plugins customized: neogit, lazygit, neo-tree, nord theme, vim-tmux-navigator, nvim-sops

## Common Commands

### Initial Setup

```bash
# Install Ansible dependencies
make install

# Run complete Ansible playbook for system setup
ansible-playbook -i "localhost," -c local -K playbooks/all.yml
```

The Ansible playbook installs system packages via dnf (git, git-extras, difftastic, tmux, vim, etc.)

### Managing Configurations with Stow

```bash
# Setup all configurations
make setup-configs

# Setup individual packages
make setup-fish      # Install fish config
make setup-nvim      # Install neovim config
make setup-zsh       # Install zsh config
make setup-kitty     # Install kitty config
make setup-hypr      # Install Hyprland config
make setup-i3        # Install i3 config
```

### Backup Commands

```bash
# Backup before installing (renames existing with timestamp)
make prepare-fish
make prepare-nvim
make prepare-zsh
make prepare-kitty
make prepare-hypr
make prepare-i3

# Create backup copies (keeps original)
make backup-fish
make backup-nvim
# ... etc
```

### Working with Stow Manually

```bash
# Install a package
stow -t ~ <package-name>

# Remove a package's symlinks
stow -D -t ~ <package-name>

# Reinstall (useful after changes)
stow -R -t ~ <package-name>

# Verbose output
stow -v -t ~ <package-name>
```

## Configuration Details

### Fish Shell Setup

- Uses vi key bindings with insert mode default
- Integrates: starship (prompt), zoxide (cd replacement), kubectl with kubecolor
- Aliases configured for eza (modern ls replacement)
- MANPAGER set to use nvim for reading man pages
- Sources platform-specific configs and optional local config

### Git Configuration

Located in `git/.config/git/config`. Uses extensive aliases for common workflows:
- Staging: `a`, `aa`
- Branching: `br`, `branch-name`, `branch-diff`, `branch-files`
- Committing: `c`, `cm`, `cam`, `amend`, `amend-all`
- Checkout: `co`, `cb`

Uses difftastic for diffs (installed via Ansible).

### Homebrew Integration

Both fish and zsh configs auto-detect and initialize Homebrew from:
- `/opt/homebrew` (macOS Apple Silicon)
- `/home/linuxbrew/.linuxbrew` (Linux)

## Development Workflow

### Adding New Configurations

1. Create new directory: `<tool>/.config/<tool>/`
2. Add configuration files
3. Add Makefile targets for setup/prepare/backup
4. Test with `stow -v -t ~ <tool>`

### Modifying Existing Configs

Since Stow creates symlinks, edit files directly in this repo or in your home directory - they're the same file. Changes are immediately active and ready to commit.

### Testing Changes

```bash
# Test stow operations without actually creating symlinks
stow -n -v -t ~ <package>
```

## Important Notes

- The `config-local.fish` pattern allows machine-specific overrides without committing secrets
- Neovim uses transparent background - terminal must support transparency
- Kubernetes configs use kubecolor wrapper for colored kubectl output
- The repo supports both Linux (Fedora/dnf-based) and macOS

