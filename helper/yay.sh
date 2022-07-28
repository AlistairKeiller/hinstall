#!/bin/bash
git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ..
sudo rm -r yay
