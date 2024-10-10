{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./config.nix
    ./swaylock.nix
    ./swayosd.nix
    ./user-services.nix
    ./waybar
    #./wlogout.nix
    ./utils
    ../desktop/wayland.nix
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = lib.mkForce "qt5ct";
    QT_STYLE_OVERRIDE = lib.mkForce "Kvantum-Dark";
    XCURSOR_SIZE = "24";
    NIXOS_OZONE_WL = "1";
  };
  home.packages = with pkgs; [ gdk-pixbuf ];
  programs.waybar.systemd = {
    enable = true;
    target = "sway-session.target";
  };
}
