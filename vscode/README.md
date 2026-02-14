# VS Code Settings

This directory contains VS Code global settings that are managed with GNU Stow.

## What's Managed

Currently, this directory manages:
- `settings.json` - Global VS Code settings

The prepare/backup targets handle the entire `~/Library/Application Support/Code/User/` 
directory to ensure stow can properly create symlinks without conflicts.

## Setup

Before running the setup, backup your existing VS Code User directory:

```bash
make backup-vscode
```

Then move your existing User directory out of the way:

```bash
make prepare-vscode
```

Finally, create the symlinks:

```bash
make setup-vscode
```

## Manual Setup

If you prefer to do it manually:

1. Backup existing User directory:
   ```bash
   cp -pr ~/Library/Application\ Support/Code/User ~/Library/Application\ Support/Code/User.bak
   ```

2. Remove the original:
   ```bash
   rm -rf ~/Library/Application\ Support/Code/User
   ```

3. Create symlink with stow:
   ```bash
   stow -v -t ~ vscode
   ```

## Updating Settings

After making changes to your VS Code settings, they're automatically saved to the 
dotfiles since the directory is symlinked. Just commit the changes:

```bash
cd ~/.dotfiles/dotfiles
git add vscode/
git commit -m "Update VS Code settings"
git push
```

## Adding More VS Code Files

To add more files (like keybindings.json, snippets, etc.):

1. Copy the file into the dotfiles:
   ```bash
   cp ~/Library/Application\ Support/Code/User/keybindings.json \
      vscode/Library/Application\ Support/Code/User/keybindings.json
   ```

2. Commit the changes:
   ```bash
   git add vscode/
   git commit -m "Add VS Code keybindings"
   ```

Since the directory is already symlinked, the new file will automatically be available.
