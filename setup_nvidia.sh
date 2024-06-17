# Source: https://github.com/korvahannu/arch-nvidia-drivers-installation-guide
sudo pacman -S base-devel linux-headers git nano --needed

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

sudo nano /etc/pacman.conf
#Uncomment the following lines  
#    [multilib]
#    Include = /etc/pacman.d/mirrorlist
#

yay -Syu
yay -S nvidia-dkms nvidia--utils lib32-nvidia-utils
yay -S nvidia-settings

# Set kernel parameters
# Systemd-boot conf /boot/loader/entries/2024-06-17_19-17-10_linux.conf
# Append nvidia_drm.modeset=1 nvidia_drm.fbdev=1 to options


# Set early loading modules
# File /etc/mkinitcpio.conf
# Update this line:  MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
# On the HOOKS=() line, find the word kms inside the parenthesis and remove it

# Regenerate the initramfs
sudo mkinitcpio -P

# Apply the nvidia fixed for GDM on wayland
# Source: https://wiki.archlinux.org/title/GDM
# As of GDM 42 and NVIDIA driver 510, GDM defaults to Wayland. For older NVIDIA drivers (in between version 470 and 510), GDM has chipset-dependent udev rules to use Xorg rather than Wayland. 
# To force-enable Wayland, override these rules by creating the following symlink: 
ln -s /dev/null /etc/udev/rules.d/61-gdm.rules

# Notice that GDM on Wayland will no longer work once /usr/lib/gdm-disable-wayland has run. 
# This is because WaylandEnable=false has been written into /run/gdm/custom.conf, which overrides /etc/gdm/custom.conf. 
# To fix the situation without a reboot, remove /run/gdm/custom.conf and then restart GDM.

