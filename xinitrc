# keyboard
xset r rate 170 40
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'

# mouse
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 290 1 # natural scrolling
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 301 -0.6 # mouse acceleration
#xset m 3/5 1

# monitors
#nvidia-settings --assign CurrentMetaMode="HDMI-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, DP-1: nvidia-auto-select +4096+0 {ForceCompositionPipeline=On}"
##xrandr --output HDMI-0 --scale 0.5x0.5
#xrandr --output DP-1   --scale 0.5x0.5 --rotate left
# display 2 barley boogaloo
nvidia-settings --assign CurrentMetaMode="DP-0: nvidia-auto-select +0+250 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"
xrandr --output HDMI-0 --rotate left

# applets
#blueman-applet &
#syncthingtray &
syncthing &
slstatus &
eval $(ssh-agent)

# scripts
cd /home/exr0n/projects/Taproot
pwd > ~/.data/taproot_log.txt 
./command.sh >> ~/.data/taproot_log.txt 2>&1 &
cd /
pwd >> ~/.data/taproot_log.txt 

# multilingual keyboard support
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# visuals
xset +fp /usr/share/fonts/local,/usr/share/fonts/TTF

# backgroundd
#feh --bg-center ~/snap/kitten-440379.jpg
#feh --bg-fill --no-xinerama ~/snap/background.jpg
/home/exr0n/projects/backdash/backdash &

# go!
#exec i3
#xcompmgr&
slstatus&
exec dwm

