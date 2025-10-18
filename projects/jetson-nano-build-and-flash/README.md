# Jetson Nano Build and Flash
Bring-up and kernel rebuild process for the **NVIDIA Jetson Nano 4GB Developer Kit** using **SDK Manager**, **Docker** and **cross-compilation** with the Linaro GCC toolchain.
## Overview
- Flashing Jetson Nano OS via SDK Manager (Docker container).
- Cross-compiling the Linux 4.9-tegra kernel using Linaro GCC 7.3.1.
- Building and installing kernel modules and device trees.
- Serial debugging over UART.
- Validation through `uname -a`, `lsusb`, and `dmesg`.
## Technologies
| Category | Tools / Components |
|-----------|--------------------|
| Hardware | Jetson Nano 4GB Dev Kit |
| OS / Kernel | Linux for Tegra (L4T 32.7.3) |
| Toolchain | GCC Linaro 7.3.1 aarch64-linux-gnu |
| SDK / Flash | NVIDIA SDK Manager (Docker) |
| Utilities | Bash, Docker, Minicom (UART) |
## Key Commands
**Flash OS:** `sdkmanager --cli install --logintype devzone --product Jetson --version 4.6.6 --targetos Linux --target JETSON_NANO_TARGETS --flash all --license accept`  
**Build Kernel:** `make ARCH=arm64 O=build LOCALVERSION=-tegra CROSS_COMPILE=aarch64-linux-gnu- tegra_defconfig && make ARCH=arm64 O=build LOCALVERSION=-tegra CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) Image modules dtbs`  
**Flash Custom Kernel:** `sudo ./flash.sh jetson-nano-4gb-devkit mmcblk0p1`
## Structure
`jetson-nano-build-and-flash/`  
├── `scripts/` – Flashing and build automation  
├── `docs/` – Logs, UART captures, results  
├── `configs/` – Environment and serial configs  
└── `README.md`
## Validation
| Check | Command | Output |
|-------|----------|---------|
| Kernel version | `uname -a` | `Linux tegra 4.9.337-tegra ...` |
| Device detection | `lsusb` | NVIDIA Corp. APX (recovery) |
| Driver status | `dmesg` | `grep 219` | IMX219 camera module disabled |
## Tags
`embedded-linux` • `jetson-nano` • `kernel-build` • `sdkmanager` • `cross-compilation` • `uart` • `docker`  
**Status:** In Progress
