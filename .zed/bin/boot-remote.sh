#!/usr/bin/env bash
set -e

echo -e "\033[1;34minfo:\033[0m copying files..."
rm -rf /tmp/nix-config
cp -r ./ /tmp/nix-config
rm -rf /tmp/nix-config/.git

nixos-rebuild --flake /tmp/nix-config#$1 --target-host nokogiri@$1 --use-remote-sudo boot --log-format internal-json -v |& nom --json
