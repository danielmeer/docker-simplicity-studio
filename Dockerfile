# Run Simplicity Studio v4 from a container

FROM ubuntu:16.04
LABEL maintainer "Daniel Meer <meerdan2@gmail.com>"

# Copy necessary installation files
COPY SimplicityStudio_v4/setup.sh /tmp/
COPY SimplicityStudio_v4/StudioLinux /tmp/StudioLinux/

# Install Simplicity Studio
ENV DEBIAN_FRONTEND noninteractive
RUN dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y gnome-themes-standard \
	&& mkdir -p /etc/udev/rules.d \
	&& sed -i "s/sudo apt-get install/apt-get install -y/" "/tmp/setup.sh" \
	&& /tmp/setup.sh \
	&& apt-get autoremove --purge -y \
	&& apt-get clean
RUN rm -rf /tmp/setup.sh /tmp/StudioLinux

# Run as non-privileged user
RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user

# Use better GTK theme
RUN echo "include \"/usr/share/themes/Adwaita/gtk-2.0/gtkrc\"" >> /home/user/.gtkrc-2.0

# Autorun Simplicity Studio
ENTRYPOINT ["/opt/SimplicityStudio_v4/run_studio.sh"]
