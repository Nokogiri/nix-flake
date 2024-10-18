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
    hyprlock = inputs.hyprlock.packages.x86_64-linux.hyprlock;
    hypridle = inputs.hypridle.packages.x86_64-linux.hypridle;
  };
}
