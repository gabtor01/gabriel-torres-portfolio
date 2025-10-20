#!/usr/bin/env bash
# Source the environment variables
source ../config/env-setup.sh
# Alternatively they can be added to bashrc instead of using source in every build with the command:
# grep -qxF "source $HOME/config/env-setup.sh" ~/.bashrc || echo "source $HOME/config/env-setup.sh" >> ~/.bashrc

mkdir -p "$TEGRA_KERNEL_OUT" "$TEGRA_MODULES_OUT"
cd "$L4T/sources"
# defconfig
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} tegra_defconfig || { echo "defconfig failed"; exit 1; }
# build kernel
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) Image || { echo "kernel build failed"; exit 1; }
# build modules
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) modules || { echo "modules build failed"; exit 1; }
# build dtbs
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) dtbs || { echo "device tree build failed"; exit 1; }
# install modules
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra INSTALL_MOD_PATH=$TEGRA_MODULES_OUT modules_install || { echo "installation of modules failed"; exit 1; }