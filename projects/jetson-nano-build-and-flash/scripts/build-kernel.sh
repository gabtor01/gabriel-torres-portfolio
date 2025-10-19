#!/usr/bin/env bash
# Variables (edit according to the environment)
export L4T=${L4T:-/home/nvidia/nvidia/nvidia_sdk/JetPack_4.6.6_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra}
export TOOLCHAIN_PREFIX=${TOOLCHAIN_PREFIX:-/home/nvidia/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-}
export TEGRA_KERNEL_OUT=$L4T/sources/build
export TEGRA_MODULES_OUT=$L4T/sources/modules
mkdir -p "$TEGRA_KERNEL_OUT" "$TEGRA_MODULES_OUT"
cd "$L4T/sources"
# defconfig
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} tegra_defconfig
# build kernel
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) Image
# build modules
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) modules
# build dtbs
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra CROSS_COMPILE=${TOOLCHAIN_PREFIX} -j$(nproc) dtbs
# install modules
make -C kernel/kernel-4.9/ ARCH=arm64 O="$TEGRA_KERNEL_OUT" LOCALVERSION=-tegra INSTALL_MOD_PATH=$TEGRA_MODULES_OUT modules_install