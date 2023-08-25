#!/bin/sh
install_list="${1:-install_pkg.lst}"
#----------------------------#
# First install Nvidia stuff #
#----------------------------#

pacman -S nvidia-dkms --noconfirm
pacman -S linux-headers --noconfirm
#-----------------------#
# Setting up grub fixes #
#-----------------------#

sed -i 's/LINUX_DEFAULT=.*$/LINUX_DEFAULT=nvidia_drm.modeset=1/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

sed -i 's/MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm /' /etc/mkinitcpio.conf
# Installing some bugfixes for nvidia drivers

pacman -S qt5-wayland --noconfirm
pacman -S qt5ct --noconfirm
pacman -S libva --noconfirm

#---------------------#
# Installing packages #
#---------------------#
while read pkg; do
    echo "Installing: ${pkg}"
    pacman -S ${pkg} --noconfirm
done < $install_list
