{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-xapp
    ];
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };
}
