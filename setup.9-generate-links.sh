#!/bin/zsh

set -eo pipefail

GenerateLink() {
    if [ -e $2 ]
    then
        #echo "Backing up $2 to $2.bak"
        cp $2 $2.bak
    else
        #echo "Creating directory $(dirname "$2")"
        mkdir -p "$(dirname "$2")"
    fi

    echo "$2 -> $1"
    ln -sf $1 $2
}

usrcfg=$HOME/.config

cd "$(dirname "$0")"
echo "Setting up dotfiles from: $(pwd)"

# System
GenerateLink $(pwd)/config/.zshrc $HOME/.zshrc
GenerateLink $(pwd)/config/.vimrc $HOME/.vimrc

# Zed
GenerateLink $(pwd)/config/zed/keymap.json $usrcfg/zed/keymap.json
GenerateLink $(pwd)/config/zed/settings.json $usrcfg/zed/settings.json

# Kitty
GenerateLink $(pwd)/config/kitty/kitty.conf $usrcfg/kitty/kitty.conf
GenerateLink $(pwd)/config/kitty/tokyo-night.conf $usrcfg/kitty/tokyo-night.conf

echo "Done"
