#!/usr/bin/env bash
# Run inside the SDK Manager container with --privileged permissions
sdkmanager --cli install --logintype devzone --product Jetson --version 4.6.6 \
--targetos Linux --host --target JETSON_NANO_TARGETS --flash all --license accept