if xrandr | grep HDMI-1 -q ;then
        laptopoff
fi
dmenuclearcache &
volumeset &
wup &
exec i3
