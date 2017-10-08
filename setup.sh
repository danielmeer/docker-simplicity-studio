#!/bin/bash

# Abort if curl is not installed
command -v curl >/dev/null 2>&1 || { echo >&2 "This script requires curl to be installed. Aborting."; exit 1; }

# Download Simplicity Studio
echo "Downloading newest version of 'Simplicity Studio v4'"
curl -SL http://www.silabs.com/Support%20Documents/Software/SimplicityStudio-v4.tgz | tar -xz

# Create directories
mkdir shared workspace

# Create .desktop file
if [ ! -d "$HOME/.local/share/applications" ]; then
	mkdir -p "$HOME/.local/share/applications"
fi

cat << EOF > "$HOME/.local/share/applications/simplicity-studio.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=$(pwd)/run.sh
Name=Simplicity Studio v4
Icon=$(pwd)/SimplicityStudio_v4/icon.xpm
EOF

echo "Setup successful! Run 'build.sh' to build the container."
