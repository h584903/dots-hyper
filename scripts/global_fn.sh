#!/bin/bash
#--------------------------------#
# Global Functions and variables #
#                                #
#--------------------------------#

set -e # This instructs bash to exit if any command has a non zero exit status

CloneDir=`dirname $(dirname $(realpath $0))`

chk_aurh()
{
    if pkg_installed yay
    then
        aurhlpr="yay"
    elif pkg_installed paru
    then
        aurhlpr="paru"
    fi
}

# Checks if nvidia is installed by grepping the specs and finding the line with nvidia
nvidia_detect()
{
    if [ `lspci -k | grep -A 2 -E "(VGA|3D)" | grep -i nvidia | wc -l` -gt 0 ]
    then
        #echo "nvidia card detected..."
        return 0
    else
        #echo "nvidia card not detected..."
        return 1
    fi
}