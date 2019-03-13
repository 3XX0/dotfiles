xrandr --dpi 168
xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xrdb -merge ~/.Xresources
exec i3
