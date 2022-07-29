#!/bin/bash
set -e

source helper/yay.sh

yay -Syu --noconfirm \
  hyprland-git hyprpaper-git \
  wofi \
  sddm  \
  adw-gtk3 \
  alacritty zsh oh-my-zsh-git fzf zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k \
  grim slurp \
  firefox \
  webcord \
  nautilus \
  pavucontrol \
  visual-studio-code-bin gnome-keyring

systemctl enable sddm

chsh -s /usr/bin/zsh

cp config/.zshrc ~

mkdir ~/.config/alacritty
cp config/alacritty.yml ~/.config/alacritty

mkdir ~/.config/hypr
cp config/hyprland.conf ~/.config/hypr
cp config/hyprpaper.conf ~/.config/hypr
cp config/wallpaper.png ~/.config/hypr

rm /usr/share/gtk-3.0/settings.ini
cp config/settings.ini /usr/share/gtk-3.0
