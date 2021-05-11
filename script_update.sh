#!/bin/bash
sudo apt update &&
sudo apt upgrade -y &&
sudo apt clean &&
sudo apt autoclean &&
sudo apt autoremove -y &&
flatpak update -y &&
flatpak uninstall -y --unused&&
snap refresh
echo "Tudo atualizado."
