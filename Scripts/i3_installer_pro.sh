#!/bin/bash
# Creador: TakYzGG

# Instalar paquetes necesarios
echo Iniciando instalacion
xbps-install i3 i3-gaps i3blocks dmenu feh ranger firefox

# Remover configuraciones por defecto
echo Removiendo configuraciones por defecto
cd ~
rm -r .config/i3
rm -r .config/i3blocks
rm -r .config/lxterminal

# Copiar configuraciones de TakYzGG
echo Copiando configuracion
cd ~
git clone https://github.com/TakYzGG/Dotfiles
cd Dotfiles
cp -r .config/i3 ~/.config/
cp -r .config/i3blocks ~/.config/
cp -r .config/lxterminal ~/.config/

# Copiar wallpapers
cd ~
cd Dotfiles
mv -r Wallpapers ~

# Copiar fuentes
echo Copiando fuentes
cd ~
cd Dotfiles
cd fonts
cp * /usr/share/fonts/X11/TTF
