#!/bin/sh

#https://github.com/godlygeek/tabular.git
#https://github.com/hallison/vim-rdoc.git
#https://github.com/tpope/vim-fugitive.git
#https://github.com/tpope/vim-markdown.git
#https://github.com/tpope/vim-repeat.git
#https://github.com/tpope/vim-surround.git
#https://github.com/tpope/vim-vividchalk.git
#https://github.com/tsaleh/taskpaper.vim.git
#https://github.com/tsaleh/vim-matchit.git
#https://github.com/tsaleh/vim-shoulda.git
#https://github.com/tsaleh/vim-tcomment.git
#https://github.com/tsaleh/vim-tmux.git

GIT_BUNDLES="https://github.com/ervandew/supertab.git
             https://github.com/msanders/snipmate.vim.git
             https://github.com/pangloss/vim-javascript.git
             https://github.com/scrooloose/nerdtree.git
             https://github.com/tpope/vim-git.git"

VIM_ORG_SCRIPTS=""
if [ ! -d ~/.vim/bundle-available ]; then
        mkdir ~/.vim/bundle-available
fi

cd ~/.vim/bundle-available

for bundle in $GIT_BUNDLES; do
        git clone $bundle
done

#rm ~/.vim/bundle/*
cd ~/.vim/bundle

for bundle in $(ls ../bundle-available); do
        ln -sf ../bundle-available/$bundle $bundle
done
