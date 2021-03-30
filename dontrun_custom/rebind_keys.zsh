#!/bin/zsh
xbindkeys

# keyboard
xset r rate 170 40
setxkbmap -option caps:ctrl_modifier
killall xcape # reset keybindings
xcape -t 200 -e 'Caps_Lock=Escape;Shift_L=bracketleft;Shift_R=bracketright;Alt_L=Shift_L|braceleft;Alt_R=Shift_L|braceright'

# mouse
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Razer Razer DeathAdder 2013' 'libinput Accel Speed' -0.6
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'pointer:Apple Inc. Magic Trackpad 2' 'libinput Accel Speed' 0.5
