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
echo "1"
apt install --no-install-recommends xorg openbox -y
#Conf DE
echo "**SETTING UP THE DESKTOP ENVIRONMENT**"
mkdir -v /etc/systemd/system/getty@tty1.service.d
cp -v autologin.conf /etc/systemd/system/getty@tty1.service.d
#Emperor
rm -v /home/emperor/.profile
cp -v profile /home/emperor/.profile
chown emperor:emperor /home/emperor/.profile
su - emperor -c "mkdir -pv /home/emperor/.config/openbox"
cp -v autostart.sh /home/emperor/.config/openbox
chmod +x /home/emperor/.config/openbox/autostart.sh
chown emperor:emperor /home/emperor/.config/openbox/autostart.sh
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
#End
echo "End"
#
fi
