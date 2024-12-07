install:
	ansible-galaxy collection install community.general
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

stow:
	stow -t ${HOME} zsh nvim tmux fish

setup-zsh:
	stow -t ~ zsh

setup-nvim:
	stow -t ~ nvim

setup-fish:
	stow -t ~ fish

setup-configs:
	$(MAKE) setup-zsh
	$(MAKE) setup-fish
	$(MAKE) setup-nvim

setup-i3:
	stow -t ~ i3

.PHONY: install stow setup-stow setup-nvim setup-fish setup-configs setup-i3

