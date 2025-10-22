#!/bin/bash
# --------------------------------------------------------------------------------
#                                 - PWM Fan Setup -
# Description:
#
# Since I'm using the 4010 5V DC brushless fan, this script activates to a medium
# speed this device (175) the maximun accepted is 2^8 - 1 (255) since it uses a B.
# --------------------------------------------------------------------------------

# Wait for system initialization
sleep 10
# Ensure that the Jetson operates at full capacity
sudo /usr/bin/jetson_clocks
# Write desired speed numbre to the system file that controls the speed
sudo sh -c 'echo 175 > /sys/devices/pwm-fan/target_pwm'
