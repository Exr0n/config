# yabai config (https://github.com/koekeishiya/yabai/wiki/Tips-and-tricks#split-yabai-configuration-across-multiple-files)
# references from:
#   https://gist.github.com/TomFaulkner/5531bde4f2955c08bcd07d6e308f6d59

#    Yabai setup
#    	default to bsp
yabai -m config layout bsp
#	don't manage laptop spaces
yabai -m config --space 17 layout float
yabai -m config --space 18 layout float
yabai -m config --space 19 layout float

# 	set gap padding padding and gaps to 10px
yabai -m config top_padding    0
yabai -m config bottom_padding 0
yabai -m config left_padding   0
yabai -m config right_padding  0
yabai -m config window_gap     5
# 	only show window shadows for floating windows
yabai -m config window_shadow float
# 	render all unfocused windows with 90% opacity
yabai -m config window_opacity off
#yabai -m config active_window_opacity 1.0
#yabai -m config normal_window_opacity 0.8
#   TODO: window border?
yabai -m config window_border off

echo 'yabai configuration loaded.'

