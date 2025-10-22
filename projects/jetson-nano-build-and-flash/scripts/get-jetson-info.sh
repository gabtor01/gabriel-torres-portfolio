#!/bin/bash
# --------------------------------------------------------------------------------
#                  - Identify Jetson Nano DTB and Kernel Build) -
# Description:
#
# Scans /boot for DTBs, selects the one matching the Jetson Nano Developer Kit 
# model via dtc, and prints the DTB filename, model, and kernel build date.
# --------------------------------------------------------------------------------

# Expected board model (according to the jetson 4 GB dev kit documentation)
TARGET_MODEL="NVIDIA Jetson Nano Developer Kit" 

# Initialize variables
DTB=""
MODEL=""

# Loop through all DTBs in /boot
for i in /boot/*.dtb; do
    # Extract the model from the DTB (suppress warnings)
    m=$(sudo dtc -I dtb -O dts "$i" 2>/dev/null | grep -Po '^\s*model\s*=\s*"\K[^"]+')

    
    # If it matches the expected model, select it
    if [[ "$m" == "$TARGET_MODEL" ]]; then
        DTB="$i"
        MODEL="$m"
        break
    fi
done

# If no matching DTB is found
if [[ -z "$DTB" ]]; then
    echo "No DTB found matching model: $TARGET_MODEL"
    exit 1
fi

# Get the kernel build date
KERNEL=$(uname -a | sed -E 's/.*#.*PREEMPT ([A-Za-z]+ .* [0-9]{4}).*/\1/')

# Print results
echo "DTB: $(basename "$DTB")"
echo "Model: $MODEL"
echo "Kernel build: $KERNEL"
