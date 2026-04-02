#!/usr/bin/env bash

set -e
cd ~/nixos-config
git add . 
echo "Starte Rebuild..."
sudo nixos-rebuild switch --flake .#nixos --quiet

if [ -z "$1" ]; then
	COMMIT_MSG="Auto-Rebuild: $(date +'%Y-%m-%d %H:%M:%S')"
else
	COMMIT_MSG="$1"
fi

if git diff --cached --quiet; then
	echo "Rebuild erfolgreich, aber keine neuen Änderungen zum Commiten"
else    
	cd ~
	git commit -m "$COMMIT_MSG"
	echo "Rebuild erfolgreich und erfolgreich committet: $COMMIT_MSG"
fi
