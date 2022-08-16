#!/bin/sh
set -e

sudo pacman -Syu --noconfirm
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si --noconfirm
cd ..
sudo rm -r yay

yay -Syu --noconfirm \
  hyprland-git \
  hyprpaper-git \
  waybar-hyprland-git \
  wofi \
  dunst \
  grim slurp \
  sddm sddm-sugar-candy-git \
  polkit-gnome gnome-keyring \
  alacritty zsh zsh-autosuggestions zsh-syntax-highlighting zsh-completions zsh-theme-powerlevel10k-git ttf-meslo-nerd-font-powerlevel10k \
  dash dashbinsh \
  firefox \
  webcord \
  nautilus \
  pavucontrol \
  visual-studio-code-bin \
  virt-manager qemu-desktop libvirt edk2-ovmf dnsmasq `# https://wiki.archlinux.org/title/Virt-Manager` \
#   sof-firmware `# for getting sound to work when no sound cards are detected`

sudo systemctl enable sddm libvirtd

chsh -s /usr/bin/zsh

sudo sed -i "/Current=/c\Current=sugar-candy" /usr/lib/sddm/sddm.conf.d/default.conf

sudo sed -i '/#unix_sock_group = "libvirt"/c\unix_sock_group = "libvirt"' /etc/libvirt/libvirtd.conf
sudo sed -i '/#unix_sock_rw_perms = "0770"/c\unix_sock_rw_perms = "0770"' /etc/libvirt/libvirtd.conf

sudo sed -i "/#user = \"libvirt-qemu\"/c\user = \"$(whoami)\"" /etc/libvirt/qemu.conf
sudo sed -i "/#group = \"libvirt-qemu\"/c\group = \"$(whoami)\"" /etc/libvirt/qemu.conf

cp config/.zshrc ~
cp -r config/alacritty ~/.config
cp -r config/hypr ~/.config
cp -r config/waybar ~/.config
cp -r config/dunst ~/.config

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
echo 'gtk-application-prefer-dark-theme=1' | sudo tee -a /usr/share/gtk-3.0/settings.ini

git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'
