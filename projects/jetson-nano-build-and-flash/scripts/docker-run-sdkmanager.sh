#!/usr/bin/env bash
# --------------------------------------------------------------------------------
#              - Run NVIDIA SDK Manager in Docker (interactive/CLI) -
# Description:
#
# Launches a privileged container with USB and device passthrough, host networking
# and media mounts for flashing Jetson boards or using SDK Manager interactively.
# --------------------------------------------------------------------------------

TAG="2.3.0.12626-Ubuntu_18.04" # edit according to downloaded image
# docker run -it --rm sdkmanager:$TAG --ver
# or to enter the interactive container (privileged if flashing)
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb/ -v /dev:/dev -v /media/$USER:/media/nvidia:slave --name jetPack --network host --entrypoint /bin/bash sdkmanager:$TAG

# docker exec -it jetPack bash -> to just run the container

