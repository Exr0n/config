# Update submodules
git submodule foreach git pull

# Brew
brew install git-secret gotop libcairo2 tig flake8 node yarn ripgrep ack gnupg gcc gmp rustup ffmpeg tree wget tmux tmuxinator cmake fzf neovim go coreutils
brew upgrade

# other tools
make -C ../scripts/wabt

# vim plugins
v -c "PlugInstall | qa"
