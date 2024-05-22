{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-wlr ];
    xdgOpenUsePortal = false;
    config = {
      common = {
        default = [ "gtk" "wlr" ];
      };
    };
  };
}
