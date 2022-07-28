#!/bin/bash
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
