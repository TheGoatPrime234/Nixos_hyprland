#!/usr/bin/env bash

pkill -9 waybar
pkill -9 swaync
pkill -9 hyprpaper
waybar &
swaync &
hyprpaper &
