#!/bin/bash
# Creador: TakYzGG
# Instalador de fluxbox y complementos

# Actualizar sistema
xbps-install -Su

# Descargar fluxbox
xbps-install fluxbox

# Descargar complementos
xbps-install tint2
xbps-install feh

# Descargar programas
xbps-install firefox
xbps-install Thunar
xbps-install leafpad 
xbps-install vlc
xbps-install cmus
xbps-install dmenu
xbps-install libreoffice

echo Instalacion finalizada
echo Copiar archivos de configuracion
