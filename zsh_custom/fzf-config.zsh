[ -f "$ZSH_CUSTOM/fzf/.fzf.zsh" ] && source $ZSH_CUSTOM/fzf/.fzf.zsh

# https://www.youtube.com/watch?v=1a5NiMhqAR0
export FZF_DEFAULT_OPTS="--extended"

export FZF_DEFAULT_COMMAND='fd -H --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
