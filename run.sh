#!/bin/bash

# Get absolute path of the directory containig this script
MAIN_DIR=$(cd "$(dirname "$0")"; pwd)

docker run --rm \
	--env DISPLAY=unix$DISPLAY \
	--name simplicity-studio \
	--net host \
	--privileged \
	--volume /tmp/.X11-unix:/tmp/.X11-unix \
	--volume "${MAIN_DIR}/SimplicityStudio_v4":/opt/SimplicityStudio_v4 \
	--volume "${MAIN_DIR}/workspace":/home/user/SimplicityStudio/v4_workspace \
	--volume "${MAIN_DIR}/shared":/home/user/shared \
	simplicity-studio-image
