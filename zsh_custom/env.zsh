# zsh syntax highlighting # TODO: broke on emacs
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/lib/emscripten:$PATH"

# added by Anaconda3 4.0.0 installer
export PATH="$HOME/anaconda/bin:$PATH"

# added by Anaconda3 5.0.1 installer
export PATH="$HOME/anaconda3/bin:$PATH"

# Setting PATH for Python
# The original version is saved in .bash_profile.pysave
export PATH="$HOME/Library/Python/3.7/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH="$HOME/Library/Python/3.8/bin:${PATH}"

# brew ncurses for updated terminfo that includes tmux
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# brew llvm 10.0.0 (clangd)
export PATH="/usr/local/Cellar/llvm/10.0.0_1/bin:$PATH"

export PATH="$ZSH_CUSTOM/../scripts/wabt/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# custom bin
export PATH="$ZSH_CUSTOM/bin:$PATH"

# alacritty
export PATH="$ZSH_CUSTOM/../dontrun_custom/Alacritty.app/Contents/MacOS:$PATH"

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
export IDEMODE=1

