homeback = "${HOME}/home-backup"

base: ## base programs
	echo "base programs"
	sudo pacman -S --noconfirm --needed vim tree tmux screen git jq lsof
	sudo pacman -S --noconfirm --needed htop powertop iperf3 
	sudo pacman -S --noconfirm --needed zsh go fzf ncdu tig aria2 fdupes 
	sudo pacman -S --noconfirm --needed ffmpeg 
	echo -e 'ZDOTDIR=$$HOME/.config/zsh\n. $$ZDOTDIR/.zshenv' > ~/.zshenv
	mkdir -p ${HOME}/.local/share/zsh
	mkdir -p ${HOME}/.local/share/vim
	mkdir -p ${HOME}/.local/share/tig

clean: ## cleanup homedir
	mkdir -p "${homeback}"
	for fname in .zshrc .zhistory .zcompdump .bash_history .bash_logout .bash_profile .bashrc .lesshst ; do \
	  mv "${HOME}/$$fname" "${homeback}" 2>/dev/null || true ; \
        done

dev: ## dev tools
	sudo pacman -S --needed autoconf automake hub cmake gcc strace
	yay -S --needed perf-tools

virt: ## virtualization
	pacman -S --needed docker docker-compose
	sudo groupadd docker
	sudo usermod -aG docker $USER

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
  | sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
