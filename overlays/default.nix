# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    foot = prev.foot.overrideAttrs (old: {
      patches = (old.patches or [ ]) ++ [ ./foot-fs-transparency.patch ];
    });
    #hyprpaper = inputs.hyprpaper.packages.x86_64-linux.hyprpaper;
    hyprlock = inputs.hyprlock.packages.x86_64-linux.hyprlock;
    hypridle = inputs.hypridle.packages.x86_64-linux.hypridle;
    #hyprland = inputs.hyprland.packages.x86_64-linux.default;
    #iio-hyprland = inputs.iio-hyprland.packages.x86_64-linux.default;
    #fprintd = prev.fprintd.overrideAttrs (_: {
    #  mesonCheckFlags = [
    #    "--no-suite"
    #    "fprintd:TestPamFprintd"
    #  ];
    #});
  };
  #unstable-smallish = self: super: {
  #  chromium = inputs.unstable-small.legacyPackages.x86_64-linux.chromium;
  #};
  #master-pkgs = self: super: {
  #hyprpaper = final: prev: {
  #  inputs.hyprpaper.legacyPackages.x86_64-linux.hyprpaper;
  #};
  #heroic-unwrapped = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic-unwrapped;
  #heroic = inputs.masterpkgs.legacyPackages.x86_64-linux.heroic;
  #tlp = inputs.masterpkgs.legacyPackages.x86_64-linux.tlp;
  #};
}
