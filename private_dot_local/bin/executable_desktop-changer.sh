#!/usr/bin/env bash

path="$HOME/Pictures/Images/Current Wallpapers"
name=$( ls -t "$path" | tail -n 5 | shuf -n 1 )
fullpath="$path/$name"
touch "$fullpath"
uri="file://$fullpath"

gsettings set org.gnome.desktop.background picture-uri "$uri"
gsettings set org.gnome.desktop.background picture-uri-dark "$uri"
