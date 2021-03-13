# set variable
datapath="$XDG_DATA_HOME/custom_alt_active.xdotoolpid"
if [[ ! -f $datapath ]]; then
    xdotool selectwindow > $datapath
else
    kill -0 $(xdotool getwindowpid $(cat $datapath)) || xdotool selectwindow > $datapath
fi
cat $datapath

