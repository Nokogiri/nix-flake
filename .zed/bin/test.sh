#!/bin/sh

nixos-rebuild test --show-trace --flake .#$1 --log-format internal-json -v |& nom --json
