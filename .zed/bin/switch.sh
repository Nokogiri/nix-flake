#!/usr/bin/env bash
set -e

echo -e "\033[1;34minfo:\033[0m copying files..."
rm -rf /tmp/nix-config
cp -r ./ /tmp/nix-config
rm -rf /tmp/nix-config/.git

sudo nixos-rebuild switch --flake /tmp/nix-config#$HOST --log-format internal-json -v |& nom --json
