#!/bin/sh 
# Creador: TakYzGG

# Variables
root=$(whoami)
kernelversion=$(uname -r | awk -F. '{print $1"."$2}')
zshrc=https://raw.githubusercontent.com/TakYzGG/Dotfiles/main/.zshrc
bashrc=https://raw.githubusercontent.com/TakYzGG/Dotfiles/main/.bashrc
xdebp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/xdeb
zramp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/zram

# Comprobar que se esta ejecutando como root
if [ "$root" != "root" ]; then
	echo "Este script necesita permisos de root"
	exit 1 
fi

# Mensaje inicial
echo "Bienvenido al instalador de Void Linux"
echo "Este script da al usuario multiples opciones para instalar mas facil y rapido Void Linux net install"
echo "Creado por: TakYzGG"
echo "https://github.com/TakYzGG"

# Preguntas al usuario
# Usuario, repos
read -p "¿Cual es tu nombre de usuario?: " usuario
read -p "¿Quieres añadir el repocitorio nonfree? (s/n): " nonfree
# Init y de/wm
echo "Elige un gestor de sesion:\n0: Xinit\n1: Lxdm"
read -p "¿Cual quieres usar?: " init
echo "Elige un Escritorio o un Windows Manager:\n0:  Ninguno\n1:  Lxde\n2:  Lxqt\n3:  Mate \n4:  Xfce\n5:  I3wm\n6:  Qtile\n7:  Bspwm\n8:  Jwm\n9:  Icewm\n10: Openbox\n11: Fluxbox"
read -p "¿Cual quieres usar?: " dewm
# Controladores
read -p "¿Quieres instalar controladores para bluetooth?  (s/n): " bluetooth
read -p "¿Quieres instalar controladores para bateria y brillo? (s/n): " portatil
read -p "¿Quieres instalar controladores para wifi? (s/n): " wifi
# Programas
echo "Elige un navegador web:\n0: Ninguno\n1: Firefox\n2: Chromium\n3: Midori\n4: Dillo\n5: Links"
read -p "¿Cual quieres usar?: " nav
read -p "¿Quieres instalar programas extra (para wm)? (s/n): " programas
read -p "¿Quieres instalar libreoffice? (s/n): " libreoffice
read -p "¿Quieres instalar emuladores? (s/n): " emuladores
read -p "¿Quieres instalar ufw (firewall)? (s/n): " ufw
read -p "¿Quieres instalar temas gtk? (s/n): " temas
# Utilidades
read -p "¿Quieres instalar herramientas basicas para compilar? (s/n): " compilar
read -p "¿Quieres instalar xdeb? (s/n): " xdeb
read -p "¿Quieres instalar zsh? (s/n): " zsh
read -p "¿Quieres instalar zram? (s/n): " zram
# Kernel
echo "Elige una version del kernel linux:\n0: Kernel default\n1: Kernel 5.15.x\n2: Kernel 5.10.x\n3: Kernel 5.4.x\n4: Kernel 4.19.x\n5: Kernel lts"
read -p "¿Cual quieres usar?: " kernel

# Hacer que todas las respuestas sean minusculas
# Usuario, repos
nonfree=$(echo "$nonfree" | tr '[:upper:]' '[:lower:]')
# Controladores 
wifi=$(echo "$wifi" | tr '[:upper:]' '[:lower:]')
bluetooth=$(echo "$bluetooth" | tr '[:upper:]' '[:lower:]')
portatil=$(echo "$portatil" | tr '[:upper:]' '[:lower:]')
# Programas
ufw=$(echo "$ufw" | tr '[:upper:]' '[:lower:]')
programas=$(echo "$programas" | tr '[:upper:]' '[:lower:]')
libreoffice=$(echo "$libreoffice" | tr '[:upper:]' '[:lower:]')
emuladores=$(echo "$emuladores" | tr '[:upper:]' '[:lower:]')
temas=$(echo "$temas" | tr '[:upper:]' '[:lower:]')
# Utilidades
compilar=$(echo "$compilar" | tr '[:upper:]' '[:lower:]')
xdeb=$(echo "$xdeb" | tr '[:upper:]' '[:lower:]')
zram=$(echo "$zram" | tr '[:upper:]' '[:lower:]')
zsh=$(echo "$zsh" | tr '[:upper:]' '[:lower:]')

# Inicia la instalacion
# Actualizar el sistema
echo "Actualizando el sistema..."
xbps-install -Suy
# Añadir repocitorio multilib
echo "Añadiendo repocitorio multilib..."
xbps-install -y void-repo-multilib
# Descargar paquetes 
echo "Descargando paquetes basicos..."
xbps-install -y xorg wget xclip xdg-user-dirs vim-x11 python3 alsa-utils pulseaudio pulseaudio-utils
# Descargar compresores
echo "Descargando compresores..."
xbps-install -y xz zip unzip p7zip
# Añadir compatibilidad con exfat
echo "Añadiendo compatibilidad con exfat..."
xbps-install -y exfat-utils

# Usuario, repos
# Añadir repo nonfree
if [ "$nonfree" = "s" ]; then
	echo "Añadiendo repocitorio nonfree..."
	xbps-install -y void-repo-nonfree
fi

# Init y de/wm
# Instalar xinit / lxdm
case $init in
	0) echo "Instalando xinit..."
	   xbps-install -y xinit ;;
	1) echo "Instalando lxdm..."
	   xbps-install -y lxdm ;;
	*) echo "Respuesta no valida" ;;
esac
# Instalar DE / WM 
case $dewm in
	0) echo "No se instalara entorno grafico" ;;
	1) echo "Instalando lxde..."
	   xbps-install -y lxterminal lxde galculator mupdf leafpad gparted xarchiver pavucontrol mpv audacious ;;
	2) echo "Instalando lxqt..."
	   xbps-install -y lxqt galculator mupdf leafpad gparted pavucontrol mpv audacious ;;
	3) echo "Instalando mate..."
	   xbps-install -y mate-terminal mate galculator mupdf pluma gparted xarchiver pavucontrol mpv audacious ;;
	4) echo "Instalando xfce..."
	   xbps-install -y xfce4 galculator mupdf gparted xarchiver pavucontrol mpv audacious ;;
	5) echo "Instalando i3wm..."
	   xbps-install -y lxterminal i3 i3blocks i3-gaps ;;
	6) echo "Instalando qtile..."
	   xbps-install -y lxterminal qtile ;;
	7) echo "Instalando bspwm..."
	   xbps-install -y lxterminal bspwm sxhkd ;;
	8) echo "Instalando jwm..."
	   xbps-install -y lxterminal jwm ;;
	9) echo "Instalando icewm..."
	   xbps-install -y lxterminal icewm ;;
   10) echo "Instalando openbox..."
	   xbps-install -y lxterminal openbox ;;
   11) echo "Instalando fluxbox..."
	   xbps-install -y lxterminal fluxbox ;;
   *) echo "Respuesta no valida" ;;
esac

# Controladores
# Instalar controladores de bluetooth
if [ "$bluetooth" = "s" ]; then
	echo "Instalando controladores para bluetooth..."
	xbps-install -y blueman
fi
# Instalar controladores de bateria y brillo
if [ "$portatil" = "s" ]; then
	echo "Instalando controladores para bateria y brillo..."
	xbps-install -y brightnessctl acpi
fi
# Instalar controladores de wifi
if [ "$wifi" = "s" ]; then
	echo "Instalando controladores para wifi..."
	xbps-install -y NetworkManager
fi

# Programas
# Instalar navegador
case $nav in
	0) echo "No se instalara navegador web" ;;
	1) echo "Instalando firefox..."
	   xbps-install -y firefox ;;
	2) echo "Instalando chromium..."
	   xbps-install -y chromium ;;
	3) echo "Instalando midori..."
	   xbps-install -y midori ;;
	4) echo "Instalando dillo..."
	   xbps-install -y dillo ;;
	5) echo "Instalando links..."
	   xbps-install -y links ;;
	*) echo "Respuesta no valida" ;;
esac
# Instalar programas extras (si es necesario)
if [ "$dewm" -gt 5 ] && [ "$dewm" -lt 11 ]; then
	if [ "$programas" = "s" ]; then
		echo "Instalando programas extra..."
		xbps-install -y ssr btop galculator mupdf mirage arandr leafpad gparted xarchiver Thunar thunar-volman thunar-archive-plugin pavucontrol mpv audacious lxappearance
	fi
fi
# Instalar libreoffice
	if [ "$libreoffice" = "s" ]; then
		echo "Instalando libreoffice..."
		xbps-install -y libreoffice
	fi
# Instalar emuladores
if [ "$emuladores" = "s" ]; then
	echo "Instalando emuladores..."
	xbps-install -y retroarch melonDS ppsspp mupen64plus
fi
# Instalar ufw
if [ "$ufw" = "s" ]; then
	echo "Instalando ufw..."
	xbps-install -y ufw
	echo "Configurando ufw..."
	ufw allow http
	ufw allow https
	ufw default deny incoming
	ufw default allow outgoing
	ufw enable
fi
# Instalar temas gtk
if [ "$temas" = "s" ]; then
	echo "Instalando temas..."
	xbps-install -y arc-theme papirus-icon-theme
fi

# Utilidades
# Instalar herramientas de compilacion
if [ "$compilar" = "s" ]; then
	echo "Instalando herramientas de compilacion..."
	xbps-install -y gcc make pkg-config binutils glibc-devel libX11-devel libXft-devel libXrender-devel libXinerama-devel
fi
# Instalar xdeb
if [ "$xdeb" = "s" ]; then
	echo "Instalando xdeb..."
	wget $xdebp
	mv xdeb /usr/local/bin
	chmod +x /usr/local/bin/xdeb
fi
# Instalar zram
if [ "$zram" = "s" ]; then
	echo "Instalando zram..."
	wget $zramp
	mv zram /usr/local/bin
	chmod +x /usr/local/bin/zram
	echo "/usr/local/bin/zram start" >> /etc/rc.local
fi
# Instalar zsh
if [ "$zsh" = "s" ]; then
	echo "Instalando zsh..."
	xbps-install -y zsh
	chsh -s /bin/zsh
	chsh -s /bin/zsh $usuario
fi

# Kernel
# Instalar verion del kernel y eliminar la por defecto
case $kernel in
	0) echo "Se usara el kernel $kernelversion.x" ;;
	1) echo "Instalando kernel 5.15.x..."
	   xbps-install -y linux5.15
	   xbps-remove -RFfy linux$kernelversion && vkpurge rm all ;;
	2) echo "Instalando kernel 5.10.x..."
	   xbps-install -y linux5.10
	   xbps-remove -RFfy linux$kernelversion && vkpurge rm all ;;
	3) echo "Instalando kernel 5.4.x..."
	   xbps-install -y linux5.4
	   xbps-remove -RFfy linux$kernelversion && vkpurge rm all ;;
	4) echo "Instalando kernel 4.19.x..."
	   xbps-install -y linux4.19
	   xbps-remove -RFfy linux$kernelversion && vkpurge rm all ;;
	5) echo "Instalando kernel lts..."
	   xbps-install -y linux-lts
	   xbps-remove -RFfy linux$kernelversion && vkpurge rm all ;;
	*) echo "Respuesta no valida" ;;
esac

# Configuraciones
# Configurar bash / zsh
if [ "$zsh" = "s" ]; then
	echo "Configurando zsh..."
	wget $zshrc
	cp .zshrc /home/$usuario
	cp .zshrc /root
else
	echo "Configurando bash..."
	rm -rf /home/$usuario/.bashrc
	rm -rf /root/.bashrc
	wget $bashrc
	cp .bashrc /home/$usuario
	cp .bashrc /root
fi

# Servicios
# Mover servicios a /var/service
echo "Creando servicios..."
ln -s /etc/sv/dbus						/var/service
ln -s /etc/sv/alsa						/var/service
# Bluetooth
if [ "$bluetooth" = "s" ]; then
	ln -s /etc/sv/bluemand				/var/service
if
# Acpi
if [ "$portatil" = "s" ]; then
	ln -s /etc/sv/acpid					/var/service
fi
# Network Manager
if [ "$wifi" = "s" ]; then
	ln -s /etc/sv/NetworkManager		/var/service
	sv enable NetworkManager
fi
# Lxdm
if [ "$init" -eq 1 ]; then
	ln -s /etc/sv/lxdm					/var/service
fi
# Eliminar ttys de los servicios
echo "Eliminando ttys..."
rm -rf /var/service/agetty-tty3
rm -rf /var/service/agetty-tty4 
rm -rf /var/service/agetty-tty5
rm -rf /var/service/agetty-tty6

# Mensaje final
echo "La instalacion termino"
echo "ejecuta 'xdg-user-dirs-update' para crear los directorios de tu usuario"
