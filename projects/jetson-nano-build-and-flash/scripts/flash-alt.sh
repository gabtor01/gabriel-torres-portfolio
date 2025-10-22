#!/usr/bin/env bash
# --------------------------------------------------------------------------------
#                   - Flash fallback and default user setup -
# Description:
#
# Installs prerequisites, preconfigures a default user in the image, and flashes 
# the board to the specified storage device if the standard SDK Manager flow fails.
# --------------------------------------------------------------------------------

# create default user if it does not exist
sudo apt update && sudo apt install -y whiptail
sudo ./tools/l4t_create_default_user.sh -u "user" -p "password"
# flash (verify mmc device name)
sudo ./flash.sh jetson-nano-devkit mmcblk0p1