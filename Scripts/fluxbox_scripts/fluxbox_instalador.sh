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
xbps-install -y audacius
xbps-install -y dmenu
xbps-install -y libreoffice
xbps-install -y galculator
xbps-insatll -y xreader
xbps-insatll -y xarchiver
xbps-insatll -y gparted
xbps-insatll -y lxappearance
xbps-insatll -y pavucontrol

# Descargar temas gtk
xbps-insatll -y arc-theme
xbps-insatll -y arc-icon-theme
xbps-insatll -y papirus-icon-theme

echo Instalacion finalizada
echo Copiar archivos de configuracion
