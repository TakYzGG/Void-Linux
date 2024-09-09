#!/bin/sh
# Creador: TakYzGG

# Variables
root=$(whoami)

# Comprobar que se esta ejecutando como root
if [ "$root" != "root" ]; then
	echo "Este script necesita permisos de root"
	exit 1 
fi

# Programas que uso con i3
echo "Descargando paquetes..."
xbps-install -y feh mpv rofi vifm cmus scrot mupdf arandr gparted pamixer lxappearance

# Descargar Dotfiles
echo "Descargando Dotfiles..."
git clone https://github.com/TakYzGG/Dotfiles/
git clone https://github.com/newmanls/rofi-themes-collection   

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
rm -rf /home/$usuario/.vim
rm -rf /home/$usuario/.vimrc
rm -rf /home/$usuario/.config/vifm

# Mover configuraciones
echo "Moviendo configuraciones..."
mv Dotfiles/.config/i3						/home/$usuario/.config
mv Dotfiles/.config/i3blocks				/home/$usuario/.config
mv Dotfiles/.config/lxterminal				/home/$usuario/.config
mv Dotfiles/.config/gtk-3.0					/home/$usuario/.config
mv Dotfiles/.config/vim/.vim				/home/$usuario/
mv Dotfiles/.config/vim/.vimrc				/home/$usuario/
mv Dotfiles/.config/vifm/*					/home/$usuario/.config

# Dar permisos a los modulos de i3blocks
chmod +x /home/$usuario/.config/i3blocks/modulos/*

# Rofi
mv rofi-themes-collection/themes/*			/usr/share/rofi/themes
mv Dotfiles/rofi-menus/*					/usr/local/bin
chmod +x /usr/local/bin/*

# Mover Wallpapers
echo "Moviendo Wallpapers..."
mv Dotfiles/Wallpapers						/home/$usuario/

# Mover fuentes
echo "Moviendo fuentes..."
mv Dotfiles/Fonts/*							/usr/share/fonts/

# Crear carpetas
echo "Creando carpetas..."
mkdir /home/$usuario/Screenshots

# Eliminar reciduos
echo "Eliminando reciduos..."
rm -rf Dotfiles

# Mensaje final
echo "Termino la configuracion"
