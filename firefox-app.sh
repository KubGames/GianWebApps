#!/bin/sh
cd ~/.local/share/applications/
if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
	echo Uso: firefox-app NOME LINK IMAGEM 
	exit
fi
echo yay
touch $1.desktop
echo '[Desktop Entry]
Encoding=UTF-8
Name='$1'
Exec=firefox -P WebApps --new-window --class '$1 $2'
Icon='$3'
Type=Application
Categories=Network;
StartupWMClass='$1'
Terminal=false' > $1.desktop
