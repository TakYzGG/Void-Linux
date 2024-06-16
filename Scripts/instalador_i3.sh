#!/bin/bash
# Creador: TakYzGG
# Github:  https://github.com/TakYzGG

# Iniciando configuracion
echo "--Iniciando configuracion--"

# Descargar paquetes
echo "--Descargando paquetes--"
xbps-install -y i3 i3-gaps i3blocks feh dmenu firefox ranger

# Clonar configuraciones
echo "--Clonando repocitorios--"
git clone https://github.com/TakYzGG/Dotfiles

# Mover configuraciones
echo "--Moviendo configuracions--"
cd ~
cd Dotfiles
cd .config
mv * ~/.config

# Terminar instalacion
echo "--Instalacion terminada--"
