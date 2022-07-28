#!/bin/bash
set -e

git config --global user.name 'Alistair Keiller'
git config --global user.email 'alistair@keiller.net'

source helper/multilib.sh

source helper/yay.sh

source helper/alacritty.sh

source helper/lightdm.sh

yay -Syu --noconfirm hyprland-git
