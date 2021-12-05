#!/bin/bash

echo "Installing Plasmozill Firedoge..."
tar --verbose -xf include/firefox/firedoge-96.0a1-en-US.linux-x86_64.tar.bz2
sudo mkdir /usr/lib/floflis
sudo mkdir /usr/lib/floflis/browser
sudo mv -f firefox /usr/lib/floflis/browser/firefox
rsync -av /usr/lib/floflis/browser/firefox/ /usr/lib/floflis/browser/firedoge
sudo rm -rf /usr/lib/floflis/browser/firefox
rsync -av include/pages/firstpage/ /usr/lib/floflis/browser/firedoge/defaults/firstpage
cp -f powers.sh /usr/lib/floflis/browser/firedoge/powers.sh

echo "Detecting username..."
if [ -f /etc/floflis-release ]
   then
      flouser=$(jq -r '.name' /1/config/user.json)
      isfloflis="true"
   else
      flouser=$(logname)
      isfloflis="false"
fi

echo "Installing icons..."
sudo rsync -av include/patch/firedoge/app/icons/ /usr/share/icons/hicolor
sudo chmod -R a+rwX /usr/share/icons/hicolor && sudo chown $flouser:$flouser /usr/share/icons/hicolor
sudo cp -f include/patch/firedoge/app/usr-share-applications-firedoge /usr/share/applications/firedoge.desktop

echo "- Installing Firedoge in /usr/bin..."
sudo cp -f firedoge /usr/bin/firedoge

echo "- Turning Firedoge into a executable..."
sudo chmod +x /usr/bin/firedoge

echo "Creating settings profile..."
echo "[i] Its normal that your browser opens and closes."
(firedoge -new-tab -url file:///usr/lib/floflis/browser/firedoge/defaults/firstpage/creatingprofile.html &) # give time for it to create a user profile

proceedpersonalizing () {
   pkill -f firedoge
   echo "- Installing default theme and settings..."
#>>>>>>>>> ni80y7u3.default-beta
   rsync -av include/patch/firedoge/profile/MaterialFox/ /home/$flouser/.mozilla/firefox/MaterialFox
   cp -f include/patch/firedoge/profile/user-patch.js /home/$flouser/.mozilla/firefox/MaterialFox/user.js
   if [[ "$isfloflis" = "true" ]]
   then
      cat >> /home/$flouser/.mozilla/firefox/MaterialFox/user.js <<EOF
user_pref("general.useragent.override", "Mozilla/5.0 (X11; Ubuntu; Floflis/19; Linux x86_64; rv:96.0) Gecko/20100101 Firefox/96.0 Firedoge/96.0");
EOF
fi
#   cp -f include/patch/firedoge/profile/extension-settings.json /home/$flouser/.mozilla/firefox/extension-settings.json
#   rsync -av include/patch/firedoge/profile/extensions/ /home/$flouser/.mozilla/firefox/extensions
#   cp -f include/patch/firedoge/profile/extensions.json /home/$flouser/.mozilla/firefox/extensions.json
#   cp -f include/patch/firedoge/profile/prefs.js /home/$flouser/.mozilla/firefox/prefs.js
#   cp -f include/patch/firedoge/profile/addons.json /home/$flouser/.mozilla/firefox/addons.json
#   cp -f include/patch/firedoge/profile/addonStartup.json.lz4 /home/$flouser/.mozilla/firefox/addonStartup.json.lz4
#   cp -f include/patch/firedoge/profile/content-prefs.sqlite /home/$flouser/.mozilla/firefox/content-prefs.sqlite
   cp -f include/patch/firedoge/profile/sessionstore.jsonlz4 /home/$flouser/.mozilla/firefox/sessionstore.jsonlz4
#   cp -f include/patch/firedoge/profile/cookies.sqlite /home/$flouser/.mozilla/firefox/cookies.sqlite
#   cp -f include/patch/firedoge/profile/permissions.sqlite /home/$flouser/.mozilla/firefox/permissions.sqlite
#   cp -f include/patch/firedoge/profile/places.sqlite /home/$flouser/.mozilla/firefox/places.sqlite
#   cp -f include/patch/firedoge/profile/protections.sqlite /home/$flouser/.mozilla/firefox/protections.sqlite
#   cp -f include/patch/firedoge/profile/storage.sqlite /home/$flouser/.mozilla/firefox/storage.sqlite
#   cp -f include/patch/firedoge/profile/cert9.db /home/$flouser/.mozilla/firefox/cert9.db
#   cp -f include/patch/firedoge/profile/key4.db /home/$flouser/.mozilla/firefox/key4.db
#   cp -f include/patch/firedoge/profile/lock /home/$flouser/.mozilla/firefox/lock
#   cp -f include/patch/firedoge/profile/times.json /home/$flouser/.mozilla/firefox/times.json
#   cp -f include/patch/firedoge/profile/webappsstore.sqlite /home/$flouser/.mozilla/firefox/webappsstore.sqlite
#   rsync -av include/patch/firedoge/profile/browser-extension-data/ /home/$flouser/.mozilla/firefox/browser-extension-data
#   rsync -av include/patch/firedoge/profile/datareporting/ /home/$flouser/.mozilla/firefox/datareporting
#   rsync -av include/patch/firedoge/profile/sessionstore-backups/ /home/$flouser/.mozilla/firefox/sessionstore-backups
#   rsync -av include/patch/firedoge/profile/storage/ /home/$flouser/.mozilla/firefox/storage
#   cp -f include/patch/firedoge/profile/extension-preferences.json /home/$flouser/.mozilla/firefox/extension-preferences.json
#   cp -f include/patch/firedoge/profile/storage-sync-v2.* /home/$flouser/.mozilla/firefox
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

       if printf -- '%s' "${D}" | egrep -q -- ".default-default-2"
          then
#            printf "${D}"
             cp -r -f ./MaterialFox/chrome ${D}
             cp -f ./MaterialFox/user.js ${D}
#             cp -f ./extension-settings.json ${D}
#             rsync -av ./extensions/ ${D}/extensions
#             cp -f ./extensions.json ${D}
#             cp -f ./prefs.js ${D}
#             cp -f ./addons.json ${D}
#             cp -f ./addonStartup.json.lz4 ${D}
#             cp -f ./content-prefs.sqlite ${D}
             cp -f ./sessionstore.jsonlz4 ${D}
#             cp -f ./cookies.sqlite ${D}
#             cp -f ./permissions.sqlite ${D}
#             cp -f ./places.sqlite ${D}
#             cp -f ./protections.sqlite ${D}
#             cp -f ./storage.sqlite ${D}
#             cp -f ./cert9.db ${D}
#             cp -f ./key4.db ${D}
#             cp -f ./lock ${D}
#             cp -f ./times.json ${D}
#             cp -f ./webappsstore.sqlite ${D}
#             rsync -av ./browser-extension-data/ ${D}/browser-extension-data
#             rsync -av ./datareporting/ ${D}/datareporting
#             rsync -av ./sessionstore-backups/ ${D}/sessionstore-backups
#             rsync -av ./storage/ ${D}/storage
#             cp -f ./extension-preferences.json ${D}
#             cp -f ./storage-sync-v2.* ${D}
fi
done
   rm -rf /home/$flouser/.mozilla/firefox/MaterialFox
#   rm -f /home/$flouser/.mozilla/firefox/extension-settings.json
#   rm -rf /home/$flouser/.mozilla/firefox/extensions
#   rm -f /home/$flouser/.mozilla/firefox/extensions.json
#   rm -f /home/$flouser/.mozilla/firefox/prefs.js
#   rm -f /home/$flouser/.mozilla/firefox/addons.json
#   rm -f /home/$flouser/.mozilla/firefox/addonStartup.json.lz4
#   rm -f /home/$flouser/.mozilla/firefox/content-prefs.sqlite
   rm -f /home/$flouser/.mozilla/firefox/sessionstore.jsonlz4
#   rm -f /home/$flouser/.mozilla/firefox/cookies.sqlite
#   rm -f /home/$flouser/.mozilla/firefox/permissions.sqlite
#   rm -f /home/$flouser/.mozilla/firefox/places.sqlite
#   rm -f /home/$flouser/.mozilla/firefox/protections.sqlite
#   rm -f /home/$flouser/.mozilla/firefox/storage.sqlite
#   rm -f /home/$flouser/.mozilla/firefox/cert9.db
#   rm -f /home/$flouser/.mozilla/firefox/key4.db
#   rm -f /home/$flouser/.mozilla/firefox/lock
#   rm -f /home/$flouser/.mozilla/firefox/times.json
#   rm -f /home/$flouser/.mozilla/firefox/webappsstore.sqlite
#   rm -rf /home/$flouser/.mozilla/firefox/browser-extension-data
#   rm -rf /home/$flouser/.mozilla/firefox/datareporting
#   rm -rf /home/$flouser/.mozilla/firefox/sessionstore-backups
#   rm -rf /home/$flouser/.mozilla/firefox/storage
#   rm -f /home/$flouser/.mozilla/firefox/extension-preferences.json
#   rm -f /home/$flouser/.mozilla/firefox/storage-sync-v2.*
   (firedoge --flofirstuse &)
   gnome-terminal --tab --title="Detecting doge 🐶 powers" -- /bin/sh -c 'cd /usr/lib/floflis/browser/firedoge; bash powers.sh; exec bash'
#   CURRENT_WID=$(xdotool getwindowfocus)
#   WID=$(xdotool search --name "Mozilla Firefox")
#   export CURRENT_WID
#   export WID
#   bash /usr/lib/floflis/browser/firedoge/powers.sh
#   echo "(i) Partially installed."
#   echo "Now its up to you: install all the addons Firedoge needs."
   echo "(✓) Done!"
}

until [ "$(pidof firedoge)" ]
do
   echo "Waiting for Firedoge 🐶 to wake up..."
   sleep 3s
done

sleep 5
if ls /home/$flouser/.mozilla/firefox/*.default-default-2 1> /dev/null 2>&1; then
   proceedpersonalizing
   else
      echo "Installation didn't succeed. Try opening Firedoge icon and re-installing it."
      echo "What happened: Firedoge settings profile wasn't been created"
      echo "(sorry but it isn't a helpful error message; BTW it will be improved <3)"
fi

#if [ "$(pidof firedoge)" ]
#   then
#      
#   else
#      echo "Installation didn't succeed. Try opening Firedoge icon and re-installing it."
#      echo "What happened: Firedoge didn't openned"
#      echo "(sorry but it isn't a helpful error message; BTW it will be improved <3)"
#fi
