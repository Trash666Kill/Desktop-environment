#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as sudo"
   	exit 1
else
#
cd $PWD/Repository
#Update and Upgrade
echo "**UPDATING AND UPGRADING**"
apt update && apt upgrade -y
#DE
echo "**INSTALLING THE DESKTOP ENVIRONMENT**"
# apt install --no-install-recommends xorg openbox feh
echo "1"
apt install xorg lightdm openbox feh vim -y
#Conf DE
echo "**SETTING UP THE DESKTOP ENVIRONMENT**"
mkdir /etc/systemd/system/getty@tty1.service.d
cp autologin.conf /etc/systemd/system/getty@tty1.service.d
cp -v default.jpg /usr/share/wallpapers/
#Emperor
rm /home/kiosk/.profile
su - kiosk -c "echo | cp profile /home/emperor/.profile"
su - kiosk -c "echo | mkdir -p /home/emperor/.config/openbox"
su - kiosk -c "echo | cp autostart.sh /home/emperor/.config/openbox"
su - kiosk -c "echo | chmod +x /home/emperor/.config/openbox/autostart.sh"
su - kiosk -c "echo | mkdir -p /home/emperor/Temp"
chown emperor:emperor /usr/share/wallpapers/default.jpg
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
#End
echo "End"
#
fi
