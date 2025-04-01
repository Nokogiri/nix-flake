#!/bin/sh

nixos-rebuild build --show-trace --flake .#$1 --log-format internal-json -v |& nom --json