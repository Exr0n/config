~/.config/zsh_custom/bin/rebind_keys.zsh

# monitors
#nvidia-settings --assign CurrentMetaMode="HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}, DP-5: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}"
#xrandr --output HDMI-0 --scale 0.5x0.5
##xrandr --output DP-1   --scale 0.5x0.5 --rotate left
#xrandr --output DP-5   --scale 0.5x0.5

# display 2 barley boogaloo
#nvidia-settings --assign CurrentMetaMode="DP-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"
#nvidia-settings --assign CurrentMetaMode="DP-4: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"
#nvidia-settings --assign CurrentMetaMode="DP-1-4: nvidia-auto-select +0+250 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}"

# display attempt 3 charlie choogachoo
nvidia-settings --assign CurrentMetaMode="DP-0: nvidia-auto-select +0+240 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +1920+0 {ForceCompositionPipeline=On}" && xrandr --output HDMI-0 --rotate left # monitors
#nvidia-settings --assign CurrentMetaMode="DP-1: nvidia-auto-select +1920+240 {ForceCompositionPipeline=On}, HDMI-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}" && xrandr --output HDMI-0 --rotate left
#xrandr --output HDMI-0 --scale 0.5

# applets
#blueman-applet &
#syncthingtray &
#syncthing &
#aw-qt &
dex -a&
slstatus &
emacs --daemon
eval $(ssh-agent)
xbindkeys -f ~/.config/xbindkeysrc

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

#sudo dmesg -w > "/home/exr0n/vol/storage/archive/dmesg_logs/$(date -Is).txt" &

/home/exr0n/.config/dontrun_custom/autostart.zsh &

# go!
#exec i3
#xcompmgr&
slstatus&
exec dwm

