#!/bin/bash

# ZSH setup
sudo apt-get install zsh
curl -L git.io/antigen > antigen.zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

cp .zshrc ~

chsh -s $(which zsh)

