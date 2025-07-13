#!/usr/bin/env bash

player=brave

text="$(playerctl --player=${player} metadata --format '{{markup_escape(title)}} - {{markup_escape(artist)}}' 2>/dev/null)"
status="$(playerctl --player=${player} status 2>/dev/null)"

if [[ $status == "Playing" ]]; then
    icon="playing"
elif [[ $status == "Paused" ]]; then
    icon="paused"
else
    text=""
    icon=""
fi

echo "{ \"text\": \"${text}\", \"class\": \"${icon}\", \"alt\": \"${icon}\" }"

