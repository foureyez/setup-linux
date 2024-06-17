# Install sbctl 
sudo pacman -Sy sbctl

sbctl status
# You should see that sbctl is not installed and secure boot is disabled.
# Then create your custom secure boot keys
sbctl create-keys
# Keys are store in 
# /usr/share/secureboot/

# Put the firmware in setup mode
# SecureBoot should be disabled and type should be custom
sbctl enroll-keys -m

# Check which all images need signing 
sbctl verify

# Signed the unsigned images from earlier output
sbctl sign -s /boot/vmlinuz-linux
sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI

# Reboot and enable secure boot 
# Note: didn't work with GRUB, only with systemd-boot
