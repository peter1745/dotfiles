#!/usr/bin/env bash

process_name=$1
config_file=$2

CONFIG_FILES="${config_file} $HOME/.config/waybar/common.jsonc $HOME/.config/waybar/style.css"

echo $CONFIG_FILES

trap "kill $(pidof -s ${process_name})" EXIT

while true; do
    exec -a $process_name waybar --config $config_file &
    inotifywait -e create,modify $CONFIG_FILES
    #echo "We shouldn't get here yet"
    kill $(pidof -s $process_name)
done
