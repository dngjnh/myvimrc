#!/bin/bash

cd /tmp \
git clone https://github.com/junegunn/vim-plug.git && \
mkdir -p ~/.vim/autoload && \
cp vim-plug/plug.vim ~/.vim/autoload && \
cp myvimrc/vimrc ~/.vimrc && \
rm -rf vim-plug myvimrc
