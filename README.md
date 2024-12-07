# Installation

## Make backup of current config

```shell
cd /path/to/your/dotfiles
# Use Make prepare commands
make prepare-nvim
make prepare-zsh
make prepare-fish
make prepare-i3
```

## Install

```shell
git clone https://github.com/samueljon/dotfiles.git /path/to/your/dotfiles
cd /path/to/your/dotfiles

# setup all configs

make setup

# or as seperate installs

make setup-nvim
make setup-zsh
make setup-fish
make setup-i3
```

## Configurations

### vim

- `,d` brings up / closes down [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
- `<Ctrl-P>` brings up [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a project file filter for easily opening specific files
- `,b` restricts ctrlp.vim to open buffers
- `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
- `,"` surround word with "
- `,'` surround word with '
- `gcc` toggles current line comment
- `gc` toggles visual selection comment lines
- `,<space>` turn off highlighting until the next search
- `,l` Toggle between numbers and relative numbers
- `,1` Toggle number / nonumber
- `<Ctrl-hjkl>` move between windows, shorthand for `<C-w> hjkl`
- `<Shift-Tab>` move between buffers
- `,,` Open last buffer

### **i3 Window Manager Keyboard Shortcuts**

- `$mod` refers to your modifier key, often set to `Mod4` (the Super/Windows key).

---

#### **1. General Navigation**

In this config I'm using the "windows logo" key as the modifier.

These shortcuts help you move between windows, workspaces, and navigate efficiently:

- **`$mod+Left`**: Focus the window to the left.
- **`$mod+Right`**: Focus the window to the right.
- **`$mod+Up`**: Focus the window above.
- **`$mod+Down`**: Focus the window below.
- **`$mod+1` - `$mod+9`**: Switch to workspace 1 through 9.

---

#### **2. Window Management**

Manage the layout, size, and behavior of your windows:

- **`$mod+Enter`**: Open a new terminal.
- **`$mod+Shift+Left`**: Move the focused window to the left workspace.
- **`$mod+Shift+Right`**: Move the focused window to the right workspace.
- **`$mod+h`**: Split the container horizontally.
- **`$mod+v`**: Split the container vertically.
- **`$mod+f`**: Toggle fullscreen mode for the focused window.
- **`$mod+Shift+Space`**: Toggle floating mode for the focused window.
- **`$mod+q`**: Close the focused window.

---

#### **3. Workspace Management**

Create, move, and organize workspaces:

- **`$mod+Shift+1` - `$mod+Shift+9`**: Move the focused window to workspace 1 through 9.
- **`$mod+Tab`**: Cycle through workspaces.

---

#### **4. Layout Adjustment**

Modify the appearance and behavior of windows within containers:

- **`$mod+e`**: Switch to stacking layout.
- **`$mod+s`**: Switch to tabbed layout.
- **`$mod+w`**: Switch to the default tiling layout.
- **`$mod+Shift+r`**: Reload the i3 configuration file.

---

#### **5. System Controls**

Control system-level functions like locking, restarting, or exiting:

- **`$mod+Shift+e`**: Exit i3 window manager.
- **`$mod+Shift+r`**: Restart i3.
- **`$mod+l`**: Lock the screen (requires a screen-locking utility).

---

#### **6. Application Launching**

Quickly open applications and tools:

- **`$mod+d`**: Launch the application launcher (`dmenu` or equivalent).
- **`$mod+Shift+d`**: Launch a secondary menu or alternative application launcher.

---

#### **7. Floating Windows**

Toggle floating mode for special cases:

- **`$mod+Shift+Space`**: Toggle floating mode on/off for the current window.
- **`$mod+Right/Left` (in floating mode)**: Resize the floating window.

---

#### **8. Miscellaneous**

Additional shortcuts for usability:

- **`$mod+Shift+c`**: Reload configuration to apply changes without restarting.
- **`$mod+p`**: Screenshot the current screen (requires `scrot` or similar utility).

---
