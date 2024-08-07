#!/bin/bash

# Get absolute path of the directory containig this script
MAIN_DIR=$(cd "$(dirname "$0")"; pwd)

# Get JLink adapter
for device in $(find /sys/bus/usb/devices); do
   if [[ ! -z $(udevadm info -q all -p ${device} | grep "J-Link") ]]; then
      JLINK_PATH=/dev/$(udevadm info -q name -p ${device})
      echo "Found: ${device} -> ${JLINK_PATH}"
   fi
done

docker run --rm \
	--env DISPLAY=unix$DISPLAY \
	--name simplicity-studio \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume "${MAIN_DIR}/SimplicityStudio_v4":/opt/SimplicityStudio_v4 \
	--volume "${MAIN_DIR}/workspace":/home/user/SimplicityStudio/v4_workspace \
	--volume "${MAIN_DIR}/shared":/home/user/shared \
	--device "${JLINK_PATH}" \
	simplicity-studio-image
