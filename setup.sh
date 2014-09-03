#!/bin/bash

cd ~/.dotfiles && git pull --recurse-submodules

# link dotfiles

ln -s ~/.dotfiles/ackrc ~/.ackrc
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/gitignore ~/.gitignore
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/z ~/.z
ln -s ~/.dotfiles/ruby-version ~/.ruby-version

# set shell to zsh
chsh -s /bin/zsh
