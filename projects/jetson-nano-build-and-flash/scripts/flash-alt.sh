#!/usr/bin/env bash
# In case the SDK manager flash fails
# create default user if it does not exist
sudo apt update && sudo apt install -y whiptail
sudo ./tools/l4t_create_default_user.sh -u "user" -p "password"
# flash (verify mmc device name)
sudo ./flash.sh jetson-nano-devkit mmcblk0p1