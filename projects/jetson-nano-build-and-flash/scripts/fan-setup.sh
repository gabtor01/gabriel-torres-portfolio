#!/bin/bash
# Wait for system initialization
sleep 10
# Ensure that the Jetson operates at full capacity
sudo /usr/bin/jetson_clocks
# Write 255 to the system file that controls the speed
sudo sh -c 'echo 255 > /sys/devices/pwm-fan/target_pwm'
