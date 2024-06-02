{ pkgs, inputs, ... }:
{

  imports = [ ../defaults.nix ];
  stylix.targets = {
    fish.enable = true;
  };
}
