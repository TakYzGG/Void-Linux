#!/bin/sh
# Creador: TakYzGG

# Variables
xdebp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/xdeb
zramp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/zram
zshrc=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/.zshrc
bashrc=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/.bashrc

# Mensaje inicial
echo "Iniciando instalacion..."

# Añadir repositorio multilib
echo "Añadiendo repositorios multilib..."
xbps-install -y void-repo-multilib

# Añadir repositorio nonfree
while true; do
		echo "¿Quieres añadir el repositorio nonfree?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " nonfree

		case $nonfree in
				1)
						echo "Añadiendo repositorios nonfree..."
						xbps-install -y void-repo-nonfree
						break
						;;
				2)
						echo "No se añadira el repositorio nonfree"
						break
						;;
		esac
done

# Actualizar el sistema
echo "Actualizando el sistema..."
xbps-install -Suy

# Descargar paquetes basicos
echo "Descargando paquetes basicos..."
xbps-install -y xorg htop wget xinit neovim python3 alsa-utils pulseaudio NetworkManager

# Instalar de/wm
while true; do
		echo "--------------------------"
		echo "<-Entornos de escritorio->"
		echo "--------------------------"
		echo "1)  Lxde"
		echo "2)  Lxqt"
		echo "3)  Mate"
		echo "4)  Xfce"
		echo "--------------------------"
		echo " <-Gestores de ventanas->"
		echo "--------------------------"
		echo "<-Tipo tiling->"
		echo "5)  I3wm"
		echo "6)  Qtile"
		echo "7)  Bspwm"
		echo "<-Tipo flotante->"
		echo "8)  Jwm"
		echo "9)  Icewm"
		echo "10) Openbox"
		echo "11) Fluxbox"
		echo "--------------------------"
		echo "    <-Ninguna opcion->"
		echo "--------------------------"
		echo "12) Ninguno"
		read -p "Ingresa la respuesta (1/12): " dewm
		
		case $dewm in
				1)
						echo "Instalando Lxde..."
						xbps-install -y lxdm lxterminal lxde firefox galculator xreader leafpad gparted xarchiver pavucontrol vlc audacious libreoffice
						break
						;;
				2)
						echo "Instalando Lxqt..."
						xbps-install -y lxdm lxqt firefox galculator xreader leafpad gparted pavucontrol vlc audacious libreoffice
						break
						;;
				3)
						echo "Instalando Mate..."
						xbps-install -y lxdm mate-terminal mate firefox galculator xreader pluma gparted xarchiver pavucontrol vlc audacious libreoffice
						break
						;;
				4)
						echo "Instalando Xfce..."
						xbps-install -y lxdm xfce4 firefox galculator xreader gparted xarchiver pavucontrol vlc audacious libreoffice
						break
						;;
				5)
						echo "Instalando I3wm..."
						xbps-install -y lxdm lxterminal i3 i3blocks i3-gaps feh dmenu firefox ranger
						break
						;;
				6)
						echo "Instalando Qtile..."
						xbps-install -y lxdm lxterminal qtile feh dmenu firefox ranger
						break
						;;
				7)
						echo "Instalando Bspwm..."
						xbps-install -y lxdm lxterminal bspwm feh dmenu firefox ranger
						break
						;;
				8)
						echo "Instalando Jwm..."
						xbps-install -y lxdm lxterminal jwm feh dmenu firefox ranger
						break
						;;
				9)
						echo "Instalando Icewm..."
						xbps-install -y lxdm lxterminal icewm feh dmenu firefox ranger
						break
						;;
				10)
						echo "Instalando Openbox..."
						xbps-install -y lxdm lxterminal openbox feh dmenu firefox ranger
						break
						;;
				11)
						echo "Instalando Fluxbox..."
						xbps-install -y lxdm lxterminal feh dmenu plank firefox ranger
						break
						;;
				12)
						echo "No se eligio ninguna opcion"
						break
						;;
		esac
done

# Programas extra
if [ "$dewm" -gt 4 ] && [ "$dewm" -lt 12 ]; then
		while true; do
				echo "¿Quieres instalar programas extra?"
				echo "1) Si"
				echo "2) No"
				read -p "Ingresa la respuesta (1/2): " programas

				case $programas in
						1)
								echo "Instalando programas extra..."
								xbps-install -y galculator xreader leafpad gparted xarchiver Thunar pavucontrol vlc audacious libreoffice lxappearance
								break
								;;
						2)
								echo "No se instalaran programas extra"
								break
								;;
				esac
		done
fi

# Instalar kernel lts
while true; do
		echo "¿Quieres instalar el kernel lts?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " kernel
		
		case $kernel in
				1)
						echo "Instalando kernel lts..."
						xbps-install -y linux-lts
						update-grub
						break
						;;
				2)
						echo "No se instalara el kernel lts"
						break
						;;
		esac
done

# Instalar xdeb
while true; do
		echo "¿Quieres instalar xdeb?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " xdeb
		
		case $xdeb in
				1)
						echo "Instalando xdeb..."
						wget $xdebp
						mv xdeb /usr/local/bin
						chmod +x /usr/local/bin/xdeb
						break
						;;
				2)
						echo "No se instalara xdeb"
						break
						;;
		esac
done

# Instalar zram
while true; do
		echo "¿Quieres instalar zram?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " zram
		
		case $zram in
				1)
						echo "Instalando zram..."
						wget $zramp
						chmod +x zram
						mv zram /usr/local/bin
						echo "/usr/local/bin/zram start" >> /etc/rc.local
						echo "La cantidad por defecto de zram es el 50% de la ram del equipo, para cambiarlo puedes hacerlo en /usr/local/bin/zram"
						break
						;;
				2)
						echo "No se instalara zram"
						break
						;;
		esac
done

# Instalar zsh

while true; do
		echo "¿Quieres instalar zsh?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " zsh
		
		case $zsh in
				1)
						echo "Instalando zsh..."
						xbps-install -y zsh
						chsh -s /bin/zsh
						read -p "¿Cual es tu nombre de usuario?: " usuario
						chsh -s /bin/zsh $usuario
						break
						;;
				2)
						echo "No se instalara zsh"
						break
						;;
		esac
done

# Temas GTK
while true; do
		echo "¿Quieres instalar algunos temas gtk?"
		echo "1) Si"
		echo "2) No"
		read -p "Ingresa la respuesta (1/2): " temas
		
		case $temas in
				1)
						echo "Instalando temas..."
						xbps-install -y arc-theme arc-icon-theme papirus-icon-theme
						break
						;;
				2)
						echo "No se instalaran temas gtk"
						break
						;;
		esac
done

# Instalar config basica bash/zsh
if [ "$zsh" -eq 1 ]; then
		echo "Descargando configuracion basica de zsh"
		wget $zshrc
		cp .zshrc /home/$usuario
		cp .zshrc /root
else
		echo "Borrando configuracion por defecto de bash"
		rm -f /home/$usuario/.bashrc
		rm -f /root/.bashrc
  		echo "Descargando configuracion basica de bash"
		wget $bashrc
		cp .bashrc /home/$usuario
		cp .bashrc /root
fi

# Mover los servicios a /var/service
echo "Creando servicios..."
ln -s /etc/sv/dbus						/var/service
ln -s /etc/sv/alsa						/var/service
ln -s /etc/sv/NetworkManager					/var/service

# Lxdm
if [ "$dewm" -lt 12 ]; then
		ln -s /etc/sv/lxdm				/var/service
fi

# Habilitar servicios
sv enable NetworkManager

# Eliminar ttys de los servicios
echo "Eliminando ttys..."
rm -r /var/service/agetty-tty3
rm -r /var/service/agetty-tty4
rm -r /var/service/agetty-tty5
rm -r /var/service/agetty-tty6

# Mensaje final
echo "La instalacion termino"
