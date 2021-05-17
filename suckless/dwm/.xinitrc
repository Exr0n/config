blueman-applet &
xset r rate 170 40
xset m 1/1 1
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'
nvidia-settings --assign CurrentMetaMode="DP-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"
xrandr --output HDMI-0 --rotate left
exec dwm

