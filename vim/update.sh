#!/usr/bin/env bash

set -euo pipefail

for plugin in $HOME/.config/vim/bundle/* ; do
  if [[ -f "$plugin/.repo" ]]; then
    repo=`cat "$plugin/.repo"`
    git clone --depth=1 "$repo" "$plugin-new"
    mv "$plugin/.repo" "$plugin-new/.repo"
    rm -rf "$plugin-new/.git"
    find "$plugin-new" -iname ".gitignore" -delete
    rm -rf "$plugin"
    mv "$plugin-new" "$plugin"
  fi
done


#git clone https://github.com/kien/ctrlp.vim
#git clone https://github.com/Shougo/neocomplete.vim.git
#git clone https://github.com/majutsushi/tagbar.git
#git clone https://github.com/SirVer/ultisnips.git
#git clone https://github.com/altercation/vim-colors-solarized
#git clone https://github.com/fatih/vim-go.git
#git clone https://github.com/tpope/vim-repeat
#git clone https://github.com/tpope/vim-surround
#git clone git://github.com/tpope/vim-vinegar.git
#git clone https://github.com/posva/vim-vue.git
