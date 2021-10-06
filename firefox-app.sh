#!/bin/sh
if [ -e firefox-app.sh ]
then
	mkdir ~/.local/bin
	cp firefox-app.sh ~/.local/bin/firefox-app
	printf 'foi adicionado à ~/.local/bin/ o comando firefox-app :) \n\n'
	source ~/.profile
fi


cd ~/.local/share/applications/

#Caso o comando Falhe
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
Exec=firefox -P '$1' --new-window --class '$1 $2'
Icon='$3'
Type=Application
Categories=Network;
StartupWMClass='$1'
Terminal=false' > $1.desktop

# Criar um novo profile no firefo
firefox --CreateProfile $1
#Copiar /chrome/
cd ~/.mozilla/firefox/*.$1
#Habilitar a config
printf 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets",true);' > user.js

# configurar o chrome para retirar tudo
mkdir chrome
cd chrome
touch userChrome.css
printf 'TabsToolbar {
  visibility: collapse;
}

:root:not([customizing]) #navigator-toolbox:not(:hover):not(:focus-within) {
  max-height: 1px;
  min-height: calc(0px);
  overflow: hidden;
}

#navigator-toolbox::after {
  display: none !important;
}

#main-window[sizemode="maximized"] #content-deck {
  padding-top: 8px;
}
' > userChrome.css
pwd
