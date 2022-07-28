#!/bin/bash
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syu --noconfirm
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ..
sudo rm -r yay
