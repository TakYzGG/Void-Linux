#!/bin/bash

# <<--Actualizar-->>
xbps-install -Su

# <<--Descargas-->>
xbps-install xorg
xbps-install lxdm
xbps-install htop
xbps-install xinit
xbps-install neovim
xbps-install python3
xbps-install lxterminal
xbps-install pulseaudio
xbps-install NetworkManager
xbps-install alsa-plugins-pulseaudio

# <<--Servicios-->>
ln -s /etc/sv/dbus            	/var/service
ln -s /etc/sv/lxdm            	/var/service
ln -s /etc/sv/pulseaudio 		/var/service
ln -s /etc/sv/NetworkManager	/var/service

# <<--Iniciar Servicios-->>
sv enable pulseaudio
sv enable NetworkManager

# <<--Optimizaciones-->>
rm -r /var/service/agetty-tty3
rm -r /var/service/agetty-tty4
rm -r /var/service/agetty-tty5
rm -r /var/service/agetty-tty6