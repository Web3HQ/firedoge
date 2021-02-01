#!/bin/bash
echo "Installing Plasmozill Firefloflis..."
tar --verbose -xf waterfox-G3.0.2.en-US.linux-x86_64.tar.bz2
sudo mkdir /usr/lib/floflis
sudo mkdir /usr/lib/floflis/browser
sudo rm -f /usr/lib/floflis/browser/firefloflis/waterfox # avoids conflicts when upgrading/updating
sudo mv -f waterfox /usr/lib/floflis/browser/firefloflis
