# yabai config (https://github.com/koekeishiya/yabai/wiki/Tips-and-tricks#split-yabai-configuration-across-multiple-files)
# references from:
#   https://gist.github.com/TomFaulkner/5531bde4f2955c08bcd07d6e308f6d59

#    Yabai setup
# 	set gap padding padding and gaps to 10px
yabai -m config top_padding    5
yabai -m config bottom_padding 5
yabai -m config left_padding   5
yabai -m config right_padding  5
yabai -m config window_gap     10
# 	only show window shadows for floating windows
yabai -m config window_shadow float
# 	render all unfocused windows with 80% opacity
#yabai -m config window_opacity on
#yabai -m config window_opacity_duration 0.0
#yabai -m config active_window_opacity 1.0
#yabai -m config normal_window_opacity 0.95

# always keep laptop apps at full opacity
#yabai -m rule --add app="TogglDesktop" opacity=1.0
#yabai -m rule --add app="Discord" opacity=1.0
#yabai -m rule --add app="Messages" opacity=1.0
#yabai -m rule --add app="Condution" opacity=1.0
#yabai -m rule --add app="Spark" opacity=1.0
#yabai -m rule --add app="Chrome" opacity=1.0

##	don't manage laptop spaces
#yabai -m config --space 17 layout float
#yabai -m config --space 18 layout float
#yabai -m config --space 19 layout float
# ignore applications
yabai -m rule --add app="^System Preferences$"  manage=off
yabai -m rule --add app="^Toggl Track$"         manage=off
yabai -m rule --add app="^Discord$"             manage=off
yabai -m rule --add app="^Messages$"            manage=off
yabai -m rule --add app="^Spark$"               manage=off
yabai -m rule --add app="^Creative Cloud$"      manage=off
yabai -m rule --add app="^Condution$"           manage=off
yabai -m rule --add app="^Finder$"              manage=off
yabai -m rule --add app="^FaceTime$"            manage=off
yabai -m rule --add app="^Numi$"                manage=off

#    	default to bsp
yabai -m config layout bsp

# index=3; eval "$(yabai -m query --spaces | jq --argjson index "${index}" -r '(.[] | select(.index == $index).windows[0]) as $wid | if $wid then "yabai -m window --focus \"" + ($wid | tostring) + "\"" else "skhd --key \"ctrl - " + (map(select(."native-fullscreen" == 0)) | index(map(select(.index == $index))) + 1 % 10 | tostring) + "\"" end')" # from https://github.com/koekeishiya/yabai/issues/205#issuecomment-520027557

#echo 'yabai configuration loaded.'

