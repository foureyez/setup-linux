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


# Audio support
sudo pacman -Sy pipewire wireplumber 

# Notifications Manager
sudo pacman -Sy swaync 

# Status Bar
sudo pacman -Sy waybar 

# Wallpaper manager
sudo pacman -Sy hyprpaper

# Idle daemon
sudo pacman -Sy hypridle

# Clipboard manager for wayland
sudo pacman -Sy wl-clipboard 

# App launcher
yay -S bemenu

#An XDG Desktop Portal (later called XDP) is a program that lets other applications communicate swiftly with the compositor through D-Bus.
#It’s used for things like opening file pickers or screen sharing.
yay -Sy xdg-desktop-portal-hyprland-git

# Authentication agents are the things that pop up a window asking you for a password whenever an app wants to elevate its privileges.
# You can autostart it with exec-once=/usr/lib/polkit-kde-authentication-agent-1
yay -S polkit-kde-agent

yay -S qt5-wayland qt6-wayland

# Logout UI menu
yay -S wlogout

# Screen lock for hyprland 
yay -S hyprlock-git
