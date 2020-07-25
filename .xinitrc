if xrandr | grep HDMI-1 -q ;then
        laptopoff
fi

~/.fehbg &
dmenuclearcache &
volumeset &
wup &
exec i3
