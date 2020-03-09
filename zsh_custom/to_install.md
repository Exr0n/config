#!/bin/zsh
# Update submodules
gsu
# Brew
brew install tmuxinator tig flake8 node yarn ack gnupg gcc gmp rustup ffmpeg cmake tmux cmake fzf neovim go coreutils
brew upgrade

# vim plugins
v -c "PlugInstall | qa"
