# docker-simplicity-studio
Docker image for Simplicity Studio v4 from Silicon Labs with additional setup scripts.

## Info
The scripts require docker to be installed and workig. Additionally, the user needs to be in the *docker* group for access without sudo.

## Usage
Run `./setup.sh` to download the IDE, create all mapped directories and write a .desktop file.

Run `./build.sh` to build the docker image.

After that, you can start Simplicity Studio either from your start menu or with `./run.sh`.
