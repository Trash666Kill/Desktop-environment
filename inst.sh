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
apt install xorg -y
echo "2"
apt install lightdm openbox obconf lxterminal lxpanel -y
echo "3"
apt install lxtask lxsession-logout lxrandr progress -y
echo "4"
apt install arc-theme ffmpegthumbnailer -y
echo "5"
apt install gpicview evince galculator gnome-screenshot pluma alacarte -y
echo "6"
apt install compton caja unrar-free feh -y
echo "7"
apt install firefox-esr engrampa baobab -y
#Conf DE
echo "**SETTING UP THE DESKTOP ENVIRONMENT**"
rm -v /etc/lightdm/lightdm-gtk-greeter.conf
cp -v debian-swirl.png /usr/share/icons/default/
cp -v default.jpg /usr/share/wallpapers/
tar -xvf 01-Qogir.tar.xz -C /usr/share/icons > /dev/null 2>&1
tar -xvf Arc-Dark.tar.xz -C /usr/share/themes > /dev/null 2>&1
cp -v lightdm-gtk-greeter.conf /etc/lightdm/
cp -v explorer.desktop /usr/share/applications/
#Emperor
cp -v gtkrc-2.0 /home/emperor/.gtkrc-2.0
cp -rv config /home/emperor/.config
chown emperor:emperor -R /home/emperor/.config
chown emperor:emperor -R /usr/share/wallpapers/default.jpg
systemctl set-default multi-user.target
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
#End
echo "End"
#
fi
