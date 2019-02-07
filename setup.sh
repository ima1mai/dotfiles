#!/usr/bin/env bash

# tmux
ln -sf "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/.tmux.conf.linux" ~/.tmux.conf.linux
ln -sf "$(pwd)/.tmux.conf.macos" ~/.tmux.conf.macos

# fish
ln -sf "$(pwd)/.config/fish/functions/cp_history_clipboard.fish" ~/.config/fish/functions/cp_history_clipboard.fish
ln -sf "$(pwd)/.config/fish/config.fish" ~/.config/fish/config.fish
ln -sf "$(pwd)/.config/fish/fishfile" ~/.config/fish/fishfile

# nvim
ln -sf "$(pwd)/.config/nvim/init.vim" ~/.config/nvim/init.vim
ln -sf "$(pwd)/.config/nvim/dein.toml" ~/.config/nvim/dein.toml
ln -sf "$(pwd)/.config/nvim/dein_lazy.toml" ~/.config/nvim/dein_lazy.toml

