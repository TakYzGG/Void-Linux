#!/bin/bash
# Creador: TakYzGG
# Instalador de fluxbox y complementos

# Actualizar sistema
xbps-install -Su

# Descargar fluxbox
xbps-install -y fluxbox

# Descargar complementos
xbps-install -y feh

# Descargar programas
xbps-install -y firefox
xbps-install -y Thunar
xbps-install -y leafpad 
xbps-install -y vlc
xbps-install -y cmus
xbps-install -y dmenu
xbps-install -y libreoffice
xbps-install -y galculator

echo Instalacion finalizada
echo Copiar archivos de configuracion
