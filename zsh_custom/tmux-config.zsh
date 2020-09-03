export TMUX_DEFAULT_SESSION='gen'
export TMUX_CONFIG="$CONFIG/tmux/tmux.conf"

# aliases
alias tmux="\tmux -f $TMUX_CONFIG"
alias tls='tmux ls'
alias tad='tmux attach -d -t'
alias td="tad $TMUX_DEFAULT_SESSION"
alias tn='tmux new -s'

# create session
# \tmux ls | grep $TMUX_DEFAULT_SESSION || tn $TMUX_DEFAULT_SESSION
# td # > /dev/null
#[[ -z "$TMUX" ]] && mux $TMUX_DEFAULT_SESSION
