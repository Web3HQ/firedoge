#!/bin/bash

CURRENT_WID=$(xdotool getwindowfocus)
#(firedoge --flofirstuse &)
#touch pid.txt
#(firedoge --flofirstuse & echo "$!" >> /media/daniella/B/git/Plasmmer/Plasmozill/firedoge/pid.txt)
#firedoge --flofirstuse & echo $!
#PID=$(echo $!)

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
   if printf -- '%s' "${D}" | egrep -q -- ".default-default-2"
      then
#         echo "debug D - ${D}"
         pure=$(echo "${D}" | sed -E 's|^\.{1,2}/||')
         profilefolder="$pure"
fi
done

#until [[ "$PID" != "" ]]
#do
#   sleep 2s
#done
#echo "$PID"

#until [ "$(pidof firefox)" ] || [ "$(xdotool search --name "Mozilla Firefox")" ]
#do
#   echo "Waiting for Firedoge 🐶 to wake up..."
#   sleep 5s
#done

detecttab () {
if [[ "$(xdotool search --name "Welcome to Firedoge")" = "" ]];then (firedoge -new-tab -url file:///usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html &) fi
}

until [ "$(xdotool search --name "Welcome to Firedoge")" ]
do
#   PID=$(pidof firedoge | awk '{ print $NF }')
   echo "Waiting for Firedoge 🐶 to wake up..."
   sleep 3s
   detecttab
done;WID=""$(xdotool search --name "Welcome to Firedoge")""

echo "Detecting doge 🐶 powers..."
#profilefolder="$(/home/$flouser/.mozilla/firefox/*.default-beta 1> /dev/null 2>&1)"
#xdotool windowactivate $CURRENT_WID
#PID=$(pidof firedoge | awk '{ print $NF }')
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
#   echo "debug pid: $PID"
#   echo "debug wid: $WID"
#   WID=""$(xdotool search --name "Welcome to Firedoge")""
#   if [ $(xdotool search --name "Firedoge" | awk '{ print $NF }') = $(xdotool search --pid $PID | awk '{ print $NF }') ]];then WID=""$(xdotool search --pid $PID | awk '{ print $NF }')"";echo "Success"; fi
#   echo "DEBUG pid: $PID"
#   echo "DEBUG wid: $WID"
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#startpage = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
detecttab
xdotool key F5
echo "Start Page has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/newtabhere@pollti.xpi ]
do
   echo "Waiting to find New Tab Here installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#newtabhere = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
detecttab
xdotool key F5
echo "New Tab Here has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/uBlock0@raymondhill.net.xpi ]
do
   echo "Waiting to find uBlock installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#ublock = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
detecttab
xdotool key F5
echo "uBlock has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/{e4db92bc-3213-493d-bd9e-5ff2afc72da6}.xpi ]
do
   echo "Waiting to find SingleFileZ installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#singlefilez = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
detecttab
xdotool key F5
echo "SingleFileZ has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/{77691beb-4c53-48de-ab20-6589a537717a}.xpi ]
do
   echo "Waiting to find Frame installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#frame = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
xdotool windowactivate $WID
detecttab
xdotool key F5
echo "Frame has been installed!"

until [ -e /home/$flouser/.mozilla/firefox/${profilefolder}/extensions/ipfs-firefox-addon@lidel.org.xpi ]
do
   echo "Waiting to find IPFS installed..."
   sleep 15s
   xdotool windowactivate $CURRENT_WID
   sleep 5s
   xdotool windowactivate $WID
   detecttab
done
contents="$(mlq '#ipfscompanion = ""' /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html)" && \
echo "${contents}" > /usr/lib/floflis/browser/firedoge/defaults/firstpage/index.html
#xdotool key Ctrl+w
#xdotool key F5
echo "IPFS has been installed!"
xdotool windowactivate $CURRENT_WID

#xdotool windowactivate $WID;xdotool key Ctrl+w
#sudo apt remove xdotool
pkill -f xdotool
pkill -f firedoge
exit 0

#echo "(✓) Done!";exit 0
