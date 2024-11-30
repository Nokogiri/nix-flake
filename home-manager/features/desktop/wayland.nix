{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./gammastep.nix
    ./wvkbd.nix
  ];
  home.packages = with pkgs; [
    cliphist
    swayimg
    wl-clipboard
  ];
}
