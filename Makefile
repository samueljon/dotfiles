install:
	ansible-galaxy collection install community.general
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

# zsh
setup-zsh:
	stow -t ~ zsh

prepare-zsh:
	mv ~/.config/zsh ~/.config/zsh.bak.$(date +%Y%m%d%H%M%S)

backup-zsh:
	cp -pr ~/.config/zsh ~/.config/zsh.bak.$(date +%Y%m%d%H%M%S)

# Neovim
setup-nvim:
	stow -t ~ nvim

prepare-nvim:
	mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)

backup-nvim:
	cp -pr ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)

# Fish shell
setup-fish:
	stow -t ~ fish

prepare-fish:
	mv ~/.config/fish ~/.config/fish.bak.$(date +%Y%m%d%H%M%S)

backup-fish:
	cp -pr ~/.config/fish ~/.config/fish.bak.$(date +%Y%m%d%H%M%S)

# kitty shell
setup-kitty:
	stow -v -t ~ kitty

prepare-kitty:
	mv ~/.config/kitty ~/.config/kitty.bak.$(date +%Y%m%d%H%M%S)

backup-kitty:
	cp -pr ~/.config/kitty ~/.config/kitty.bak.$(date +%Y%m%d%H%M%S)

# Hyprland
setup-hypr:
	stow -v -t ~ hypr

prepare-hypr:
	mv ~/.config/hypr ~/.config/hypr.bak.$(date +%Y%m%d%H%M%S)
	mv ~/.config/waybar ~/.config/waybar.bak.$(date +%Y%m%d%H%M%S)

backup-hypr:
	cp -pr ~/.config/hypr ~/.config/hypr.bak.$(date +%Y%m%d%H%M%S)
	cp -pr ~/.config/waybar ~/.config/waybar.bak.$(date +%Y%m%d%H%M%S)

# i3 Window Manager
setup-i3:
	stow -t ~ i3

prepare-i3:
	mv ~/.config/i3 ~/.config/i3.bak.$(date +%Y%m%d%H%M%S)
	mv ~/.config/i3blocks ~/.config/i3blocks.bak.$(date +%Y%m%d%H%M%S)
	mv ~/.config/i3status ~/.config/i3status.bak.$(date +%Y%m%d%H%M%S)

backup-i3:
	cp -pr ~/.config/i3 ~/.config/i3.bak.$(date +%Y%m%d%H%M%S)
	cp -pr ~/.config/i3blocks ~/.config/i3blocks.bak.$(date +%Y%m%d%H%M%S)
	cp -pr ~/.config/i3status ~/.config/i3status.bak.$(date +%Y%m%d%H%M%S)

# Run all config setups 
setup-configs:
	$(MAKE) setup-zsh
	$(MAKE) setup-fish
	$(MAKE) setup-nvim
	$(MAKE) setup-kitty

.PHONY: install stow setup-stow setup-nvim setup-fish setup-configs setup-i3

