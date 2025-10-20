#!/bin/bash
# Wi-Fi activation script (I'm using the Intel 8265AC)

# Wait for system initialization
sleep 5
# Bring up the Wi-Fi interface
INTERFACE="wlo1"  # need to be adjusted according the case 
sudo ip link set $INTERFACE up
echo "Wi-Fi interface $INTERFACE is up"

# Scan for available Wi-Fi networks
echo "Scanning for Wi-Fi networks..."
sudo iwlist $INTERFACE scan | grep ESSID

# Connect to a Wi-Fi network (SSID and PASSWORD need to be changed)
SSID="SSID"
PASSWORD="PASSWORD"
echo "Connecting to $SSID..."
nmcli dev wifi connect "$SSID" password "$PASSWORD"

# Check connection status
echo "Connection status:"
nmcli dev status | grep $INTERFACE

# Usually NetworkManager assigns IP automatically
echo "IP address assigned:"
ip addr show $INTERFACE | grep inet
