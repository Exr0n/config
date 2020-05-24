# The Quest For Italics

italics are broken in tmux on my MacOS.

https://raw.githubusercontent.com/tmux/tmux/3.0a/CHANGES says that's because i'm using `screen-256color`instead of `tmux-256color`

except MacOS ships with ncurses 5.7, instead of ncurses v6.
ncurses 5.7 doesn't have the proper tmux terminfo entries

so: https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95

## Later

Apparently italics were never meant to work without a tmux terminfo. And, brew's ncurses seems to have that.

https://github.com/tmux/tmux/issues/1997#issuecomment-615042612

So, I guess it's time to debug this repeating characters thing.

https://github.com/tmux/tmux/issues/2226

