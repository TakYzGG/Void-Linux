#!/bin/bash
# Creador: TakYzGG
# Instalador de i3wm y complementos

# Actualizar sistema
xbps-install -Su

# Descargar i3wm
xbps-install i3

# Descargar complementos
xbps-install i3blocks
xbps-install feh

# Descargar Programas
xbps-install dmenu
xbps-install firefox
xbps-install Thunar

echo Instalacion finalizada
echo Copiar archivos de configuracion
