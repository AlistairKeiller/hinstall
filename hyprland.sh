#!/bin/bash
set -e

git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'

source helper/yay.sh

yay -Syu --noconfirm \
hyprland-git \
sddm \
alacritty zsh oh-my-zsh-git fzf zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k

systemctl enable sddm

cp config/.zshrc ~
mkdir -p ~/.config/alacritty/
cp config/alacritty.yml ~/.config/alacritty

chsh -s /usr/bin/zsh
