# Update submodules
git submodule foreach git pull

# Brew
brew install git-secret gotop libcairo2 tig flake8 node yarn ripgrep ack gnupg gcc gmp rustup ffmpeg tree wget tmux tmuxinator cmake fzf neovim go coreutils
brew upgrade

# [terminfo](https://github.com/tmux/tmux/issues/2226#issuecomment-633260085)
infocmp -x tmux-256color > $HOME/deleteme
/usr/bin/tic -x $HOME/deleteme
rm $HOME/deleteme

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# other tools
make -C ../scripts/wabt

# font
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Thin/complete/Roboto%20Mono%20Thin%20Nerd%20Font%20Complete%20Mono.ttf -O RobotoMonoThinNerd.ttf
open RobotoMonoThinNerd.ttf

# vim plugins
v -c "PlugInstall | qa"
