{ pkgs, inputs, ... }:
{

  imports = [
    #./gammastep.nix
    ./wvkbd.nix
  ];
  home.packages = with pkgs; [
    inputs.stable.legacyPackages.x86_64-linux.cliphist
    swayimg
    wl-clipboard
  ];
}
