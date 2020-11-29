#!/bin/bash
su vagrant
sudo pacman -Sy
sudo pacman -S --noconfirm git zsh fzf base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
chmod -R 777 ./
yes | makepkg -sir
yes | yay 
yes | yay -S --answerclean N --answerdiff N --answeredit N --answerupgrade N antibody direnv github-cli zsh-pure-prompt neovim oh-my-zsh-git
cd ..
mkdir applications
mkdir .secrets
git clone --bare https://github.com/barrett370/dotfiles .dotfiles
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
sudo chsh $USER -s $(which zsh)



