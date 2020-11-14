#xrandr --setprovideroutputsource modesetting NVIDIA-0
#xrandr --auto
#xrandr --dpi 96
if xrandr | grep HDMI -q ;then
        laptopoff
fi
~/.fehbg &
# dmenuclearcache &
volumeset &
wup &
exec i3
