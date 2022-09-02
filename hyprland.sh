#!/bin/sh
set -e

sudo pacman -Syu --noconfirm
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ..
sudo rm -r yay

yay -Syu --noconfirm \
 hyprland \
 hyprpaper-git \
 waybar-hyprland-git \
 wofi \
 dunst \
 grim slurp \
 sddm sddm-sugar-candy-git \
 polkit-gnome gnome-keyring \
 alacritty fish fisher nerd-fonts-jetbrains-mono \
 dash dashbinsh \
 brave-bin \
 webcord \
 pavucontrol \
 nautilus \
 visual-studio-code-bin \
#   sof-firmware `# for getting sound to work when no sound cards are detected`

sudo systemctl enable sddm

chsh -s /usr/bin/fish

fish -c "fisher install IlanCosman/tide"

sudo sed -i "/Current=/c\Current=sugar-candy" /usr/lib/sddm/sddm.conf.d/default.conf

cp -r config/* ~/.config

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
echo 'gtk-application-prefer-dark-theme=1' | sudo tee -a /usr/share/gtk-3.0/settings.ini

git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'
