{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
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
