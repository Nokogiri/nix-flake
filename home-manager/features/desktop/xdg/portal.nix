{ pkgs, inputs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      #pkgs.xdg-desktop-portal-wlr
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = false;
    config = {
      common = {
        default = [
          "gtk"
          "hyprland"
        ];
      };
    };
  };
}
