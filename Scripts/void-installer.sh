#!/bin/sh
# Creador: TakYzGG

# Variables
kernelversion=6.6
zshrc=https://raw.githubusercontent.com/TakYzGG/Dotfiles/main/.zshrc
bashrc=https://raw.githubusercontent.com/TakYzGG/Dotfiles/main/.bashrc
xdebp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/xdeb
zramp=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/zram

# Mensaje inicial
echo "Iniciando instalacion..."

# Preguntas al usuario
read -p "¿Cual es tu usuario?: " usuario
read -p "¿Quieres añadir el repocitorio nonfree? (s/n): " nonfree
echo "Elige un gestor de sesion:\n0: Xinit\n1: Lxdm"
read -p "¿Cual quieres usar?: " init
echo "Elige un Escritorio o un Windows Manager:\n0:  Ninguno\n1:  Lxde\n2:  Lxqt\n3:  Mate \n4:  Xfce\n5:  I3wm\n6:  Qtile\n7:  Bspwm\n8:  Jwm\n9:  Icewm\n10: Openbox\n11: Fluxbox"
read -p "¿Cual quieres usar?: " dewm
echo "Elige un navegador web:\n0: Ninguno\n1: Firefox\n2: Chromium\n3: Dillo\n4: Links"
read -p "¿Cual quieres usar?: " nav
read -p "¿Quieres instalar programas extra? (s/n): " programas
read -p "¿Quieres instalar libreoffice? (s/n): " libreoffice
read -p "¿Quieres instalar emuladores? (s/n): " emuladores
read -p "¿Quieres instalar complementos para portatiles? (s/n): " portatil
read -p "¿Quieres instalar herramientas basicas para compilar? (s/n): " compilar
echo "Elige una version del kernel linux:\n0: Kernel $kernelversion.x\n1: Kernel 5.15.x\n2: Kernel 5.10.x\n3: Kernel 5.4.x\n4: Kernel 4.19.x\n5: Kernel lts"
read -p "¿Cual quieres usar?: " kernel
read -p "¿Quieres instalar ufw? (s/n): " ufw
read -p "¿Quieres instalar xdeb? (s/n): " xdeb
read -p "¿Quieres instalar zram? (s/n): " zram
read -p "¿Quieres instalar zsh? (s/n): " zsh
read -p "¿Quieres instalar temas gtk? (s/n): " temas

# Hacer que todas las respuestas sean minusculas
nonfree=$(echo "$nonfree" | tr '[:upper:]' '[:lower:]')
init=$(echo "$init" | tr '[:upper:]' '[:lower:]')
programas=$(echo "$programas" | tr '[:upper:]' '[:lower:]')
libreoffice=$(echo "$libreoffice" | tr '[:upper:]' '[:lower:]')
portatil=$(echo "$portatil" | tr '[:upper:]' '[:lower:]')
compilar=$(echo "$compilar" | tr '[:upper:]' '[:lower:]')
kernel=$(echo "$kernel" | tr '[:upper:]' '[:lower:]')
ufw=$(echo "$ufw" | tr '[:upper:]' '[:lower:]')
xdeb=$(echo "$xdeb" | tr '[:upper:]' '[:lower:]')
zram=$(echo "$zram" | tr '[:upper:]' '[:lower:]')
zsh=$(echo "$zsh" | tr '[:upper:]' '[:lower:]')
temas=$(echo "$temas" | tr '[:upper:]' '[:lower:]')

# Actualizar el sistema
echo "Actualizando el sistema..."
xbps-install -Suy

# Añadir repocitorio multilib
echo "Añadiendo repocitorio multilib..."
xbps-install -y void-repo-multilib

# Descargar paquetes
echo "Descargando paquetes basicos..."
xbps-install -y xorg wget xclip vim python3 alsa-utils pulseaudio NetworkManager

# Descargar compresores
echo "Descargando compresores..."
xbps-install -y xz zip unzip p7zip

# Añadir compatibilidad con exfat
echo "Añadiendo compatibilidad con exfat..."
xbps-install -y exfat-utils

# Descargas de las preguntas
if [ "$nonfree" = "s" ]; then
	echo "Añadiendo repocitorio nonfree..."
	xbps-install -y void-repo-nonfree
fi

case $init in
	0) echo "Instalando xinit..."
	   xbps-install -y xinit ;;
	1) echo "Instalando lxdm..."
	   xbps-install -y lxdm ;;
esac

case $dewm in
	0) echo "No se instalara entorno grafico" ;;
	1) echo "Instalando lxde..."
	   xbps-install -y lxterminal lxde galculator xreader leafpad gparted xarchiver pavucontrol vlc audacious ;;
	2) echo "Instalando lxqt..."
	   xbps-install -y lxqt galculator xreader leafpad gparted pavucontrol vlc audacious ;;
	3) echo "Instalando mate..."
	   xbps-install -y mate-terminal mate galculator xreader pluma gparted xarchiver pavucontrol vlc audacious ;;
	4) echo "Instalando xfce..."
	   xbps-install -y xfce4 galculator xreader gparted xarchiver pavucontrol vlc audacious ;;
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
esac

case $nav in
	0) echo "No se instalara navegador web" ;;
	1) echo "Instalando firefox..."
	   xbps-install -y firefox ;;
	2) echo "Instalando chromium..."
	   xbps-install -y chromium ;;
	3) echo "Instalando dillo..."
	   xbps-install -y dillo ;;
	4) echo "Instalando links..."
	   xbps-install -y links ;;
esac

if [ "$dewm" -eq 5 ] || [ "$dewm" -eq 6 ] || [ "$dewm" -eq 7 ] || [ "$dewm" -eq 8 ] || [ "$dewm" -eq 9 ] || [ "$dewm" -eq 10 ] || [ "$dewm" -eq 11 ]; then
	if [ "$programas" = "s" ]; then
		echo "Instalando programas extra..."
		xbps-install -y ssr btop galculator xreader mirage arandr leafpad gparted xarchiver Thunar thunar-volman thunar-archive-plugin pavucontrol vlc audacious lxappearance
	fi
fi

	if [ "$libreoffice" = "s" ]; then
		echo "Instalando libreoffice..."
		xbps-install -y libreoffice
	fi

if [ "$emuladores" = "s" ]; then
	echo "Instalando emuladores..."
	xbps-install -y retroarch melonDS ppsspp mupen64plus
fi

if [ "$portatil" = "s" ]; then
	echo "Instalando complementos para portatiles..."
	xbps-install -y brightnessctl acpi
fi

if [ "$compilar" = "s" ]; then
	echo "Instalando herramientas de compilacion..."
	xbps-install -y gcc make pkg-config binutils glibc-devel libX11-devel libXft-devel libXrender-devel libXinerama-devel
fi

case $kernel in
	0) echo "Se usara el kernel $kernelversion.x" ;;
	1) echo "Instalando kernel 5.15.x..."
	   xbps-install -y linux5.15 ;;
	   xbps-remove -RdFfy linux$kernelversion
	2) echo "Instalando kernel 5.10.x..."
	   xbps-install -y linux5.10 ;;
	   xbps-remove -RdFfy linux$kernelversion
	3) echo "Instalando kernel 5.4.x..."
	   xbps-install -y linux5.4 ;;
	   xbps-remove -RdFfy linux$kernelversion
	4) echo "Instalando kernel 4.19.x..."
	   xbps-install -y linux4.19 ;;
	   xbps-remove -RdFfy linux$kernelversion
	5) echo "Instalando kernel lts..."
	   xbps-install -y linux-lts ;;
	   xbps-remove -RdFfy linux$kernelversion
esac

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

if [ "$xdeb" = "s" ]; then
	echo "Instalando xdeb..."
	wget $xdebp
	mv xdeb /usr/local/bin
	chmod +x /usr/local/bin/xdeb
fi

if [ "$zram" = "s" ]; then
	echo "Instalando zram..."
	wget $zramp
	mv zram /usr/local/bin
	chmod +x /usr/local/bin/zram
	echo "/usr/local/bin/zram start" >> /etc/rc.local
fi

if [ "$zsh" = "s" ]; then
	echo "Instalando zsh..."
	xbps-install -y zsh
	chsh -s /bin/zsh
	chsh -s /bin/zsh $usuario
fi
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

if [ "$temas" = "s" ]; then
	echo "Instalando temas..."
	xbps-install -y arc-theme papirus-icon-theme
fi

# Mover servicios a /var/service
echo "Creando servicios..."
ln -s /etc/sv/dbus					/var/service
ln -s /etc/sv/alsa					/var/service
ln -s /etc/sv/NetworkManager		/var/service

# Lxdm
if [ "$init" -eq 1 ]; then
ln -s /etc/sv/lxdm					/var/service
fi

# Habilitar servicios
sv enable NetworkManager

# Eliminar ttys de los servicios
echo "Eliminando ttys..."
rm -rf /var/service/agetty-tty3
rm -rf /var/service/agetty-tty4
rm -rf /var/service/agetty-tty5
rm -rf /var/service/agetty-tty6

# Mensaje final
echo "La instalacion termino"
