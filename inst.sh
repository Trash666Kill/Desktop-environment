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
apt install lxtask lxsession-logout lxappearance lxrandr progress -y
echo "4"
apt install arc-theme ffmpegthumbnailer -y
echo "5"
apt install gpicview evince galculator gnome-screenshot pluma alacarte -y
echo "6"
apt install compton caja unrar-free -y
echo "7"
apt install firefox-esr engrampa gparted gnome-disk-utility baobab -y
echo "8"
apt install virt-manager ssh-askpass -y
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
rm -rv /home/emperor/.config
cp -rv config /home/emperor/.config > /dev/null 2>&1
chown emperor:emperor -R /home/emperor/
chown emperor:emperor -R /usr/share/wallpapers/Spiral/
systemctl set-default multi-user.target
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
#End
echo "End"
#
fi
