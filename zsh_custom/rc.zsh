#!/bin/zsh

alias italics='echo -e "\e[3mitalics?\e[0m"' # TODO: REMOVE


# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by Anaconda3 4.0.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# added by Anaconda3 5.0.1 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
export PATH="$HOME/Library/Python/3.7/bin:${PATH}"

# brew ncurses for updated terminfo that includes tmux
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# brew llvm 10.0.0 (clangd)
export PATH="/usr/local/Cellar/llvm/10.0.0_1/bin:$PATH"

export PATH="$ZSH_CUSTOM/../scripts/wabt/bin:$PATH"

# custom bin
export PATH="$ZSH_CUSTOM/bin:$PATH"

# Zsh Completions (https://medium.com/@beatrizmrg/gaining-efficiency-with-iterm-prompt-customization-on-macos-3ad212f5bfde)
# shouldn't need this with zsh-autosuggest # fpath=(/usr/local/share/zsh-completions $fpath)

# env variables
export CONFIG="$HOME/.config"
export XDG_CONFIG_HOME="$CONFIG"
export XDG_DATA_HOME="$HOME/.data"
export ZSH_CUSTOM="$CONFIG/zsh_custom"
export EDITOR="nvim"
#   vim stuff
export VIMROOT="$CONFIG/nvim"
export VIMCONFIG="$VIMROOT"
export MYVIMRC="$VIMCONFIG/vimrc"
export VIMINIT='source $MYVIMRC'

[[ -z "$IDEMODE" ]] && export IDEMODE=1


# Custom Aliases
alias tsn='ts-node'
alias trf='ssh exr0n@hop.exr0n.com -p 2222'
alias pls='sudo'
#    editing
alias vim='nvim'
alias v='nvim'
#    git
alias GG='gpl && gsu && git add -A && git commit; gp'
alias gg='gpl && git add . && git commit; gp'
alias gpl='git pull'
alias gp='nohup git push > /dev/null &'
alias grsh='git remote show'
#    python stuff
alias py='python3'
alias p='python3'
alias pip='python3 -m pip'
alias pym='python3 -m'
#    screen stuff
alias sl='screen -ls'
alias ss='screen -S '
alias s='trf'
#    tmuxinator
alias mux='tmuxinator'

#    makefile
alias m='make'
alias bm='bear make'

# rust/cargo things
[[ -f $HOME/.cargo/env ]] && source $HOME/.cargo/env
alias cn='cargo new --vcs git'
alias cr='cargo run'

# functions
#    cd to parent directory of file, https://askubuntu.com/a/316632
function fcd () { [[ -n "$1" ]] && { [ -f "$1" ] && { \cd "$(dirname "$1")"; } || { \cd "$1"; } ; return; } || { \cd $HOME; } ; }
alias cd='fcd'
alias c='fcd'

#    Alias to auto open files with vim
alias -s {txt,md,cpp,rs,py,properties,yml,yaml}=nvim

#    One off aliases (like config commands)
#alias set_right_alt='cd $ZSH_CUSTOM/keymap_util && hidutil property --set $(./map) && -'
hidutil property --set "$($ZSH_CUSTOM/keymap_util/map)" > /dev/null
defaults write -g KeyRepeat -int 1 # https://apple.stackexchange.com/a/83923
