#!/bin/bash
# Creador: TakYzGG

# Instalar paquetes necesarios
echo Iniciando instalacion
xbps-install fluxbox feh firefox Thunar leafpad vlc cmus dmenu libreoffice galculator

# Remover configuraciones por defecto
echo Removiendo configuraciones por defecto
cd ~
rm -r .fluxbox
rm -r .config/lxterminal

# Copiar configuraciones de TakYzGG
echo Copiando configuracion
cd ~
git clone https://github.com/TakYzGG/Dotfiles
cd Dotfiles
cp -r .fluxbox ~/
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
