#!/bin/sh
# Creador: TakYzGG

# Programas que uso con i3
echo "Descargando algunos programas..."
xbps-install -y feh dmenu ranger cmus scrot

# Descargar Dotfiles
echo "Descargando Dotfiles..."
wget https://github.com/TakYzGG/Dotfiles/archive/refs/heads/main.zip -O Dotfiles.zip

# Descomprimir Dotfiles.zip
echo "Descompriendo Dotfiles.zip"
unzip Dotfiles.zip

# Preguntar usuario
read -p "¿Cual es tu usuario?: " usuario

# Borrar configuraciones por defecto
rm -rf /home/$usuario/.config/i3
rm -rf /home/$usuario/.config/i3blocks
rm -rf /home/$usuario/.config/lxterminal
rm -rf /home/$usuario/.config/gtk-3.0
rm -rf /home/$usuario/.config/vim

# Mover configuraciones
echo "Moviendo configuraciones..."
mv Dotfiles-main/.config/i3					/home/$usuario/.config
mv Dotfiles-main/.config/i3blocks			/home/$usuario/.config
mv Dotfiles-main/.config/lxterminal			/home/$usuario/.config
mv Dotfiles-main/.config/gtk-3.0			/home/$usuario/.config
mv Dotfiles-main/.config/vim/.vim			/home/$usuario/
mv Dotfiles-main/.config/vim/.vimrc			/home/$usuario/

# Dar permisos a los modulos de i3blocks
chmod +x /home/$usuario/.config/i3blocks/modulos/*

# Mover scripts de dmenu
mv Dotfiles-main/dmenu-menus/*				/usr/local/bin
chmod +x /usr/local/bin/*

# Mover Wallpapers
echo "Moviendo Wallpapers..."
mv Dotfiles-main/Wallpapers					/home/$usuario/

# Mover fuentes
echo "Moviendo fuentes..."
mv Dotfiles-main/Fonts/*					/usr/share/fonts/

# Crear carpetas
echo "Creando carpetas..."
mkdir /home/$usuario/Screenshots

# Eliminar reciduos
echo "Eliminando reciduos..."
rm -rf Dotfiles.zip Dotfiles-main

# Mensaje final
echo "Termino la configuracion"
