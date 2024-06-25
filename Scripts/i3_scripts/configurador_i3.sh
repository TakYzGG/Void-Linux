#!/bin/bash
# Creador: TakYzGG
# Github:  https://github.com/TakYzGG

# Iniciando configuracion
echo "--Iniciando configuracion--"

# Clonar configuraciones
echo "--Clonando repocitorios--"
cd ~/
git clone https://github.com/TakYzGG/Dotfiles

# Mover configuraciones
echo "--Moviendo configuracions--"
cd ~/Dotfiles/.config
mv * ~/.config

# Mover fondos de pantalla
echo "--Moviendo fondos de pantalla--"
cd ~/Dotfiles
mv Wallpapers/ $HOME/

# Mover fuentes
echo "--Moviendo fuentes--"
cd ~/Dotfiles/Fonts
mv * /usr/share/fonts/X11/TTF

# Terminar instalacion
echo "--Instalacion terminada--"
