#!/bin/zsh
# Update submodules
git submodule foreach git pull

# Brew
brew install tig flake8 node yarn ripgrep ack gnupg gcc gmp rustup ffmpeg tmux tmuxinator cmake fzf neovim go coreutils
brew upgrade

# vim plugins
v -c "PlugInstall | qa"