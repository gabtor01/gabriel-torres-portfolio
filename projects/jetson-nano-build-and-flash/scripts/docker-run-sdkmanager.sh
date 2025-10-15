#!/usr/bin/env bash
# Run the SDK Manager Docker image (edit TAG)
TAG="2.3.0.12626-Ubuntu_18.04" # edit according to downloaded image
# docker run -it --rm sdkmanager:$TAG --ver
# or to enter the interactive container (privileged if flashing)
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb/ -v /dev:/dev -v /media/$USER:/media/nvidia:slave --name jetPack --network host --entrypoint /bin/bash sdkmanager:$TAG
# to just execute the container
# docker exec -it jetPack bash

