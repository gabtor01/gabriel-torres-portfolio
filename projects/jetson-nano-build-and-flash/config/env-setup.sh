#!/usr/bin/env bash
# --------------------------------------------------------------------------------
#                          - Enviroment Variables Setup -
# Description:
#
# Define and export $L4T variable to facilitate navigation, $TOOLCHAIN_PREFIX to 
# facilitate the compilation make and sets the output dirs.
# --------------------------------------------------------------------------------

# Base L4T path
export L4T=${L4T:-/home/nvidia/nvidia/nvidia_sdk/JetPack_4.6.6_Linux_JETSON_NANO_TARGETS/Linux_for_Tegra}

# Toolchain path
export TOOLCHAIN_PREFIX=${TOOLCHAIN_PREFIX:-/home/nvidia/gcc-linaro-7.3.1-2018.05-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-}

# Kernel output directories
export TEGRA_KERNEL_OUT=$L4T/sources/build
export TEGRA_MODULES_OUT=$L4T/sources/modules