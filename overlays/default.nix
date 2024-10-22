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
    tlp = prev.tlp.overrideAttrs (old: {
      makeFlags = (old.makeFlags or [ ]) ++ [
        "TLP_ULIB=/lib/udev"
        "TLP_NMDSP=/lib/NetworkManager/dispatcher.d"
        "TLP_SYSD=/lib/systemd/system"
        "TLP_SDSL=/lib/systemd/system-sleep"
        "TLP_ELOD=/lib/elogind/system-sleep"
        "TLP_CONFDPR=/share/tlp/deprecated.conf"
        "TLP_FISHCPL=/share/fish/vendor_completions.d"
        "TLP_ZSHCPL=/share/zsh/site-functions"
      ];
    });
  };
}
