#!/usr/bin/env bash
set -e

echo -e "\033[1;34minfo:\033[0m copying files..."
sudo rm -rf /tmp/nix-config
sudo cp -r /nix/config /tmp/nix-config
sudo chown root:root -R /tmp/nix-config
sudo rm -rf /tmp/nix-config/.git

sudo nixos-rebuild switch --flake /tmp/nix-config#$HOST --log-format internal-json -v |& nom --json
