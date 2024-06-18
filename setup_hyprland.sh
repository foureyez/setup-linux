#!/bin/bash

. /etc/os-release
case $ID in
  ubuntu) 
    ;;

  arch) 
    echo "Installing arch hyprland"
    yay -Sy hyprland-git
    ;;

  *) echo "This is an unknown distribution."
    ;;
esac


sudo pacman -Sy pipewire wireplumber swaync waybar
