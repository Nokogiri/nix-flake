{
  pkgs,
  ...
}: {
  #imports = [
  #];
  home.packages = with pkgs; [
    cliphist
    swayimg
    wl-clipboard
  ];
}
