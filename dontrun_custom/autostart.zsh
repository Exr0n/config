#!/bin/zsh
source $XDG_CONFIG_HOME/dontrun_custom/env.zsh

to_launch=( $HOME/projects/corsaurus )

for projpath in $to_launch; do
    alacritty --hold --working-directory $projpath -e ./start.sh &
done
