#!/bin/sh
# Verificando se o usuário é root 
if [ $(id -u) -eq 0 ]
then
	# se for root, criar o firefox-app no /bin/
	cp firefox-app.sh /bin/firefox-app
	printf 'foi adicionado à /bin/ o \n comando firefox-app :)'
fi

printf '\n ---- \nlembre-se de rodar esse script em\n sudo pelo menos uma vez para adicionar o \ncomando firefox-app na /bin/\n ----- \n'

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
git clone https://github.com/KubGames/GianWebApps
mv -f GianWebApps/chrome chrome
rm -r -f GianWebApps

printf 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets",true);' > user.js
pwd
