#!/bin/bash
# --------------------------------------------------------------------------------
#                          - Serial Communication Setup -
# Description:
#
# Cleans and initializes a serial port, then opens minicom.
# --------------------------------------------------------------------------------

# Configuration
PORT="/dev/ttyACM0"     # Depends on the port (ttyUSB0, ttyS0, ...)
BAUD=115200             # Serial baud rate
MINICOM_CONFIG="dfl"    # Saved minicom configuration ("dfl" or leave empty)

# Clean processes and buffer
echo "[*] Closing any process using ${PORT}..."
sudo fuser -k "$PORT" 2>/dev/null

echo "[*] Resetting port configuration..."
sudo stty -F "$PORT" $BAUD -echo -icanon

# Verify that the port exists
if [ ! -e "$PORT" ]; then
    echo "[!] Error: Port $PORT does not exist."
    exit 1
fi

# STOP ModemManager (optional but recommended)
if systemctl is-active --quiet ModemManager; then
    echo "[*] Stopping ModemManager..."
    sudo systemctl stop ModemManager
fi

# Print port info
echo "[*] Port ready:"
ls -l "$PORT"

# START minicom
echo "[*] Launching minicom on ${PORT} at ${BAUD} baud..."
if [ -n "$MINICOM_CONFIG" ]; then
    sudo minicom -D "$PORT" -b "$BAUD" -c on -S "$MINICOM_CONFIG"
else
    sudo minicom -D "$PORT" -b "$BAUD"
fi

# After exiting minicom
echo "[*] Serial session closed."
