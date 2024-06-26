#!/bin/bash

# Actualizar el sistema 
xbps-install -Su

# Descargas
xbps-install -y xorg
xbps-install -y htop
xbps-install -y lxdm
xbps-install -y xinit
xbps-install -y neovim
xbps-install -y python3
xbps-install -y lxterminal
xbps-install -y alsa-utils
xbps-install -y pulseaudio
xbps-install -y NetworkManager

# Servicios
ln -s /etc/sv/dbus						/var/service
ln -s /etc/sv/lxdm						/var/service
ln -s /etc/sv/alsa 						/var/service
ln -s /etc/sv/NetworkManager			/var/service

# Iniciar servicios
sv enable NetworkManager

# Optimizaciones
rm -r /var/service/agetty-tty3
rm -r /var/service/agetty-tty4
rm -r /var/service/agetty-tty5
rm -r /var/service/agetty-tty6
