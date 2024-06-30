#!/bin/bash
# Creador: TakYzGG

# Actualizar sistema
echo "Actualizando"
xbps-install -Suy

# Descargas
echo "Descargando paquetes"
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

# Descargar i3wm
echo "Descargando mas paquetes"
xbps-install -y i3
xbps-install -y i3blocks
xbps-install -y i3-gaps
xbps-install -y feh
xbps-install -y dmenu
xbps-install -y firefox
xbps-install -y ranger

# Servicios
echo "Iniciando servicios"
ln -s /etc/sv/dbus							/var/service
ln -s /etc/sv/lxdm							/var/service
ln -s /etc/sv/alsa							/var/service
ln -s /etc/sv/NetworkManager				/var/service

# Iniciar servicios
sv enable NetworkManager

# Optimizaciones
echo "Optimizando"
rm -r /var/service/agetty-tty3
rm -r /var/service/agetty-tty4
rm -r /var/service/agetty-tty5
rm -r /var/service/agetty-tty6

# Mensaje final
echo "La instalacion finalizo"
