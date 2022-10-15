#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as sudo"
   	exit 1
else
#
cd /Repository/desktop-environment-main
#Update and Upgrade
echo "**UPDATING AND UPGRADING**"
apt update && apt upgrade -y
#DE
echo "**INSTALLING THE DESKTOP ENVIRONMENT**"
echo "1"
apt install xorg xserver-xorg-input-libinput xserver-xorg-input-evdev -y
echo "2"
apt install xserver-xorg-input-mouse xserver-xorg-input-synaptics -y
echo "3"
apt install lightdm openbox obconf lxterminal lxpanel xscreensaver lxhotkey-gtk -y
echo "4"
apt install lxtask lxsession-logout lxappearance lxrandr xfce4-power-manager progress -y
echo "5"
apt install arc-theme nitrogen ffmpegthumbnailer -y
echo "6"
apt install gpicview evince galculator gnome-screenshot pluma alacarte -y
echo "7"
apt install compton caja qshutdown unrar -y
echo "8"
apt install firefox-esr caffeine engrampa gparted gnome-disk-utility baobab -y
echo "9"
apt install virt-manager ssh-askpass -y
#Conf DE
echo "**SETTING UP THE DESKTOP ENVIRONMENT**"
rm -v /etc/lightdm/lightdm-gtk-greeter.conf
tar -xvf Spiral.tar.xz -C /usr/share/wallpapers/ > /dev/null 2>&1
tar -xvf 01-Qogir.tar.xz -C /usr/share/icons > /dev/null 2>&1
tar -xvf Arc-Dark.tar.xz -C /usr/share/themes > /dev/null 2>&1
cp -v lightdm-gtk-greeter.conf /etc/lightdm/
cp -v explorer.desktop /usr/share/applications/
#Emperor
rm -rv /home/emperor/.config
tar -xvf home.tar.xz -C /home/emperor/ > /dev/null 2>&1
chown emperor:emperor -R /home/emperor/
chown emperor:emperor -R /usr/share/wallpapers/Spiral/
systemctl set-default multi-user.target
#Cleaning up
echo "**CLEANING UP**"
apt autoremove -y
rm -v /home/emperor/.bash_history
rm -v /root/.bash_history
#End
echo "End"
#
fi
