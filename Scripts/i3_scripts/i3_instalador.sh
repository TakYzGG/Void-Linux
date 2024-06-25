#!/bin/bash
# Creador: TakYzGG
# Instalador de i3wm y complementos

# Actualizar sistema
xbps-install -Su

# Descargar i3wm
xbps-install -y i3

# Descargar complementos
xbps-install -y i3blocks
xbps-install -y i3-gaps
xbps-install -y feh

# Descargar Programas
xbps-install -y dmenu
xbps-install -y firefox
xbps-install -y ranger

echo Instalacion finalizada
echo Copiar archivos de configuracion
