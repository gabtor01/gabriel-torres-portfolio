#!/usr/bin/env bash
# --------------------------------------------------------------------------------
#                   - Backup, Kernel Update and Flash -
# Description:
#
# Backup kernel and rootfs/lib, copy Image, DTB and modules to rootfs, and flash 
# the card in recovery mode.
# --------------------------------------------------------------------------------

# backups
cd "$L4T"
cp -rf kernel kernel_backup
cp -rf rootfs/lib rootfs_lib_backup
# Copy Image and dtb
cp -rf "$TEGRA_KERNEL_OUT"/arch/arm64/boot/Image kernel/
cp -rf "$TEGRA_KERNEL_OUT"/arch/arm64/boot/dts/* kernel/dtb/
# Copy modules to rootfs
sudo cp -arfv "$TEGRA_MODULES_OUT"/lib rootfs/
# flash (put card in recovery before)
sudo ./flash.sh jetson-nano-devkit mmcblk0p1