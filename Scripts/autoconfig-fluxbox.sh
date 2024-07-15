#!/bin/sh
# Creador: TakYzGG

# Variables
Dotfiles=https://github.com/TakYzGG/archive/refs/heads/main.zip -O Dotfiles.zip

# Descargar Dotfiles
echo "Descargando Dotfiles..."
wget $Dotfiles

# Descomprimir Dotfiles.zip
echo "Descompriendo Dotfiles.zip"
unzip Dotfiles.zip

# Mover configuraciones
read -p "¿Cual es tu usuario?: " usuario
echo "Moviendo configuraciones..."
mv Dotfiles-main/.fluxbox/					/home/$usuario/.config
mv Dotfiles-main/.config/lxterminal			/home/$usuario/.config
mv Dotfiles-main/.config/nvim				/home/$usuario/.config

# Mover Wallpapers
echo "Moviendo Wallpapers..."
mv Dotfiles-main/Wallpapers					/home/$usuario/

# Mover fuentes
echo "Moviendo fuentes..."
mv Dotfiles-main/Fonts						/usr/share/fonts/TTF

# Eliminar reciduos
echo "Eliminando reciduos..."
rm -rf Dotfiles.zip Dotfiles-main

# Mensaje final
echo "Termino la configuracion"
