#!/bin/sh
install_list="${1:-install_pkg.lst}"

while read pkg; do
    echo "Installing: ${pkg}"
    pacman -S ${pkg} --noconfirm
done < $install_list