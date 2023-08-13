# Screen settings
#xrandr -s 1600x900
#xrandr --output DP-2 --rotate left
#xrandr --output HDMI-2 --same-as HDMI-1
# Wallpaper
feh --bg-fill /usr/share/wallpapers/Spiral/default.jpg
# Always on
xset -dpms &
xset s noblank &
xset s off &
xset dpms force on &
#
lxpanel &
#virt-manager &
#caffeine-indicator &
compton &
