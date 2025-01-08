{pkgs, ...}: {
  home.packages = [
    pkgs.plasma-panel-colorizer
    # pkgs.plasma-applet-virtual-desktop-bar
    pkgs.plasma-hud
  ];
}
