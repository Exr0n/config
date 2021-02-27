#!/bin/zsh

# keyboard
xset r rate 170 40
setxkbmap -option caps:ctrl_modifier
killall xcape # reset keybindings
xcape -e 'Caps_Lock=Escape;Shift_L=parenleft;Shift_R=parenright;Alt_L=bracketleft;Alt_R=bracketright;Super_L=Shift_L|braceleft;Super_R=Shift_L|braceright'

# mouse
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Accel Speed' -0.6
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Accel Speed' 0.5
