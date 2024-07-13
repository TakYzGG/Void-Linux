#!/bin/sh
# Creador: TakYzGG

# Zram
zram=https://raw.githubusercontent.com/TakYzGG/Void-Linux/main/Utilidades/zram

# Descargar e instalar zram
echo "Instalando zram"
wget $zram
chmod +x zram
mv zram /usr/local/bin
echo "/usr/local/bin/zram start" >> /etc/rc.local
