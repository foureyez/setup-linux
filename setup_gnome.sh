sudo pacman -Syu gdm
sudo pacman -Syu xorg-xwayland xorg-xlsclients glfw-wayland
sudo pacman -Syu gnome gnome-tweaks gnome-nettool gnome-multi-writer adwaita-icon-theme xdg-user-dirs-gtk fwupd arc-gtk-theme networkmanager
sudo systemctl enable gdm
sudo systemctl enable NetworkManager
