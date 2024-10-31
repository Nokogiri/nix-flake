# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    #hyprlock = inputs.hyprlock.packages.x86_64-linux.hyprlock;
    #hypridle = inputs.hypridle.packages.x86_64-linux.hypridle;
  };
}
