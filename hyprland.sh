#!/bin/bash
set -e

source helper/yay.sh

yay -Syu --noconfirm \
hyprland-git \
sddm \
alacritty zsh oh-my-zsh-git fzf zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k

systemctl enable sddm

chsh -s /usr/bin/zsh

cp config/.zshrc ~

mkdir ~/.config/alacritty
cp config/alacritty.yml ~/.config/alacritty

mkdir ~/.config/hypr
cp config/hyprland.conf ~/.config/hypr

