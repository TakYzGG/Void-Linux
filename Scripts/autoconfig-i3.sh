#!/bin/sh
# Creador: TakYzGG

# Descargar Dotfiles
echo "Descargando Dotfiles..."
wget https://github.com/TakYzGG/Dotfiles/archive/refs/heads/main.zip -O Dotfiles.zip

# Descomprimir Dotfiles.zip
echo "Descompriendo Dotfiles.zip"
unzip Dotfiles.zip

# Mover configuraciones
read -p "¿Cual es tu usuario?: " usuario
echo "Moviendo configuraciones..."
mv Dotfiles-main/.config/i3					/home/$usuario/.config
mv Dotfiles-main/.config/i3blocks			/home/$usuario/.config
mv Dotfiles-main/.config/lxterminal			/home/$usuario/.config
mv Dotfiles-main/.config/nvim				/home/$usuario/.config

# Mover scripts de dmenu
chowm $usuario:$usuario Dotfiles-main/.config/dmenu-menus
mv * Dotfiles-main/.config/dmenu-menus		/usr/local/bin
chmod +x * /usr/local/bin

# Mover Wallpapers
echo "Moviendo Wallpapers..."
mv Dotfiles-main/Wallpapers					/home/$usuario/

# Mover fuentes
echo "Moviendo fuentes..."
mv Dotfiles-main/Fonts						/usr/share/fonts/

# Eliminar reciduos
echo "Eliminando reciduos..."
rm -rf Dotfiles.zip Dotfiles-main

# Mensaje final
echo "Termino la configuracion"
