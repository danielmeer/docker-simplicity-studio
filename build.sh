#!/bin/bash

# Get absolute path of the directory containig this script
MAIN_DIR=$(cd "$(dirname "$0")"; pwd)

docker build --tag simplicity-studio-image "${MAIN_DIR}"
