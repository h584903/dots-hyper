#!/bin/bash

cat << "EOF"

Opening of installing script works
whoop, whoop,

EOF

#-----------------------------------#
# Importing variables and functions #
#-----------------------------------#
source global_fn.sh
if [ $? -ne 0 ] ; then
    echo "Error: unable to source global_fn.sh, please execute from $(dirname $(realpath $0))..."
    exit 1
fi
# $? er da exitcoden til scriptet, hvis det er noe annet en 0 så har da scriptet ikke fullført på riktig måte

#----------------------------------------#
# Installerer packagene i listen oppgitt #
#----------------------------------------#
./install_pkg.sh install_pkg.lst
rm install_pkg.lst