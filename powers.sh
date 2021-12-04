#!/bin/bash

#sudo apt install xdotool

echo "Detecting username..."
if [ -f /etc/floflis-release ]
   then
      flouser=$(jq -r '.name' /1/config/user.json)
   else
      flouser=$(logname)
fi

cd /home/$flouser/.mozilla/firefox
for D in `find . -mindepth 1 -maxdepth 1 -type d`
do
   if printf -- '%s' "${D}" | egrep -q -- ".default-beta"
      then
#         echo "debug D - ${D}"
         pure=$(echo "${D}" | sed -E 's|^\.{1,2}/||')
         profilefolder="$pure"
fi
done

#until [ "$(pidof firefox)" ] || [ "$(xdotool search --name "Mozilla Firefox")" ]
#do
#   echo "Waiting for Firedoge 🐶 to wake up..."
#   sleep 5s
#done
until [ "$(xdotool search --name "Mozilla Firefox")" ]
do
   echo "Waiting for Firedoge 🐶 to wake up..."
   sleep 2s
done

echo "Detecting doge 🐶 powers..."
CURRENT_WID=$(xdotool getwindowfocus)
WID=""$(xdotool search --name "Mozilla Firefox")""
export WID
#profilefolder="$(/home/$flouser/.mozilla/firefox/*.default-beta 1> /dev/null 2>&1)"
#xdotool windowactivate $CURRENT_WID
until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/{cd7623f4-730d-4f6a-9f6c-6679b44cd906}.xpi ]
do
#   echo "/home/$flouser/.mozilla/firefox/${profilefolder}/{cd7623f4-730d-4f6a-9f6c-6679b44cd906}.xpi"
   echo "Waiting to find Start Page installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
#   WID=""$(xdotool search --name "Mozilla Firefox")""
#   xdotool search --name "Mozilla Firefox"
#   echo "${WID}"
   xdotool windowactivate $WID
done
contents="$(mlq '#startpage = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "Start Page has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/newtabhere@pollti.xpi ]
do
   echo "Waiting to find New Tab Here installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
done
contents="$(mlq '#newtabhere = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "New Tab Here has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/uBlock0@raymondhill.net.xpi ]
do
   echo "Waiting to find uBlock installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
done
contents="$(mlq '#ublock = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "uBlock has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/{e4db92bc-3213-493d-bd9e-5ff2afc72da6}.xpi ]
do
   echo "Waiting to find SingleFileZ installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
done
contents="$(mlq '#singlefilez = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "SingleFileZ has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/{77691beb-4c53-48de-ab20-6589a537717a}.xpi ]
do
   echo "Waiting to find Frame installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
done
contents="$(mlq '#frame = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "Frame has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/ipfs-firefox-addon@lidel.org.xpi ]
do
   echo "Waiting to find IPFS installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
done
contents="$(mlq '#ipfscompanion = "💯 Installed!"' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
xdotool key F5
echo "IPFS has been installed!"

xdotool windowactivate $WID;xdotool key Ctrl+w
#sudo apt remove xdotool
pkill -f xdotool
pkill -f firefox

echo "(✓) Done!";exit 0
