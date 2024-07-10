#!/usr/bin/env bash

EXTRA_APT_PACKAGES_TO_INSTALL="tree, stow, build-essential, zip, unzip"

install_extras() {
	sudo apt-get update
	sudo apt-get upgrade -y
	sudo apt-get install -y \
		${EXTRA_APT_PACKAGES_TO_INSTALL}
}

install_updates() {
	sudo apt-get update
	sudo apt-get upgrade -y
}

update_git() {
	sudo add-apt-repository -y ppa:git-core/ppa
	sudo apt-get update
	sudo apt-get install git -y
}

install_node() {
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	source ~/.bashrc
	nvm install node
	echo "Running Node"
	node -v
	echo "Running NPM"
	npm -v
}

install_go() {
	wget https://dl.google.com/go/go1.22.0.linux-amd64.tar.gz
	sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
	echo "Installed GO successfully"
	go version
}

install_fzf() {
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
}

install_zsh() {
	sudo apt install zsh -y
	zsh --version
	# https://ohmyz.sh/
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# https://github.com/romkatv/powerlevel10k
	git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
	# https://github.com/zsh-users/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	# https://github.com/zsh-users/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	# https://github.com/Pilaton/OhMyZsh-full-autoupdate
	git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
}

main() {
	echo "Updating installed vanilla packages..."
	install_updates | indent
	echo "Updating git"
	update_git | indent
	echo "Installing extra packages"
	install_extras | indent
	echo "Install Node"
	install_node | indent
	echo "Install GO"
	install_go | indent
	echo "Install FZF"
	install_fzf | indent
	echo "Installing ZSH"
	install_zsh
}

main
