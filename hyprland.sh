#!/bin/sh
set -e

git clone https://aur.archlinux.org/paru
cd paru
makepkg -si --noconfirm
cd ..
sudo rm -r paru

paru -Syu --noconfirm \
 hyprland \
 swaybg \
 waybar-hyprland-git \
 dunst \
 grimshot \
 ly \
 polkit-gnome gnome-keyring \
 alacritty fish fisher nerd-fonts-jetbrains-mono \
 firefox \
 webcord \
 pavucontrol \
 nautilus \
 visual-studio-code-bin

sudo systemctl enable ly

chsh -s /usr/bin/fish

fish -c "fisher install IlanCosman/tide"

cp -r config/* ~/.config

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
echo 'gtk-application-prefer-dark-theme=1' | sudo tee -a /usr/share/gtk-3.0/settings.ini

git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'
