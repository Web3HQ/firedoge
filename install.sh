#!/bin/bash
echo "Installing Plasmozill Firedoge..."
tar --verbose -xf include/firefox/firefox-95.0b8.linux-x86_64.tar.bz2
sudo mkdir /usr/lib/floflis
sudo mkdir /usr/lib/floflis/browser
sudo mv -f firefox /usr/lib/floflis/browser/firefox
rsync -av /usr/lib/floflis/browser/firefox/ /usr/lib/floflis/browser/firedoge
sudo rm -rf /usr/lib/floflis/browser/firefox
echo "- Installing Firefloflis in /usr/bin..."
#sudo cat > /usr/bin/firedoge << ENDOFFILE
##!/bin/bash
#
#cd /usr/lib/floflis/browser/firedoge
#./firefox
#ENDOFFILE

#sudo echo "$firedogebin" >> /usr/bin/firedoge

#sudo cat /usr/bin/firedoge

sudo cp -f firedoge /usr/bin/firedoge

echo "- Turning Firedoge into a executable..."
sudo chmod +x /usr/bin/firedoge

echo "Creating settings profile..."
echo "[i] Its normal that your browser opens and closes."
#firedoge
#firedoge & disown firedoge 
(firedoge &) # give time for it to create a user profile

echo "Detecting username..."
if [ -f /etc/floflis-release ]
   then
      flouser=$(jq -r '.name' /1/config/user.json)
   else
      flouser=$(logname)
fi

proceedpersonalizing () {
   #pkill -9 firefox
   pkill -f firefox
   echo "- Installing default theme and settings..."
#>>>>>>>>> ni80y7u3.default-beta
   rsync -av include/patch/firedoge/profile/MaterialFox/ /home/$flouser/.mozilla/firefox/MaterialFox
   cp -f include/patch/firedoge/profile/user-patch.js /home/$flouser/.mozilla/firefox/MaterialFox/user.js
   cd /home/$flouser/.mozilla/firefox
   for D in `find . -mindepth 1 -maxdepth 1 -type d`
   do
#      cp -r -f ./MaterialFox/chrome ${D}
#      cp -f ./MaterialFox/user.js ${D}
#      echo "${D}"
#      pure=$(echo "${D}" | tr -d "/" | tr -d ".")
#      if [[ $pure == *".default-beta"* ]]; then
#         echo "$pure"
#fi
#      if grep -q default-beta <<<"$pure"; then
#         echo "$pure"
#fi

#      if [ "$pure" != "${pure/default-beta/}" ]; then
#         echo "It's there!"
#fi

       if printf -- '%s' "${D}" | egrep -q -- ".default-beta"
          then
#            printf "${D}"
             cp -r -f ./MaterialFox/chrome ${D}
             cp -f ./MaterialFox/user.js ${D}
fi
done
   rm -rf /home/$flouser/.mozilla/firefox/MaterialFox
   echo "[V] Done!"
}

if [ "$(pidof firefox)" ]
   then
      sleep 5
#      if compgen -G "*.default-release" > /dev/null; then
#      echo "pattern exists!"
#fi
      if ls /home/$flouser/.mozilla/firefox/*.default-beta 1> /dev/null 2>&1; then
         proceedpersonalizing
         else
            echo "Installation didn't succeed. Try opening Firedoge icon and re-installing it."
            echo "What happened: Firedoge settings profile wasn't been created"
            echo "(sorry but it isn't a helpful error message; BTW it will be improved <3)"
fi
   else
      echo "Installation didn't succeed. Try opening Firedoge icon and re-installing it."
      echo "What happened: Firedoge didn't openned"
      echo "(sorry but it isn't a helpful error message; BTW it will be improved <3)"
fi
