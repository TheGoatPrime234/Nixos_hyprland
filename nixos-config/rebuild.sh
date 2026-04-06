#!/usr/bin/env bash

set -e
cd ~/nixos-config

#HOST=$(hostname)
HOST="desktop"

cp /etc/nixos/hardware-configuration.nix "hardware-configuration-${HOST}.nix"

git add . 
cd ~/.config
git add btop/
git add cava/
git add hypr/
git add kitty/
git add nvim/
git add quickshell/
git add quickshell/
git add spicetify/
git add swaync/
git add syncthing/
git add waybar/
git add wlogout/
git add yazi/
git add rofi/
cd ~/nixos-config
echo "Starte Rebuild für Host: ${HOST}..."
sudo nixos-rebuild switch --flake .#${HOST} -v

if [ -z "$1" ]; then
	COMMIT_MSG="Auto-Rebuild: (${HOST}) $(date +'%Y-%m-%d %H:%M:%S')"
else
	COMMIT_MSG="$1"
fi

if git diff --cached -v; then
	cd ~
	echo "Rebuild erfolgreich, aber keine neuen Änderungen zum Commiten"
	notify-send "Rebuild erfolgreich (${HOST}), aber kein Commit"
else    
	cd ~
	git commit -m "$COMMIT_MSG"
	echo "Rebuild erfolgreich und erfolgreich committet: $COMMIT_MSG"
	notify-send "Rebuild (${HOST}) erfolgreich: $COMMIT_MSG"
fi

cd ~
