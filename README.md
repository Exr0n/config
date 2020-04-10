# Update submodules
git submodule foreach git pull

# Brew
brew tap cjbassi/ytop
brew install ytop gotop libcairo2 tig flake8 node yarn ripgrep ack gnupg gcc gmp rustup ffmpeg tree wget tmux tmuxinator cmake fzf neovim go coreutils
brew upgrade

# Go things
go get github.com/cjbassi/gotop

# vim plugins
v -c "PlugInstall | qa"
