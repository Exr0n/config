# submodules
git submodule init

# Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git-secret gotop libcairo2 tig flake8 node yarn ripgrep ack gnupg gcc gmp rustup ffmpeg tree wget tmux tmuxinator cmake fzf neovim go coreutils
brew install cmatrix sl fortune cowsay
brew upgrade

# [terminfo](https://github.com/tmux/tmux/issues/2226#issuecomment-633260085)
infocmp -x tmux-256color > $HOME/deleteme
/usr/bin/tic -x $HOME/deleteme
rm $HOME/deleteme

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# other tools
make -C ../scripts/wabt
brew cask install whichspace

# font
# wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin/complete/Roboto%20Mono%20Thin%20Nerd%20Font%20Complete%20Mono.ttf -O RobotoMonoThinNerd.ttf && open RobotMonoThinNerd.ttf
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -O hack-ttf.zip
unzip hack-ttf.zip
open ttf/*

# vim plugins
v -c "PlugInstall | qa"

# [yabai](https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release))
