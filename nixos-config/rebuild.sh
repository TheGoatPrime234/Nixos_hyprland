#!/usr/bin/env bash

set -e
cd ~/nixos-config

HOST=$(hostname)
#HOST="desktop"

cp /etc/nixos/hardware-configuration.nix "hardware-configuration-${HOST}.nix"

git add . 
echo "Starte Rebuild für Host: ${HOST}..."
sudo nixos-rebuild switch --flake .#${HOST} --quiet

if [ -z "$1" ]; then
	COMMIT_MSG="Auto-Rebuild: (${HOST}) $(date +'%Y-%m-%d %H:%M:%S')"
else
	COMMIT_MSG="$1"
fi

if git diff --cached --quiet; then
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
