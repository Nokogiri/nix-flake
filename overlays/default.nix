# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    rofi-rbw-wayland = prev.rofi-rbw-wayland.overrideAttrs (oldAttrs: {
      patches = (oldAttrs.patches or [ ]) ++ [
        (prev.fetchpatch {
          name = "fuzzel-support.patch";
          url = "https://github.com/natsukium/rofi-rbw/commit/12d53a06c8963b01f7f2b8b7728f514525050bc9.patch";
          includes = [
            "src/rofi_rbw/selector/fuzzel.py"
            "src/rofi_rbw/selector/selector.py"
          ];
          hash = "sha256-tb+lgsv5BRrh3tnHayKxzVASLcc4I+IaCaywMe9U5qk=";
        })
      ];
    });
    #foot = prev.foot.overrideAttrs (old: {
    #  patches = (old.patches or [ ]) ++ [ ./foot-fs-transparency.patch ];
    #});
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
