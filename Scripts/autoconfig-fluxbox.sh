#!/bin/sh
# Creador: TakYzGG

# Descargar Dotfiles
echo "Descargando Dotfiles..."
wget https://github.com/TakYzGG/Dotfiles/archive/refs/heads/main.zip -O Dotfiles.zip

# Descomprimir Dotfiles.zip
echo "Descompriendo Dotfiles.zip"
unzip Dotfiles.zip

# Borrar configuraciones por defecto
rm -rf /home/$usuario/.fluxbox
rm -rf /home/$usuario/.config/lxterminal
rm -rf /home/$usuario/.config/gtk-3.0
rm -rf /home/$usuario/.config/nvim

# Mover configuraciones
read -p "¿Cual es tu usuario?: " usuario
echo "Moviendo configuraciones..."
mv Dotfiles-main/.fluxbox/					/home/$usuario/
mv Dotfiles-main/.config/lxterminal			/home/$usuario/.config
mv Dotfiles-main/.config/gtk-3.0			/home/$usuario/.config
mv Dotfiles-main/.config/nvim				/home/$usuario/.config


# Mover scripts de dmenu
mv Dotfiles-main/dmenu-menus/*				/usr/local/bin
chmod +x /usr/local/bin/*

# Mover Wallpapers
echo "Moviendo Wallpapers..."
mv Dotfiles-main/Wallpapers					/home/$usuario/

# Mover fuentes
echo "Moviendo fuentes..."
mv Dotfiles-main/Fonts/*					/usr/share/fonts/

# Eliminar reciduos
echo "Eliminando reciduos..."
rm -rf Dotfiles.zip Dotfiles-main

# Mensaje final
echo "Termino la configuracion"
