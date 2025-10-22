#!/usr/bin/env bash
# --------------------------------------------------------------------------------
#                  - SDK Manager CLI: install and flash Jetson -
# Description:
#
# Performs an install of JetPack 4.6.6 for host and target, accepts licenses, and
# flashes the device in a single command.
# --------------------------------------------------------------------------------

sdkmanager --cli install --logintype devzone --product Jetson --version 4.6.6 \
--targetos Linux --host --target JETSON_NANO_TARGETS --flash all --license accept