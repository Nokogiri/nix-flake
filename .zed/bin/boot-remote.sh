#!/usr/bin/env bash
set -e

echo -e "\033[1;34minfo:\033[0m copying files..."
sudo rm -rf /tmp/nix-config
sudo cp -r ./ /tmp/nix-config
sudo chown $USER -R /tmp/nix-config
sudo rm -rf /tmp/nix-config/.git

nixos-rebuild --flake /tmp/nix-config#$1 --target-host nokogiri@$1 --use-remote-sudo boot --log-format internal-json -v |& nom --json
