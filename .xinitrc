#!/usr/bin/env sh

#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96
# if xrandr | grep HDMI -q ;then
#         laptopoff
# fi
#eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
#export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
#dbus-update-activation-environment --systemd DISPLAY

#exec gnome-keyring &
# exec intel-virtual-output &
[ -f ~/.Xresources ] && xrdb -merge -I"$HOME" ~/.Xresources
~/.fehbg &
# dmenuclearcache &
volumeset &
wup &
basic_i3 &
dunst &
sleepscreen "no" &
exec i3
