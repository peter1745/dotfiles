#!/usr/bin/env bash

set -eo pipefail

declare -i new_links=0
declare -i backups=0
declare -i skipped=0

GenerateLink() {
    if [ -e $2 ]; then

        # If target already exists we make a backup
        if [ ! -e $2.bak ]; then
            echo "Backing up $2 to $2.bak"
            cp -r $2 $2.bak

            backups+=1

            if [ $? -eq 0 ] && [ -d $2 ]; then
                # If we succeeded in making a backup and the original
                # is a directory we need to delete the original folder.
                # Otherwise the symbolic link will be placed *inside* that folder.

                rm -rf $2 # NOTE: I'm not the biggest fan of doing this tbh...
            fi
        fi

    else
        echo "Creating directory $(dirname "$2")"
        mkdir -p "$(dirname "$2")"
    fi

    if [ -L $2 ]; then
        skipped+=1
        echo "$2 already linked. Skipping..."
    else
        echo "$2 -> $1"
        ln -sf $1 $2
        new_links+=1
    fi
}

usrcfg=$HOME/.config

cd "$(dirname "$0")"
echo "Setting up dotfiles from: $(pwd)"
echo ""

# System
GenerateLink $(pwd)/config/.zshrc $HOME/.zshrc
GenerateLink $(pwd)/config/.vimrc $HOME/.vimrc

# Hyprland
GenerateLink $(pwd)/config/hypr/hyprland.conf $usrcfg/hypr/hyprland.conf
GenerateLink $(pwd)/config/hypr/hyprpaper.conf $usrcfg/hypr/hyprpaper.conf

# Waybar
GenerateLink $(pwd)/config/waybar/ $usrcfg/waybar

# Zed
GenerateLink $(pwd)/config/zed/keymap.json $usrcfg/zed/keymap.json
GenerateLink $(pwd)/config/zed/settings.json $usrcfg/zed/settings.json

# Kitty
GenerateLink $(pwd)/config/kitty/kitty.conf $usrcfg/kitty/kitty.conf
GenerateLink $(pwd)/config/kitty/tokyo-night.conf $usrcfg/kitty/tokyo-night.conf
GenerateLink $(pwd)/config/kitty/themes/ $usrcfg/kitty/themes

# Wofi
GenerateLink $(pwd)/config/wofi/ $usrcfg/wofi

# Oh My Zsh
GenerateLink $(pwd)/config/oh-my-zsh/custom/ $HOME/.oh-my-zsh/custom

echo ""
echo "Done. $new_links new links. $skipped skipped. $backups backups."
