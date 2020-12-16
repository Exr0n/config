#!/bin/zsh

alias italics='echo -e "\e[3mitalics?\e[0m"' # TODO: REMOVE

#source /home/exr0n/.config/dontrun_custom/env.zsh

# Custom Aliases
alias tsn='ts-node'
alias trf='ssh exr0n@hop.exr0n.com -p 2222'
alias pls='sudo'
alias u='mkdir -p "$CAPSULEROOT/notes" && v "$CAPSULEROOT/notes/$(date +"%Y_%m_%d").md"'
#    vim tmux integration
#        that moment when you forget what's vim and what's tmux
alias :q='tmux kill-pane'
alias :qa='tmux kill-window'
#    editing
#alias nvim='neovide' # :sun: :glasses: # :( capslock->control doesn't work
alias vim='nvim'
alias v='nvim'
#    git
alias gpl='git pull'
function gpext {
    nohup git push "$@" > /dev/null &
}
alias gp='gpext'
alias grsh='git remote show'
function gutil {
    if [[ -z "$(git status --porcelain)" ]] then
	echo "Nothing to add... commit anyways?"
	read -t 1
    fi
    gpl
    git add ${1:-"."} &&\
    git commit -v --allow-empty
    gp
}
alias gg='gutil'
alias GG='gutil -A'
#    python stuff
alias py='python3'
alias pip='python3 -m pip'
alias pym='python3 -m'
#    screen stuff
alias sl='screen -ls'
alias ss='screen -S '
alias s='trf'
#    tmuxinator
alias mux='tmuxinator'

#    toggl
alias tl='pym toggl'
alias t='pit2ya_crt' # github.com/exr0nprojects/pit2ya
alias tt='t && slep'
alias pt='pit2ya_mod'
#alias t='tl continue "$(tl -s ls -f description | tail -n +2 | fzf)"'
#alias tg='tl ls -f id,description,start,duration | tail -n +2 | fzf | cut -d" " -f 2'
#alias  t='tl continue "$(tl ls -f description | tail -n +2 | fzf)"'
#alias  t='tl continue ${"$(tl ls -f description | tail -n +2 | fzf)": 1}'

alias sus='systemctl suspend'
alias slep='xset dpms force off'
alias pbcopy='xsel --clipboard --input'
alias ss='import png:- | xclip -selection c -t image/png' # https://bbs.archlinux.org/viewtopic.php?id=163312
alias pbpaste='xsel --clipboard --output'
alias vidya='pkill xcape && xcape -e "Caps_Lock=Caps_Lock" && ~/Applications/Lunar\ Client-2.4.0.AppImage && pkill xcape && xcape -e "Caps_Lock=Escape"'

#    makefile
#alias m='make'
alias bear='SDKROOT=$(xcrun --show-sdk-path) \bear'

#    rust/cargo things
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env
alias cn='cargo new --vcs git'
alias cr='cargo run'

# emaaaacs
# alias emacs='open -a emacs --args $CAPSULEROOT/org/inbox.org'
alias emacs='open -a emacs --args $CAPSULEROOT/org/inbox.org'

# other bits
alias ql='mupdf'

# functions
#    cd to parent directory of file, https://askubuntu.com/a/316632
function fcd () {
    if [[ -n "$1" ]]; then
	if [[ -f "$1" ]]; then
	    \cd "$(dirname "$1")"
	else
	    \cd "$1"
	fi
    else
	\cd $HOME
    fi
}
alias c='fcd'
alias ..='"$(dirname "$(pwd)")"'

function chpwd () {	# auto called by zsh
    echo "$(date '+%Y,%m,%d,%H,%M,%S'),$(pwd)" >> $XDG_DATA_HOME/recent_dirs.csv
    #git rev-parse --show-toplevel > /dev/null 2>&1 &&
	echo "$(pwd)" >> $XDG_DATA_HOME/recent_git_dirs.csv
}

function run_generic () {
    files="$(ls 2>/dev/null)"
    # build systems
    if   echo $files | ag '^start\.z?sh$' > /dev/null; then	    # start.sh
	source start.*sh
    elif echo $files | ag '^[Mm]akefile$' > /dev/null; then	    # makefile
	make
    elif echo $files | ag '^yarn\.lock$' > /dev/null; then		    # yarn
	yarn && yarn run
    # standard entry point file names
    else
        TEMP_RUN_HEADER="$(date)\n$(printf "%*s\n" "${COLUMNS:-$(tput cols)}" '' | tr " " "#")"
        if echo $files | ag '^main.*\.cpp$' > /dev/null; then		# cpp
            g++ -std=c++11 main*.cpp -o auto 				&&\
            echo $TEMP_RUN_HEADER && ./auto 				&&\
            setopt +o nomatch && cat *.out 2>/dev/null
        # TODO: dry up following ifs
        elif echo $files | ag '^main\.py$' > /dev/null; then		# python
            echo $TEMP_RUN_HEADER && py main.py
        elif echo $files | ag '^index\.js$' > /dev/null; then		# node index.js
            if echo $files | ag '^package(-lock)?\.json$' > /dev/null; then
                npm install
            fi
            echo $TEMP_RUN_HEADER && node index.js
        elif echo $files | ag '^main\.js$' > /dev/null; then       # node main.js
            echo $TEMP_RUN_HEADER && node main.js
        fi
    fi
}
alias m='run_generic'

#    Alias to auto open files with vim
alias -s {txt,md,cpp,rs,js,mjs,py,properties,yml,yaml}=nvim
alias -s {pdf,html}=ql

#    One off aliases (like config commands)
alias ok='alerter -message hi -timeout 3 -appIcon https://i.imgur.com/1lKcbkC.png'
#hidutil property --set "$($ZSH_CUSTOM/keymap_util/map)" > /dev/null # Replaced by Karabiner
#defaults write -g KeyRepeat -int 1 # https://apple.stackexchange.com/a/83923
#defaults write -g ApplePressAndHoldEnabled -bool false # turn off accentecd characters: https://www.addictivetips.com/mac-os/disable-accented-characters-on-macos/

cd "$(tail -n 1 $XDG_DATA_HOME/recent_dirs.csv | cut -d ',' -f7)"
