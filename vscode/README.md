# VS Code Settings

This directory contains VS Code global settings that are managed with GNU Stow.

## Setup

Before running the setup, backup your existing settings:

```bash
make backup-vscode
```

Then move your existing settings out of the way:

```bash
make prepare-vscode
```

Finally, create the symlinks:

```bash
make setup-vscode
```

## Manual Setup

If you prefer to do it manually:

1. Backup existing settings:
   ```bash
   cp ~/Library/Application\ Support/Code/User/settings.json ~/Library/Application\ Support/Code/User/settings.json.bak
   ```

2. Remove the original:
   ```bash
   rm ~/Library/Application\ Support/Code/User/settings.json
   ```

3. Create symlink with stow:
   ```bash
   stow -v -t ~ vscode
   ```

## Updating Settings

After making changes to your VS Code settings, copy them back to the dotfiles:

```bash
cp ~/Library/Application\ Support/Code/User/settings.json vscode/Library/Application\ Support/Code/User/settings.json
```

Then commit the changes to git.
