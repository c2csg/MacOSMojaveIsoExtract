#!/bin/bash

# This assumes that the ~6GB mojave installer is in the /Applications folder.
# If it's not, just open the App Store, search Mojave, and you can download the installer file from there.

hdiutil create -o /tmp/mojave.cdr -size 6g -layout SPUD -fs HFS+J
hdiutil attach /tmp/mojave.cdr.dmg -noverify -mountpoint /Volumes/install_mojave
sudo /Applications/Install\ macOS\ Mojave.app/Contents/Resources/createinstallmedia --volume /Volumes/install_mojave
mv /tmp/mojave.cdr.dmg ~/Desktop/InstallSystem.dmg
hdiutil detach /Volumes/Install\ macOS\ Mojave
hdiutil convert ~/Desktop/InstallSystem.dmg -format UDTO -o ~/Desktop/mojave.iso
mv ~/Desktop/mojave.iso.cdr ~/Desktop/mojave.iso
rm ~/Desktop/InstallSystem.dmg
# Once run, this will create an ISO on your desktop.
