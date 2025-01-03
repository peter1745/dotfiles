#!/bin/zsh

set -eo pipefail

GenerateLink() {
    if [ -e $2 ]
    then
        if [ -L $2 ]
        then
            echo "$2 is a symlink"
        else
            echo "$2 isn't a symlink"
        fi

        echo "Backing up $2 to $2.bak"
        cp $2 $2.bak
    else
        echo "Creating directory $(dirname "$2")"
        mkdir -p "$(dirname "$2")"
    fi

    echo "$2 -> $1"
    ln -sf $1 $2
}

usrcfg=$HOME/.config

cd "$(dirname "$0")"
echo "Setting up dotfiles from: $(pwd)"

# Brave (NOTE: Doesn't respect symlinks, meaning synchronizing it is painful)
# GenerateLink $(pwd)/config/brave/Preferences $usrcfg/BraveSoftware/Brave-Browser/Default/Preferences

# Zed
GenerateLink $(pwd)/config/zed/keymap.json $usrcfg/zed/keymap.json
GenerateLink $(pwd)/config/zed/settings.json $usrcfg/zed/settings.json

# Kitty
GenerateLink $(pwd)/config/kitty/kitty.conf $usrcfg/kitty/kitty.conf
GenerateLink $(pwd)/config/kitty/tokyo-night.conf $usrcfg/kitty/tokyo-night.conf

echo "Done"
