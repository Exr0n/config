#!/bin/zsh

# keyboard
xset r rate 170 40
setxkbmap -option caps:ctrl_modifier
xcape -e 'Caps_Lock=Escape'

# mouse
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Accel Speed' -0.6
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Accel Speed' 0.5
