#!/bin/bash

VIM_PATH="$HOME/.vim"
NVIM_PATH="$HOME/.config/nvim"

mkdir -p "$VIM_PATH/.swp" "$VIM_PATH/.backup" "$VIM_PATH/.undo" 2>&1 > /dev/null

curl -fLo $NVIM_PATH/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qa
