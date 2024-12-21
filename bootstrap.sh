#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install tree -y
sudo apt-get install stow -y
sudo apt-get install build-essential -y
sudo apt-get install zip -y
sudo apt-get install unzip -y

# Update git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git -y

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install node
echo "Running Node"
node -v
echo "Running NPM"
npm -v

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all --no-bash --no-fish --no-zsh

# Install go
brew install go

# Install zsh
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
