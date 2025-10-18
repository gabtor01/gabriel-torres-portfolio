#!/usr/bin/env bash
# Assume $L4T is set and we are inside the container
L4T=/home/nvidia/nvidia/nvidia_sdk/JetPack_4.6.4_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra
cd $L4T
# create default user if it does not exist
sudo apt update && sudo apt install -y whiptail
sudo ./tools/l4t_create_default_user.sh -u "user" -p "password"
# flash (verify mmc device name)
sudo ./flash.sh jetson-nano-4gb-devkit mmcblk0p1