#!/usr/bin/env bash

path=$( find /home/ld/Pictures/Images/Wallpapers/ -maxdepth 1 -type f | shuf -n 1 )
uri="file://$path"

gsettings set org.gnome.desktop.background picture-uri "$uri"
gsettings set org.gnome.desktop.background picture-uri-dark "$uri"
